#' Leontief Decomposition
#' 
#' This function runs the Leontief decomposition decomposition
#' 
#' @param x ane object of class decompr
#' @return a data frame containing the square matrix and labelled column and rows
#' @author Bastiaan Quast
#' @references Wang, Zhi, Shang-Jin Wei, and Kunfu Zhu.
#' Quantifying international production sharing at the bilateral and sector levels. 
#' No. w19677. National Bureau of Economic Research, 2013.
#' @export
#' @examples
#' # load oil example data
#' data(oil)
#' 
#' # create intermediate object (class decompr)
#' decompr_object <- load_tables_vectors(inter,
#'                                       final,
#'                                       countries,
#'                                       industries,
#'                                       out        )
#' str(decompr_object)
#' 
#' # run the Leontief decomposition on the decompr object
#' lt  <- leontief(decompr_object)
#' lt


leontief <- function( x ) {
  
  # Part 1 == loading data A,L,Vc, X, Y, E,ESR, etc.
  
  # decompose
  out <- x$Vhat %*% x$B %*% x$Exp
  
  # add row and column names
  out <- as.data.frame(out)
  names(out) <- x$rownam
  row.names(out) <- x$rownam
  
  # return result
  return( out )
  
}

#' Source Decomposition
#' 
#' This function runs the source decomposition decomposition
#' 
#' @param x ane object of class decompr
#' @return a data frame containing the square matrix and labelled column and rows
#' @author Bastiaan Quast
#' @references Wang, Zhi, Shang-Jin Wei, and Kunfu Zhu.
#' Quantifying international production sharing at the bilateral and sector levels. 
#' No. w19677. National Bureau of Economic Research, 2013.
#' @export
#' @examples
#' # load World Input-Output Database for 2011
#' data(wiod)
#' 
#' # create intermediate object (class decompr)
#' decompr_object <- load_tables_vectors(intermediate_demand,
#'                                       final_demand,
#'                                       region_names,
#'                                       industry_names,
#'                                       output              )
#' str(decompr_object)
#' 
#' # run the Kung Fu decomposition on the decompr object
#' kf  <- kung_fu(decompr_object)
#' kf[1:5,1:5]

kung_fu <- leontief