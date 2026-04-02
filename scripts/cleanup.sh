# one script that covers cleanup for all possible tests

# only in the models directory
# not in the parsing-tests directory

find ../models -name "*.als" -type f -exec rm -i {} \;

find ../models -name "*-resolved.dsh" -type f -exec rm -i {} \;

# these should be intermediate files, but it is possible
# a file/property has a name that includes the method
find ../models -name "*traces*.dsh" -type f -exec rm -i {} \;
find ../models -name "*electrum*.dsh" -type f -exec rm -i {} \;
find ../models -name "*tcmc*.dsh" -type f -exec rm -i {} \;