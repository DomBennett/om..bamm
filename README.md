
<!--
The README should be used to describe the program. It acts like the homepage of
your module.

Edit README.Rmd not README.md. The .Rmd file can be knitted to parse real-code
examples and show their output in the .md file.

To knit, use devtools::build_readme() or outsider.devtools::build()

Edit the template to describe your program: how to install, import and run;
run exemplary, small demonstrations; present key arguments; provide links and
references to the program that the module wraps.

Learn more about markdown and Rmarkdown:
https://daringfireball.net/projects/markdown/syntax
https://rmarkdown.rstudio.com/
-->

# Run [`BAMM`](https://github.com/macroevolution/bamm) through `outsider` in R

[![Build
Status](https://travis-ci.org/DomBennett/om..bamm.svg?branch=master)](https://travis-ci.org/DomBennett/om..bamm)

> Bayesian Analysis of Macroevolutionary Mixtures: multimodel inference
> on speciation and trait evolution.

<!-- Install information -->

## Install and look up help

``` r
library(outsider)
#> ----------------
#> outsider v 0.1.0
#> ----------------
#> - Security notice: be sure of which modules you install
module_install(repo = "DomBennett/om..bamm")
#> -----------------------------------------------------
#> Warning: You are about to install an outsider module!
#> -----------------------------------------------------
#> Outsider modules install and run external programs
#> via Docker <https://www.docker.com>. These external
#> programs may communicate with the internet and could
#> potentially be malicious.
#> 
#> Be sure to know the module you are about to install:
#> Is it from a trusted developer? Are colleagues using
#> it? Is it supposed to download lots of data? Is it
#> well used (e.g. check number of stars on GitHub)?
#> -----------------------------------------------------
#>  Module information
#> -----------------------------------------------------
#> program: BAMM
#> details: Bayesian Analysis of Macroevolutionary Mixtures
#> docker: dombennett
#> github: dombennett
#> url: https://github.com/DomBennett/om..bamm
#> image: dombennett/om_bamm
#> container: om_bamm
#> package: om..bamm
#> Travis CI: Failing/Erroring
#> -----------------------------------------------------
#> Enter any key to continue or press Esc to quit
#module_help(repo = "DomBennett/om..bamm")
```

<!-- Detailed examples -->

## A detailed example

> The example below is taken from the
> [“Quickstart”](http://bamm-project.org/quickstart.html) guide to
> BAMM

<!-- Note: set eval=TRUE to run example and show output -->

``` r
# ------
# Import
# ------
library(outsider)
bamm <- module_import(fname = 'bamm', repo = "DomBennett/om..bamm")

# ----
# Data
# ----
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

# --------
# Run BAMM
# --------
# run bamm in R by specifying the control file and the directory containing the
# whale tree
bamm(control_file = control_file, indir = wd, outdir = wd)
#> BAMM 2.5.0 (2015-11-01)
#> Copyright (C) 2012-2014 Daniel Rabosky
#> BAMM is distributed under the GNU General Public License.
#> See http://bamm-project.org for more information.
#> 
#> Random seed: 1578565482
#> 
#> Model type: Speciation/Extinction
#> 
#> Reading tree from file <whaletree.tre>.
#> Tree contains 87 taxa.
#> 
#> Initial log-likelihood: -320.928
#> 
#> Reading tree from file <whaletree.tre>.
#> Tree contains 87 taxa.
#> 
#> Initial log-likelihood: -320.928
#> 
#> Reading tree from file <whaletree.tre>.
#> Tree contains 87 taxa.
#> 
#> Initial log-likelihood: -320.928
#> 
#> Reading tree from file <whaletree.tre>.
#> Tree contains 87 taxa.
#> 
#> Initial log-likelihood: -320.928
#> 
#> Running 4 chains for 5000 generations.
#> 
#>   generation    N_shifts    logPrior      logLik   eventRate  acceptRate
#>            0           0    0.120855    -320.928           1           0
#>          100           0    0.550794    -281.301    0.140819        0.33
#>          200           0    0.864617    -278.326    0.151259        0.34
#>          300           0    0.340483     -279.66   0.0404897    0.343333
#>          400           0    -4.61594    -281.881    0.153754        0.33
#>          500           0    -1.04998    -279.804      1.9776        0.33
#>          600           0    0.194349    -279.224    0.815808    0.333333
#>          700           0     1.05498    -277.931  0.00015571    0.338571
#>          800           0    0.418413    -280.321    0.524687     0.33875
#>          900           0    0.491997    -278.595   0.0890751    0.353333
#>         1000           0    0.642924    -281.444     0.29778    0.310689
#>         1100           0   -0.688555    -277.995     1.71079        0.32
#>         1200           0  -0.0410608    -279.383     1.01013        0.29
#>         1300           0    0.126735    -278.798    0.811097    0.293333
#>         1400           0    0.629376    -278.621    0.294506      0.3125
#>         1500           0    0.877972    -279.938   0.0616377       0.296
#>         1600           0    0.662715    -279.154    0.218142    0.311667
#>         1700           0   0.0583391    -278.917    0.836633        0.31
#>         1800           0    0.447147    -278.629    0.465076        0.32
#>         1900           0   -0.307491    -278.369     1.22427    0.307778
#>         2000           0    0.910531     -281.73   0.0146077       0.303
#>         2100           0    0.703315    -278.719    0.145397        0.37
#>         2200           0   -0.349985      -279.4     1.16252       0.325
#>         2300           0    0.474046    -279.482    0.351728    0.296667
#>         2400           0    0.700314    -278.981    0.128112      0.2975
#>         2500           1   -0.988202    -273.154     1.73631       0.324
#>         2600           1    0.732517    -273.211    0.362505    0.351667
#>         2700           1    0.325793    -269.986     0.55776    0.362857
#>         2800           1     1.28111     -272.09    0.127647      0.3725
#>         2900           1     1.03997    -271.732    0.794673    0.382222
#>         3000           0   0.0932895    -278.635    0.749204      0.3009
#>         3100           0     0.91466    -279.159   0.0202795         0.3
#>         3200           0    0.404107    -278.822    0.542965       0.295
#>         3300           0    0.790214      -279.2    0.170817    0.313333
#>         3400           0    0.140791    -278.378    0.859776      0.3375
#>         3500           0    0.952084     -278.42   0.0514136       0.346
#>         3600           0    0.793023    -281.551    0.102102    0.326667
#>         3700           0    0.909591    -280.525   0.0170553    0.315714
#>         3800           0    0.889264    -278.593    0.137039     0.31125
#>         3900           0    0.560865     -280.19   0.0654777    0.317778
#>         4000           1     0.75737    -268.669     1.14175      0.4345
#>         4100           1     1.03006    -269.011    0.777737        0.45
#>         4200           1    0.196819    -267.119     1.32834       0.515
#>         4300           2    -4.23079    -265.531     3.45053        0.55
#>         4400           2    -1.65747    -268.012     1.06074      0.5175
#>         4500           2    -1.50525     -268.97    0.972897       0.506
#>         4600           2    -1.80863    -266.259     1.27233    0.491667
#>         4700           2    -1.74308    -267.007      1.1075    0.475714
#>         4800           3    -2.05465    -264.784     1.09635     0.47125
#>         4900           3    -1.96202     -266.34     2.30536    0.473333
#> 
#> ***********************************************
#> You selected to simulate the prior distribution of shifts.
#> This option has been disabled, as the 
#> exact (analytical) prior is now implemented in BAMMtools. 
#> Please consult the website or BAMMtools documentation 
#> for more information

# ------
# Verify
# ------
# Double check the output, all resulting files are stored in outdir
list.files(wd)
#> [1] "chain_swap.txt"            "event_data.txt"           
#> [3] "mcmc_out.txt"              "run_info.txt"             
#> [5] "whale_diversification.txt" "whaletree.tre"
# peek into the mcmc_out.txt
print(read.csv(file.path(wd, 'mcmc_out.txt')))
#>   generation N_shifts  logPrior   logLik eventRate acceptRate
#> 1          0        0 0.1208550 -320.928 1.0000000   0.000000
#> 2       1000        0 0.6429240 -281.444 0.2977800   0.310689
#> 3       2000        0 0.9105310 -281.730 0.0146077   0.303000
#> 4       3000        0 0.0932895 -278.635 0.7492040   0.300900
#> 5       4000        1 0.7573700 -268.669 1.1417500   0.434500
```

<!-- Remove module after running above example -->

### Key arguments

The `bamm` function in R has three arguments:

  - `control_file`: File path to the text file that specifies all of the
    parameters of the analysis
  - `indir`: File path to the directory containing all of the input
    files (e.g. the tree file). (It’s best to make this folder contain
    *only* the input files.)
  - `outdir`: File path to the directory which will collect all the
    output files.

## Links

Find out more by visiting the [BAMM documentation
website](http://bamm-project.org/documentation.html).

## Please cite

  - Rabosky DL (2014) Automatic Detection of Key Innovations, Rate
    Shifts, and Diversity-Dependence on Phylogenetic Trees. PLOS ONE
    9(2): e89543. <https://doi.org/10.1371/journal.pone.0089543>
  - Rabosky, D., Santini, F., Eastman, J. et al. Rates of speciation and
    morphological evolution are correlated across the largest vertebrate
    radiation. Nat Commun 4, 1958 (2013) <doi:10.1038/ncomms2958>
  - Daniel L. Rabosky, Stephen C. Donnellan, Michael Grundler, Irby J.
    Lovette, Analysis and Visualization of Complex Macroevolutionary
    Dynamics: An Example from Australian Scincid Lizards, Systematic
    Biology, Volume 63, Issue 4, July 2014, Pages 610–627,
    <https://doi.org/10.1093/sysbio/syu025>
  - Shi, J.J. and Rabosky, D.L. (2015), Speciation dynamics during the
    global radiation of extant bats. Evolution, 69: 1528-1545.
    <doi:10.1111/evo.12681>
  - Bennett et al. (2020). outsider: Install and run programs, outside
    of R, inside of R. *Journal of Open Source Software*, In
review

## <!-- Footer -->

<img align="left" width="120" height="125" src="https://raw.githubusercontent.com/ropensci/outsider/master/logo.png">

**An `outsider` module**

Learn more at [outsider
website](https://docs.ropensci.org/outsider/). Want to build your
own module? Check out [`outsider.devtools`
website](https://docs.ropensci.org/outsider.devtools/).
