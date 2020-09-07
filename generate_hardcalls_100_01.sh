#!/bin/sh
##version 2, optimized sampling per deme
#N = 100 with m=01
#by Gaston Jofre

cd /Volumes/Gaston_3/hzar_simulations/drift/100_01
for ((i=1;i<=100;i++)) 
do
cd random_mating_100_01_$i

#Generation 100
#Convert Admix'em markers file output to hardcalls

perl /Volumes/Gaston_3/hzar_simulations/drift/scripts/generate_msg_output.pl Gen100_markers.txt randommating_100.txt
#gen100_eliminate extra lines

head -n 101 randommating_100.txt > 100_21.txt
sed -n -e 1p -e 2022,2121p randommating_100.txt > 100_20.txt
sed -n -e 1p -e 2122,2221p randommating_100.txt > 100_1.txt
sed -n -e 1p -e 2222,2321p randommating_100.txt > 100_2.txt
sed -n -e 1p -e 2322,2421p randommating_100.txt > 100_3.txt
sed -n -e 1p -e 2422,2521p randommating_100.txt > 100_4.txt
sed -n -e 1p -e 2522,2621p randommating_100.txt > 100_5.txt
sed -n -e 1p -e 2622,2721p randommating_100.txt > 100_6.txt
sed -n -e 1p -e 2722,2821p randommating_100.txt > 100_7.txt
sed -n -e 1p -e 2822,2921p randommating_100.txt > 100_8.txt
sed -n -e 1p -e 2922,3021p randommating_100.txt > 100_9.txt
sed -n -e 1p -e 3022,3121p randommating_100.txt > 100_10.txt
sed -n -e 1p -e 3122,3221p randommating_100.txt > 100_11.txt
sed -n -e 1p -e 3222,3321p randommating_100.txt > 100_12.txt
sed -n -e 1p -e 3322,3421p randommating_100.txt > 100_13.txt
sed -n -e 1p -e 3422,3521p randommating_100.txt > 100_14.txt
sed -n -e 1p -e 3522,3621p randommating_100.txt > 100_15.txt
sed -n -e 1p -e 3622,3721p randommating_100.txt > 100_16.txt
sed -n -e 1p -e 3722,3821p randommating_100.txt > 100_17.txt
sed -n -e 1p -e 3822,3921p randommating_100.txt > 100_18.txt
sed -n -e 1p -e 3922,4021p randommating_100.txt > 100_19.txt
cp 100_10.txt 100_10_for_correlation.txt

#extract 30 individuals per pop

for ((j=1;j<=21;j++)) 
do
head -31 100_$j.txt > temp.txt
mv temp.txt 100_$j.txt
rm temp.txt
done

#gen1000

#gen1000-Convert to hardcalls
perl /Volumes/Gaston_3/hzar_simulations/drift/generate_msg_data_header_10locisim.pl gen1000_markers.txt randommating_1000.txt
head -n 101 randommating_1000.txt > 1000_21.txt
sed -n -e 1p -e 2022,2121p randommating_1000.txt > 1000_20.txt
sed -n -e 1p -e 2122,2221p randommating_1000.txt > 1000_1.txt
sed -n -e 1p -e 2222,2321p randommating_1000.txt > 1000_2.txt
sed -n -e 1p -e 2322,2421p randommating_1000.txt > 1000_3.txt
sed -n -e 1p -e 2422,2521p randommating_1000.txt > 1000_4.txt
sed -n -e 1p -e 2522,2621p randommating_1000.txt > 1000_5.txt
sed -n -e 1p -e 2622,2721p randommating_1000.txt > 1000_6.txt
sed -n -e 1p -e 2722,2821p randommating_1000.txt > 1000_7.txt
sed -n -e 1p -e 2822,2921p randommating_1000.txt > 1000_8.txt
sed -n -e 1p -e 2922,3021p randommating_1000.txt > 1000_9.txt
sed -n -e 1p -e 3022,3121p randommating_1000.txt > 1000_10.txt
sed -n -e 1p -e 3122,3221p randommating_1000.txt > 1000_11.txt
sed -n -e 1p -e 3222,3321p randommating_1000.txt > 1000_12.txt
sed -n -e 1p -e 3322,3421p randommating_1000.txt > 1000_13.txt
sed -n -e 1p -e 3422,3521p randommating_1000.txt > 1000_14.txt
sed -n -e 1p -e 3522,3621p randommating_1000.txt > 1000_15.txt
sed -n -e 1p -e 3622,3721p randommating_1000.txt > 1000_16.txt
sed -n -e 1p -e 3722,3821p randommating_1000.txt > 1000_17.txt
sed -n -e 1p -e 3822,3921p randommating_1000.txt > 1000_18.txt
sed -n -e 1p -e 3922,4021p randommating_1000.txt > 1000_19.txt
cp 1000_10.txt 1000_10_for_correlation.txt

#extract 30 individuals per pop

for ((j=1;j<=21;j++)) 
do

head -31 1000_$j.txt > temp.txt
mv temp.txt 1000_$j.txt
done
cd ..		
						

done