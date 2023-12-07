txt = readLines("/home/hendrik/Downloads/AoC/day01input")

## part I
l = gregexpr("[[:digit:]]", text = txt) |> 
  lapply(FUN = range) 

mapply(
  \(t, f){
    paste0(
      substr(t, f[1], f[1])
      , substr(t, f[2], f[2])
    ) |> 
      as.numeric()
  }
  , t = txt
  , f = l
  , SIMPLIFY = FALSE
) |> 
  unname() |> 
  unlist() |> 
  sum(na.rm = TRUE)

## part II
pat = c(
  "one", "two", "three"
  , "four", "five", "six"
  , "seven", "eight", "nine"
)

new = pat 
substr(
  new
  , start = 2
  , stop = 2
) = as.character(1:9)

txt_digits = Map(
  stringi::stri_replace_all_fixed
  , str = txt
  , pattern = list(pat)
  , replacement = list(new)
  , vectorize_all = FALSE
) |> 
  unlist() |> 
  unname()

l = gregexpr("[[:digit:]]", text = txt_digits) |> 
  lapply(FUN = range) 

mapply(
  \(t, f){
    paste0(
      substr(t, f[1], f[1])
      , substr(t, f[2], f[2])
    ) |> 
      as.numeric()
  }
  , t = txt_digits
  , f = l
  , SIMPLIFY = FALSE
) |> 
  unname() |> 
  unlist() |> 
  sum(na.rm = TRUE)
