##version 2 , instead of for j to etc loops, I am using  for folder in folders loops 
##script to calculate p1 allele frequencies from the admixem simulation with 21 populations
### By Gaston Jofre

#set working directory
folders <-c("random_mating_100_01_1",	"random_mating_100_01_2",	"random_mating_100_01_3",	"random_mating_100_01_4",	"random_mating_100_01_5",	"random_mating_100_01_6",	"random_mating_100_01_7",	"random_mating_100_01_8",	"random_mating_100_01_9",	"random_mating_100_01_10",	"random_mating_100_01_11",	"random_mating_100_01_12",	"random_mating_100_01_13",	"random_mating_100_01_14",	"random_mating_100_01_15",	"random_mating_100_01_16",	"random_mating_100_01_17",	"random_mating_100_01_18",	"random_mating_100_01_19",	"random_mating_100_01_20",	"random_mating_100_01_21",	"random_mating_100_01_22",	"random_mating_100_01_23",	"random_mating_100_01_24",	"random_mating_100_01_25",	"random_mating_100_01_26",	"random_mating_100_01_27",	"random_mating_100_01_28",	"random_mating_100_01_29",	"random_mating_100_01_30",	"random_mating_100_01_31",	"random_mating_100_01_32",	"random_mating_100_01_33",	"random_mating_100_01_34",	"random_mating_100_01_35",	"random_mating_100_01_36",	"random_mating_100_01_37",	"random_mating_100_01_38",	"random_mating_100_01_39",	"random_mating_100_01_40",	"random_mating_100_01_41",	"random_mating_100_01_42",	"random_mating_100_01_43",	"random_mating_100_01_44",	"random_mating_100_01_45",	"random_mating_100_01_46",	"random_mating_100_01_47",	"random_mating_100_01_48",	"random_mating_100_01_49",	"random_mating_100_01_50",	"random_mating_100_01_51",	"random_mating_100_01_52",	"random_mating_100_01_53",	"random_mating_100_01_54",	"random_mating_100_01_55",	"random_mating_100_01_56",	"random_mating_100_01_57",	"random_mating_100_01_58",	"random_mating_100_01_59",	"random_mating_100_01_60",	"random_mating_100_01_61",	"random_mating_100_01_62",	"random_mating_100_01_63",	"random_mating_100_01_64",	"random_mating_100_01_65",	"random_mating_100_01_66",	"random_mating_100_01_67",	"random_mating_100_01_68",	"random_mating_100_01_69",	"random_mating_100_01_70",	"random_mating_100_01_71",	"random_mating_100_01_72",	"random_mating_100_01_73",	"random_mating_100_01_74",	"random_mating_100_01_75",	"random_mating_100_01_76",	"random_mating_100_01_77",	"random_mating_100_01_78",	"random_mating_100_01_79",	"random_mating_100_01_80",	"random_mating_100_01_81",	"random_mating_100_01_82",	"random_mating_100_01_83",	"random_mating_100_01_84",	"random_mating_100_01_85",	"random_mating_100_01_86",	"random_mating_100_01_87",	"random_mating_100_01_88",	"random_mating_100_01_89",	"random_mating_100_01_90",	"random_mating_100_01_91",	"random_mating_100_01_92",	"random_mating_100_01_93",	"random_mating_100_01_94",	"random_mating_100_01_95",	"random_mating_100_01_96",	"random_mating_100_01_97",	"random_mating_100_01_98",	"random_mating_100_01_99",	"random_mating_100_01_100")

for(folder in folders){
setwd(file.path("/Volumes/Gaston_3/hzar_simulations/drift/100_01/",folder))

## set path to upload files:
path = setwd(file.path("/Volumes/Gaston_3/hzar_simulations/drift/100_01/",folder))

#create matrix to locate the outputs:




#Generation 100
filenames <-c("100_21.txt",	"100_19.txt",	"100_18.txt",	"100_17.txt",	"100_16.txt",	"100_15.txt",	"100_14.txt",	"100_13.txt",	"100_12.txt",	"100_11.txt",	"100_10.txt",	"100_9.txt",	"100_8.txt",	"100_7.txt",	"100_6.txt",	"100_5.txt",	"100_4.txt",	"100_3.txt",	"100_2.txt",	"100_1.txt",	"100_20.txt")

mal_allelefreq <-  matrix(nrow=1,ncol=110)

out.file<-""
for (filename in filenames) {
  				
  				hyb <- read.table(filename,header=TRUE, sep="\t")
 				#hyb becomes file n and now we create a matrix to locate the frequencies
  				genotypic <-  matrix(nrow=3,ncol=1)
				for (i in 1:110){
			
								genotypic[1,] <- length(which(hyb[,i] == 0)) 
								genotypic[2,] <- length(which(hyb[,i] == 1)) 
								genotypic[3,] <- length(which(hyb[,i] == 2)) 
		

								#to calculate the frequencies and pipe them to mal_allelefreq file:
								mal_allelefreq[,i] <- (genotypic[1,1]+(genotypic[2,1]/2))/sum(genotypic[,1])
								}
	
				out.file <- rbind(out.file, mal_allelefreq)

				}

write.table(out.file, file = "mal_frequencies_100.txt",sep="\t")


#Generation 500

#generation 1000
filenames <-c("1000_21.txt",	"1000_19.txt",	"1000_18.txt",	"1000_17.txt",	"1000_16.txt",	"1000_15.txt",	"1000_14.txt",	"1000_13.txt",	"1000_12.txt",	"1000_11.txt",	"1000_10.txt",	"1000_9.txt",	"1000_8.txt",	"1000_7.txt",	"1000_6.txt",	"1000_5.txt",	"1000_4.txt",	"1000_3.txt",	"1000_2.txt",	"1000_1.txt",	"1000_20.txt")

mal_allelefreq <-  matrix(nrow=1,ncol=110)

out.file<-""

for (filename in filenames) {
  				
  				hyb <- read.table(filename,header=TRUE, sep="\t")
 				#hyb becomes file n and now we create a matrix to locate the frequencies
  				genotypic <-  matrix(nrow=3,ncol=1)
				for (i in 1:110){
			
								genotypic[1,] <- length(which(hyb[,i] == 0)) 
								genotypic[2,] <- length(which(hyb[,i] == 1)) 
								genotypic[3,] <- length(which(hyb[,i] == 2)) 
		

								#to calculate the frequencies and pipe them to mal_allelefreq file:
								mal_allelefreq[,i] <- (genotypic[1,1]+(genotypic[2,1]/2))/sum(genotypic[,1])
								}
	
				out.file <- rbind(out.file, mal_allelefreq)

				}

write.table(out.file, file = "mal_frequencies_1000.txt",sep="\t")



}