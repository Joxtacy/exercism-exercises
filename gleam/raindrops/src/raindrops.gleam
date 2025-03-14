import gleam/int
import gleam/string

pub fn convert(number: Int) -> String {
  let res = ""

  let res = case number % 3 {
    0 -> res <> "Pling"
    _ -> res
  }

  let res = case number % 5 {
    0 -> res <> "Plang"
    _ -> res
  }

  let res = case number % 7 {
    0 -> res <> "Plong"
    _ -> res
  }

  case string.length(res) {
    0 -> int.to_string(number)
    _ -> res
  }
}
