
#' @name bamm
#' @title bamm: Bayesian Analysis of Macroevolutionary Mixtures
#' @description Run bamm through R.
#' @param control_file File path to control file
#' @param indir File path to directory containting all input files specified in
#' the control file.
#' @param outdir File path to directory where all resulting files will be
#' placed.
#' @details \code{control_file} is equivalent to the \code{-c} option in the
#' command line version of the program. By default, the command-line version
#' looks in the folder where it was launched to find files specified in the
#' control file (e.g. tree file). In this version, the \code{indir} determines
#' where input files are contained.
#' 
#' For efficiency, it is based to specify an \code{indir} folder that contains
#' \emph{only} the files required to run the BAMM analysis.
#' @example examples/bamm.R
#' @export
bamm <- function(control_file, indir, outdir=indir) {
  arglist <- c('-c', basename(control_file))
  files_to_send <- file.path(indir, list.files(path = indir))
  files_to_send <- unique(c(control_file, files_to_send))
  tmp_outdir <- file.path(tempdir(), 'bamm_tmp')
  if (!dir.exists(tmp_outdir)) {
    dir.create(tmp_outdir)
  }
  on.exit(unlink(tmp_outdir, recursive = TRUE, force = TRUE))
  otsdr <- outsider_init(pkgnm = 'om..bamm', cmd = 'bamm',
                         arglist = arglist, files_to_send = files_to_send,
                         wd = tmp_outdir)
  res <- run(otsdr)
  result_files <- list.files(tmp_outdir)
  ignr_files <- c(basename(control_file), list.files(path = indir))
  result_files <- result_files[!result_files %in% ignr_files]
  for (result_file in result_files) {
    file.copy(from = file.path(tmp_outdir, result_file), to = outdir)
  }
  invisible(res)
}
