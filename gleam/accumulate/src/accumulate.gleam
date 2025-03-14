pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  case list {
    [] -> []
    [n, ..rest] -> [fun(n), ..accumulate(rest, fun)]
  }
}
