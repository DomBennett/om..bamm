library(outsider)
bamm <- module_import('bamm', repo = 'dombennett/om..bamm')

# create temp directory to contain test input and output data
wd <- file.path(tempdir(), 'testing_bamm')
if(!dir.exists(wd)) {
  dir.create(wd)
}
# download modified template control file for a "speciation-extinction"
# analysis of whales
url <- 'https://raw.githubusercontent.com/DomBennett/om..bamm/master/test_data/whale_diversification.txt'
control_file <- file.path(wd, 'whale_diversification.txt')
download.file(url = url, destfile = control_file)
# download a tree whales
url <- 'https://raw.githubusercontent.com/DomBennett/om..bamm/master/test_data/whaletree.tre'
download.file(url = url, destfile = file.path(wd, 'whaletree.tre'))

# run bamm in R by specifying the control file and the directory containing the
# whale tree
bamm(control_file = control_file, indir = wd, outdir = wd)

# clean up
unlink(x = wd, recursive = TRUE, force = TRUE)
