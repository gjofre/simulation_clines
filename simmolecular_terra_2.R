rm(list=ls())

library(hzar)
library(doMC)
library(foreach)
library(iterators)
library(doParallel)
library(parallel)

registerDoMC(4)

arrArgs <- commandArgs(trailingOnly = TRUE)
chr_name<-as.character(arrArgs[1])
marker_name<-as.character(arrArgs[2])
file_name<-as.character(arrArgs[3])
marker_var<-paste("g",chr_name,"l",marker_name,sep="") #(as in g1l1)

simmolecular <- read.table(file=file_name, header=TRUE, "\t") #load txt file


marker_var

head(simmolecular[,marker_var], n = 21L)



cbind(length(simmolecular$Distance_.Km.),length(simmolecular[,marker_var]))

#write.table(simmolecular,file="HuazaExLoci.txt", col.names=TRUE, row.names=FALSE,sep="\t",  quote=TRUE) 
## As we no longer need the in-memory copy, drop the local reference 
#simmolecular <- NULL;
## Save all plots in a series of png files

#png(width=900, height=900, res=200, family="Arial", filename="HExPlot%03d.png", pointsize=8,type="cairo")

## A typical chain length. This value is the default setting in the package.
chainLength=1e5;
## Make each model run off a separate seed

mainSeed= 
list(A=c(596,528,124,978,544,99), 
     B=c(528,124,978,544,99,596),
     C=c(124,978,544,99,596,528))

 ## If you have doMC, use foreach in parallel mode to speed up computation,  if not Use foreach in sequential mode 		 
	
#if(require(doMC)){registerDoMC(4)} else { registerDoSEQ(4);}
#reopen file 
#simmolecular <- read.table("simExLoci.txt",header=TRUE)


#print(simmolecular)
## Blank out space in memory to hold molecular analysis

if(length(apropos("^sim$",ignore.case=FALSE)) == 0 || !is.list(sim) ) sim <- list()


## We are doing just the one allele at one locus, but it is
## good to stay organized.
sim$hindex <- list();
## Space to hold the observed data
sim$hindex$obs <- list();
## Space to hold the models to fit
sim$hindex$models <- list();
## Space to hold the compiled fit requests
sim$hindex$fitRs <- list();
## Space to hold the output data chains
sim$hindex$runs <- list();
## Space to hold the analysed data
sim$hindex$analysis <- list();

##### make sure header in input file matches the following)####


sim$hindex$obs <- hzar.doMolecularData1DPops(simmolecular$Distance_Km,simmolecular[,marker_var], simmolecular$N.samples);


## Look at a graph of the observed data
hzar.plot.obsData(sim$hindex$obs);



## Make a helper function

sim.loadMalmodel <- function(scaling,tails, id=paste(scaling,tails,sep=".")) 
sim$hindex$models[[id]] <<- hzar.makeCline1DFreq(sim$hindex$obs, scaling, tails) 

sim.loadMalmodel("fixed","none","modelI");
sim.loadMalmodel("free","none","modelII");
sim.loadMalmodel("free","both","modelIII");

## Check the default settings
print(sim$hindex$models)

## Modify all models to focus on the region where the observed
## data were collected.
## Observations were between 0 and 100 km.
sim$hindex$models <- sapply(sim$hindex$models, hzar.model.addBoxReq,0, 110, simplify=FALSE) 

# Check the updated settings
print(sim$hindex$models)
## Compile each of the models to prepare for fitting
sim$hindex$fitRs$init <- sapply(sim$hindex$models, hzar.first.fitRequest.old.ML, obsData=sim$hindex$obs, verbose=FALSE, simplify=FALSE)
		
## Update the settings for the fitter if desired.
#1
sim$hindex$fitRs$init$modelI$mcmcParam$chainLength <- chainLength
#2
sim$hindex$fitRs$init$modelI$mcmcParam$burnin <- chainLength %/% 10
#3
sim$hindex$fitRs$init$modelI$mcmcParam$seed[[1]] <- mainSeed$A
#4
sim$hindex$fitRs$init$modelII$mcmcParam$chainLength <- chainLength
#5
sim$hindex$fitRs$init$modelII$mcmcParam$burnin <- chainLength %/% 10
#6
sim$hindex$fitRs$init$modelII$mcmcParam$seed[[1]] <- mainSeed$B
#7
sim$hindex$fitRs$init$modelIII$mcmcParam$chainLength <- chainLength
#8
sim$hindex$fitRs$init$modelIII$mcmcParam$burnin <- chainLength %/% 10
#9
sim$hindex$fitRs$init$modelIII$mcmcParam$seed[[1]] <- mainSeed$C

## Check fit request settings

print(sim$hindex$fitRs$init)

## Run just one of the models for an initial chain
sim$hindex$runs$init <- list()

registerDoMC(3)

sim$hindex$runs$init <- foreach(i=1:3) %dopar% {
  hzar.doFit(sim$hindex$fitRs$init[[i]])
}
names(sim$hindex$runs$init) <- c("modelI","modelII","modelIII")



