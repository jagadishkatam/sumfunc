#' to get the descriptive stats
#'
#' @param data input dataframe
#' @param by input by group or group
#' @param var input a continuous column
#'
#' @returns dataframe
#' @export descriptivestats
#'
#' @importFrom rlang enquo
#'
#' @examples
#' descriptivestats(mtcars, rlang::exprs(cyl), mpg)

descriptivestats <- function(data, by, var) {

  var <- enquo(var)  # Capture variable name

  df <- data %>%
    dplyr::group_by(!!!by) %>%  # Unquote list of quosures
    dplyr::summarise(avg = mean({{ var }}, na.rm = TRUE), .groups = "drop") |>
    dplyr::mutate(avg=round(avg,1)) |>
    as.data.frame()

  return(df)
}

