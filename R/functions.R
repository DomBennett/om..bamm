
#' @name bamm
#' @title bamm
#' @description Run bamm.
#' @param ... Arguments
#' @details Usage: \code{bamm -c <control-file> [--<parameter-name>
#' <parameter-value> ...]}
#' @example examples/bamm.R
#' @export
bamm <- function(...) {
  arglist <- outsider::.arglist_get(...)
  files_to_send <- outsider::.filestosend_get(arglist = arglist)
  launcher <- outsider::launcher_class(repo = 'dombennett/om..bamm',
                                       cmd = 'bamm', arglist = arglist,
                                       files_to_send = files_to_send)
  outsider::run(launcher)
}
