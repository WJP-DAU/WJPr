#' GPP Sample Data
#'
#' A subset of data from the original General Population Poll Data.
#' Countries and years have been renamed and grouped into three fictional
#' countries (Atlantis, Narnia, Neverland) and multiple years.
#'
#' @format ## `gpp`
#' A data frame with 750 rows and 19 columns:
#' \describe{
#'   \item{country}{Country name (Atlantis, Narnia, or Neverland)}
#'   \item{year}{Survey year (2017, 2019, 2022)}
#'   \item{gend}{Gender (1 = Male, 2 = Female)}
#'   \item{age}{Age of respondent}
#'   \item{q1a}{Trust in Institution A (1-4 scale, 99 = Don't know)}
#'   \item{q1b}{Trust in Institution B (1-4 scale, 99 = Don't know)}
#'   \item{q1c}{Trust in Institution C (1-4 scale, 99 = Don't know)}
#'   \item{q1d}{Trust in Institution D (1-4 scale, 99 = Don't know)}
#'   \item{q49a}{Justice System evaluation A (1-4 scale, 99 = Don't know)}
#'   \item{q49b}{Justice System evaluation B (1-4 scale, 99 = Don't know)}
#'   \item{q49c}{Justice System evaluation C (1-4 scale, 99 = Don't know)}
#'   \item{q49d}{Justice System evaluation D (1-4 scale, 99 = Don't know)}
#'   \item{q49e}{Justice System evaluation E (1-4 scale, 99 = Don't know)}
#'   \item{q49f}{Justice System evaluation F (1-4 scale, 99 = Don't know)}
#'   \item{q49g}{Justice System evaluation G (1-4 scale, 99 = Don't know)}
#'   \item{q49h}{Justice System evaluation H (1-4 scale, 99 = Don't know)}
#'   \item{q49i}{Justice System evaluation I (1-4 scale, 99 = Don't know)}
#' }
#'
#' @source \url{https://worldjusticeproject.org/}
"gpp"

#' Rule of Law Index Historical Data
#'
#' Index scores at country-year level for all factors and subfactors
#' from 2012 to 2024. Scores range from 0 to 1, where higher values indicate
#' stronger adherence to the rule of law.
#'
#' @format ## `roli`
#' A data frame with 1,341 rows and 57 columns:
#' \describe{
#'   \item{country}{Country name}
#'   \item{year}{Year of measurement (2012-2024)}
#'   \item{roli}{Overall Rule of Law Index Score (0-1)}
#'   \item{f1}{Factor 1: Constraints on Government Powers}
#'   \item{f2}{Factor 2: Absence of Corruption}
#'   \item{f3}{Factor 3: Open Government}
#'   \item{f4}{Factor 4: Fundamental Rights}
#'   \item{f5}{Factor 5: Order and Security}
#'   \item{f6}{Factor 6: Regulatory Enforcement}
#'   \item{f7}{Factor 7: Civil Justice}
#'   \item{f8}{Factor 8: Criminal Justice}
#'   \item{sf11, sf12, ...}{Subfactor scores (e.g., sf11 = Subfactor 1.1)}
#' }
#'
#' @source \url{https://worldjusticeproject.org/}
"roli"