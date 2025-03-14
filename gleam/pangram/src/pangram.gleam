import gleam/regex
import gleam/set
import gleam/string

pub fn is_pangram(sentence: String) -> Bool {
  let assert Ok(re) = regex.from_string("[^a-z]+")

  sentence
  |> string.lowercase
  |> regex.replace(re, _, "")
  |> string.to_graphemes
  |> set.from_list
  |> set.size
  == 26
}
