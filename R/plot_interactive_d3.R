#' Plots D3-based Interactive Ceteris Paribus Explanations
#'
#' Function 'plot_interactive_d3.ceteris_paribus_explainer' plots interactive version of Ceteris Paribus Plots for selected observations.
#' Various parameters help to decide what should be plotted, profiles, aggregated profiles, points or rugs.
#' 
#' @param model a ceteris paribus explainer produced with function `ceteris_paribus()`
#' @param ... other explainers that shall be plotted together
#' @param selected_variables if not NULL then only `selected_variables` will be presented
#' @param color a character. Either name of a color or name of a variable that should be used for coloring
#' @param width a numeric. Width (in px) of the whole plot
#' @param height a numeric. Heigth (in px) of the whole plot
#' @param no_colors a numeric. Number of colors in legend for sequential scales
#' @param categorical_order a list. List with order of values for categorical variables
#' @param size_rugs a numeric. Size of rugs to be plotted
#' @param alpha_rugs a numeric between 0 and 1. Opacity of rug lines
#' @param color_rugs a character. Name of a color. If NULL elements are plotted according to 'color' arguments
#' @param color_points a character. Name of a color. If NULL elements are plotted according to 'color' arguments
#' @param color_residuals a character. Name of a color. If NULL elements are plotted according to 'color' arguments
#' @param color_pdps a character. Name of a color. If NULL elements are plotted according to 'color' arguments
#' @param alpha_residuals a numeric between 0 and 1. Opacity of residuals
#' @param alpha_points a numeric between 0 and 1. Opacity of points
#' @param alpha_ices a numeric between 0 and 1. Opacity of ICE lines
#' @param alpha_pdps a numeric between 0 and 1. Opacity of PDP lines
#' @param size_points a numeric. Size of points to be plotted
#' @param size_residuals a numeric. Size of residuals (lines and points) to be plotted
#' @param size_ices a numeric. Size of ICE lines to be plotted
#' @param size_pdps a numeric. Size of PDP lines to be plotted
#' @param show_profiles a logical. If TRUE then individual profiles will be plotted
#' @param show_observations a logical. If TRUE then individual observations will be marked as points
#' @param show_rugs a logical. If TRUE then individual observations will be marked as rugs
#' @param show_residuals a logical. If TRUE then residuals will be plotted as a line ended with a point
#' @param aggregate_profiles a character. Either 'mean' or 'median'. If not NULL then profiles will be aggregated according to chosen metric and the aggregate profiles will be plotted
#'
#'
#' @return a ceterisParibusD3 object
#' @name plot_interactive_d3
#' @export
#'
#' @examples
#' library("DALEX")
#'  \dontrun{
#' library("ceterisParibusD3")
#' library("randomForest")
#' set.seed(59)
#'
#' apartments_rf_model <- randomForest(m2.price ~ construction.year + surface + floor +
#'                                      no.rooms + district,
#'                                    data = apartments)
#'
#' explainer_rf <- explain(apartments_rf_model,
#'                        data = apartmentsTest[,2:6],
#'                        y = apartmentsTest$m2.price)
#'
#' apartments_A <- apartmentsTest[958,]
#'
#' cp_rf_A <- ceteris_paribus(explainer_rf, apartments_A, y = apartments_A$m2.price)
#'
#' plot_interactive_d3(cp_rf_A, show_profiles = TRUE, show_observations = TRUE,
#'                 selected_variables = c("surface","construction.year"))
#'}

plot_interactive_d3.ceteris_paribus_explainer <- function(model, ...,
  selected_variables = NULL,
  color = NULL,
  width = NULL,
  height = NULL,
  no_colors = NULL,
  categorical_order  = NULL,
  size_rugs  = NULL,
  alpha_rugs = NULL,
  color_rugs = NULL,
  color_points = NULL,
  color_residuals = NULL,
  color_pdps = NULL,
  alpha_residuals = NULL,
  alpha_points = NULL,
  alpha_ices = NULL,
  alpha_pdps = NULL,
  size_points = NULL,
  size_residuals = NULL,
  size_ices = NULL,
  size_pdps = NULL,
  show_profiles = TRUE,
  show_observations = TRUE,
  show_rugs = NULL,
  show_residuals = NULL,
  aggregate_profiles = NULL){
  
  if (!requireNamespace("ceterisParibusD3", quietly = TRUE)) {
    stop("You have to first install library 'ceterisParibusD3' from github.", call. = FALSE)
  }
  
  ceterisParibusD3::ceterisParibusD3(model = model, ...,
                   selected_variables = selected_variables,
                   color = color,
                   width = width,
                   height = height,
                   no_colors = no_colors,
                   categorical_order  = categorical_order,
                   size_rugs  = size_rugs,
                   alpha_rugs = alpha_rugs,
                   color_rugs = color_rugs,
                   color_points = color_points,
                   color_residuals = color_residuals,
                   color_pdps = color_pdps,
                   alpha_residuals = alpha_residuals,
                   alpha_points = alpha_points,
                   alpha_ices = alpha_ices,
                   alpha_pdps = alpha_pdps,
                   size_points = size_points,
                   size_residuals = size_residuals,
                   size_ices = size_ices,
                   size_pdps = size_pdps,
                   show_profiles = show_profiles,
                   show_observations = show_observations,
                   show_rugs = show_rugs,
                   show_residuals = show_residuals,
                   aggregate_profiles = aggregate_profiles)
  
}

#' @name plot_interactive_d3
#' @export
plot_interactive_d3 <- function (x, ...) {
  UseMethod("plot_interactive_d3", x)
}

#' @name plot_interactive_d3
#' @export
plot_interactive_d3.default <- plot_interactive_d3.ceteris_paribus_explainer
