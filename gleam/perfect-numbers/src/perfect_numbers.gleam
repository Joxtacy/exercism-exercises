import gleam/int
import gleam/order
import gleam/result

pub type Classification {
  Perfect
  Abundant
  Deficient
}

pub type Error {
  NonPositiveInt
}

pub fn classify(number: Int) -> Result(Classification, Error) {
  use number <- result.try(is_valid_number(number))
  let sum =
    number
    |> find_factors
    |> int.sum

  case int.compare(sum, number) {
    order.Gt -> Ok(Abundant)
    order.Eq -> Ok(Perfect)
    order.Lt -> Ok(Deficient)
  }
}

fn find_factors(number: Int) -> List(Int) {
  do_find_factors(number, number / 2, [])
}

fn do_find_factors(
  number: Int,
  potential_factor: Int,
  acc: List(Int),
) -> List(Int) {
  case potential_factor {
    0 -> acc
    1 -> [1, ..acc]
    n if number % n == 0 -> do_find_factors(number, n - 1, [n, ..acc])
    _ -> do_find_factors(number, potential_factor - 1, acc)
  }
}

fn is_valid_number(number: Int) -> Result(Int, Error) {
  case number {
    n if n <= 0 -> Error(NonPositiveInt)
    n -> Ok(n)
  }
}
