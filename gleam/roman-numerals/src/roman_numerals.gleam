pub fn convert(number: Int) -> String {
  convert_rec(number, "")
}

fn convert_rec(number: Int, roman: String) -> String {
  case number {
    n if n >= 1000 -> "M" <> convert_rec(n - 1000, roman)
    n if n >= 900 -> "CM" <> convert_rec(n - 900, roman)
    n if n >= 500 -> "D" <> convert_rec(n - 500, roman)
    n if n >= 400 -> "CD" <> convert_rec(n - 400, roman)
    n if n >= 100 -> "C" <> convert_rec(n - 100, roman)
    n if n >= 90 -> "XC" <> convert_rec(n - 90, roman)
    n if n >= 50 -> "L" <> convert_rec(n - 50, roman)
    n if n >= 40 -> "XL" <> convert_rec(n - 40, roman)
    n if n >= 10 -> "X" <> convert_rec(n - 10, roman)
    n if n >= 9 -> "IX" <> convert_rec(n - 9, roman)
    n if n >= 5 -> "V" <> convert_rec(n - 5, roman)
    n if n >= 4 -> "IV" <> convert_rec(n - 4, roman)
    n if n >= 1 -> "I" <> convert_rec(n - 1, roman)
    _ -> roman
  }
}
