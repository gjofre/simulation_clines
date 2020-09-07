# Shell scripts used for Admix'em and R scripts used for geographic clines analysis 

# First generate the hybrid zones with admixem. E.g.: path/to/admixemp /path/to/admixsimul_100_01.cfg
# Then convert the markers file to hardcalls using generate_hardcalls_100_01.sh this also  parses into 21 deme files and extract 30 inidividuals.
# Then use generate_frequencies_100_m_01.R script to calculate ancestry frequencies and create the frequencies table
# Then use generate_file_for_HZAR_100_01.sh to generate the input file for geographic cline analysis e.g. simmolecular_100_1.txt
# Finally, use the HZAR script simmolecular_terra_2.R to obtain the cline parameters per locus. 
# 
# Rscript /path/to/simmolecular_terra.R <chrom #> <marker #> <hzar input file>
# E.g. HZAR_pop_100_m_01_gen_100_a.sh for 25 replicates 

