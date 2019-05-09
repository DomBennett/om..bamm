
#' @name bamm
#' @title bamm
#' @description Run bamm.
#' @param ... Arguments
#' @details Usage: \code{bamm -c <control-file> [--<parameter-name>
#' <parameter-value> ...]}
#' @example examples/bamm.R
#' @export
bamm <- function(...) {
  arglist <- arglist_get(...)
  files_to_send <- filestosend_get(arglist = arglist)
  otsdr <- outsider_init(pkgnm = 'om..bamm', cmd = 'bamm',
                         arglist = arglist, files_to_send = files_to_send)
  run(otsdr)
}