## Plot the trace
plot(hzar.mcmc.bindLL(sim$hindex$runs$init$modelI))


## Plot the trace
plot(hzar.mcmc.bindLL(sim$hindex$runs$init$modelII))


## Plot the trace
plot(hzar.mcmc.bindLL(sim$hindex$runs$init$modelIII))



## Compile a new set of fit requests using the initial chains 

registerDoMC(4)

sim$hindex$fitRs$chains <- mclapply(sim$hindex$runs$init, hzar.next.fitRequest)

## Replicate each fit request 3 times, keeping the original
## seeds while switching to a new seed channel

sim$hindex$fitRs$chains <- hzar.multiFitRequest(sim$hindex$fitRs$chains, each=3,  baseSeed=NULL)


## Go ahead and run a chain of 3 runs for every fit request


sim$hindex$runs$chains <-  hzar.doChain.multi(sim$hindex$fitRs$chains, doPar=TRUE, inOrder=FALSE, count=3) 

## Did modelI converge?
summary(do.call(mcmc.list, mclapply(sim$hindex$runs$chains[1:3], function(x) hzar.mcmc.bindLL(x[[3]]) )) )

## Did modelII converge?

summary(do.call(mcmc.list, mclapply(sim$hindex$runs$chains[4:6], function(x) hzar.mcmc.bindLL(x[[3]]) )) )

# Did modelIII converge?
summary(do.call(mcmc.list, mclapply(sim$hindex$runs$chains[7:9], function(x) hzar.mcmc.bindLL(x[[3]]) )) )

# If not check derryberrry manual
## Start aggregation of data for analysis.  Create a model data group for the null model (expected allele 
## frequency independent of distance along cline) to include in analysis

sim$hindex$analysis$initDGs <- list(nullModel = hzar.dataGroup.null(sim$hindex$obs))

## Create a model data group (hzar.dataGroup object) for each
## model from the initial runs.

sim$hindex$analysis$initDGs$modelI <- hzar.dataGroup.add(sim$hindex$runs$init$modelI)
sim$hindex$analysis$initDGs$modelII <- hzar.dataGroup.add(sim$hindex$runs$init$modelII)
sim$hindex$analysis$initDGs$modelIII <- hzar.dataGroup.add(sim$hindex$runs$init$modelIII)


## Create a hzar.obsDataGroup object from the four hzar.dataGroup  just created, copying the naming scheme (nullModel, modelI, > ## modelII, modelIII).

sim$hindex$analysis$oDG <- hzar.make.obsDataGroup(sim$hindex$analysis$initDGs)

sim$hindex$analysis$oDG <- hzar.copyModelLabels(sim$hindex$analysis$initDGs, sim$hindex$analysis$oDG)

## Convert all 27 runs to hzar.dataGroup objects, adding them to the hzar.obsDataGroup object.

sim$hindex$analysis$oDG <- hzar.make.obsDataGroup(lapply(sim$hindex$runs$chains, hzar.dataGroup.add),  sim$hindex$analysis$oDG);


# Check to make sure that there are only four hzar.dataGroup
# objects named nullModel, modelI, modelII, and modelIII in the
## hzar.obsDataGroup object.

print(summary(sim$hindex$analysis$oDG$data.groups))

#Compare the 3 cline models to the null model graphically

hzar.plot.cline(sim$hindex$analysis$oDG); 

## Do model selection based on the AICc scores

print(sim$hindex$analysis$AICcTable <- hzar.AICc.hzar.obsDataGroup(sim$hindex$analysis$oDG));

## Print out the model with the minimum AICc score

print(sim$hindex$analysis$model.name <- rownames(sim$hindex$analysis$AICcTable)[[ which.min(sim$hindex$analysis$AICcTable$AICc )]])

## Extract the hzar.dataGroup object for the selected model

sim$hindex$analysis$model.selected <- sim$hindex$analysis$oDG$data.groups[[sim$hindex$analysis$model.name]]

## Look at the variation in parameters for the selected mode
sink(paste(marker_var,".txt",sep=""))
print(hzar.getLLCutParam(sim$hindex$analysis$model.selected, names(sim$hindex$analysis$model.selected$data.param)))

## Print the maximum likelihood cline for the selected model 
print(hzar.get.ML.cline(sim$hindex$analysis$model.selected)) 


## Plot the maximum likelihood cline for the selected model 
pdf(paste(marker_var,".pdf",sep=""))

hzar.plot.cline(sim$hindex$analysis$model.selected, pch=2, xlim = c(0,100), ylim=c(0, 1)); 

## Plot the 95% credible cline region for the selected model 

hzar.plot.fzCline(sim$hindex$analysis$model.selected, col='dodgerblue4', fzCol="dodgerblue", pch=2, xlab="Distance", ylab="Mean P 1 Allele Freq.", axes=TRUE, xlim =c(0,100), ylim=c(0, 1))
dev.off()
