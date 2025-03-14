import gleam/int
import gleam/list
import gleam/result

pub fn is_armstrong_number(number: Int) -> Bool {
  let n =
    number
    |> int.digits(10)
    |> result.unwrap([])
    |> list.length

  number
  |> int.digits(10)
  |> result.unwrap([])
  |> list.map(int_power(_, n))
  |> int.sum
  == number
}

fn int_power(n: Int, power: Int) -> Int {
  do_int_power(n, power, 1)
}

fn do_int_power(n: Int, power: Int, acc: Int) -> Int {
  case power {
    0 -> acc
    _ -> do_int_power(n, power - 1, acc * n)
  }
}
