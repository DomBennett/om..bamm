pkgnm <- environmentName(env = environment())

#' @name bamm
#' @title bamm
#' @description Run bamm.
#' @param ... Arguments
#' @details Usage: \code{bamm -c <control-file> [--<parameter-name>
#' <parameter-value> ...]}
#' @example examples/bamm.R
#' @export
bamm <- function(...) {
  args <- outsider::.args_parse(...)
  files_to_send <- outsider::.which_args_are_filepaths(args)
  outsider::.run(pkgnm = pkgnm, files_to_send = files_to_send, 'bamm', args)
}
