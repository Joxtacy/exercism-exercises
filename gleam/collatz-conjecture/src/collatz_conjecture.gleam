import gleam/int

pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number {
    n if n <= 0 -> Error(NonPositiveNumber)
    n -> Ok(do_steps(n, 0))
  }
}

fn do_steps(number: Int, count: Int) -> Int {
  case number, int.is_even(number) {
    1, _ -> count
    n, True -> do_steps(n / 2, count + 1)
    n, False -> do_steps(n * 3 + 1, count + 1)
  }
}
