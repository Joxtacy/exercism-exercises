pub fn square_of_sum(n: Int) -> Int {
  square_sum(n, 0)
  // n * { n + 1 } / 2
}

fn square_sum(n: Int, acc: Int) -> Int {
  case n {
    0 -> acc * acc
    _ -> square_sum(n - 1, acc + n)
  }
}

pub fn sum_of_squares(n: Int) -> Int {
  sum_square(n, 0)
  // n * { n + 1 } * { 2 * n + 1 } / 6
}

fn sum_square(n: Int, acc: Int) -> Int {
  case n {
    0 -> acc
    1 -> acc + 1
    _ -> sum_square(n - 1, acc + n * n)
  }
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
