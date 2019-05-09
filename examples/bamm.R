library(outsider)
repo <- 'dombennett/om..bamm'
module_install(repo = repo, force = TRUE)
bamm <- module_import('bamm', repo = repo)
bamm('--version')
module_uninstall(repo = repo)
