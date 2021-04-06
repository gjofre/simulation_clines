#!/bin/sh
## script to modify the output from R, and generate the input for hzar
#for simulation with deme sizes of 100 and migration rate of 01
##by Gaston Jofre

cd /Volumes/Gaston_3/hzar_simulations/drift/100_01
for ((i=1;i<=100;i++)) 
do

cd random_mating_100_01_$i


#gen100:

#remove first two rows
sed -e '1,2d' mal_frequencies_100.txt > temp.txt
#then remove first column
cut -f2- temp.txt > temp2.txt
#eliminate quotation marks
sed 's/\"//g' temp2.txt > temp.txt

#create new file and calculate average hybrid index
awk '{ T=0
           for(N=1; N<=NF; N++) T+=$N;
           T/=(NF)
           print T }' temp.txt > mean.txt
#tranpose averages to append
perl /Volumes/Gaston_3/hzar_simulations/drift/transpose.pl mean.txt > mean_t.txt


#transpose main file to use cat
perl /Volumes/Gaston_3/hzar_simulations/drift/transpose.pl temp.txt > temp2.txt

#append
cat temp2.txt mean_t.txt > temp.txt


#appends the file firstcolumns.txt which has site name, location, and sample numbers for HZAR
cat /Volumes/Gaston_3/hzar_simulations/drift/firstcolumns.txt temp.txt > temp2.txt
#transpose back
perl /Volumes/Gaston_3/hzar_simulations/drift/transpose.pl temp2.txt > temp.txt
#cut empty row
cut -f 1,2,3,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115 temp.txt > temp2.txt

#append header
cat /Volumes/Gaston_3/hzar_simulations/drift/header.txt temp2.txt > simmolecular_100.txt

rm temp.txt
rm temp2.txt
rm mean_t.txt
rm mean.txt

#gen1000:

#remove first two rows
sed -e '1,2d' mal_frequencies_1000.txt > temp.txt
#then remove first column
cut -f2- temp.txt > temp2.txt
#eliminate quotation marks
sed 's/\"//g' temp2.txt > temp.txt

#calculate average (hybrid index)
awk '{ T=0
           for(N=1; N<=NF; N++) T+=$N;
           T/=(NF)
           print T }' temp.txt > mean.txt
#tranpose averages to append
perl /Volumes/Gaston_3/hzar_simulations/drift/transpose.pl mean.txt > mean_t.txt


#transpose main file to use cat
perl /Volumes/Gaston_3/hzar_simulations/drift/transpose.pl temp.txt > temp2.txt

#append
cat temp2.txt mean_t.txt > temp.txt


#appends the file firstcolumns.txt which has site name, location, and sample numbers for HZAR
cat /Volumes/Gaston_3/hzar_simulations/drift/firstcolumns.txt temp.txt > temp2.txt
#transpose back
perl /Volumes/Gaston_3/hzar_simulations/drift/transpose.pl temp2.txt > temp.txt
#cut empty row
cut -f 1,2,3,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115 temp.txt > temp2.txt

#append header
cat /Volumes/Gaston_3/hzar_simulations/drift/header.txt temp2.txt > simmolecular_1000.txt

rm temp.txt
rm temp2.txt
rm mean_t.txt
rm mean.txt


#go back one folder to continue iteration
cd ..

done
