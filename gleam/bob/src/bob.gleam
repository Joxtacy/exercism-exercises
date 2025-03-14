import gleam/string

pub fn hey(remark: String) -> String {
  let trimmed = string.trim(remark)

  let is_empty = empty(trimmed)
  let is_yelling_question = yelling_question(trimmed)
  let is_question = ends_with_question_mark(trimmed)
  let is_screaming = all_caps(trimmed)

  case trimmed {
    _ if is_empty -> "Fine. Be that way!"
    _ if is_yelling_question -> "Calm down, I know what I'm doing!"
    _ if is_question -> "Sure."
    _ if is_screaming -> "Whoa, chill out!"
    _ -> "Whatever."
  }
}

fn ends_with_question_mark(remark: String) -> Bool {
  string.ends_with(remark, "?")
}

fn all_caps(remark: String) -> Bool {
  string.uppercase(remark) == remark && string.lowercase(remark) != remark
}

fn yelling_question(remark: String) -> Bool {
  ends_with_question_mark(remark) && all_caps(remark)
}

fn empty(remark: String) -> Bool {
  string.is_empty(remark)
}
