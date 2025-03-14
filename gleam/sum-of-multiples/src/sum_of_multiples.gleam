import gleam/list
import gleam/set

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  factors
  |> list.flat_map(multiples(_, limit))
  |> set.from_list
  |> set.fold(0, fn(acc, n) { acc + n })
}

fn multiples(factor: Int, limit: Int) -> List(Int) {
  case factor {
    0 -> []
    _ -> multiples_rec(factor, factor, limit, [])
  }
}

fn multiples_rec(
  factor: Int,
  curr_factor: Int,
  limit: Int,
  acc: List(Int),
) -> List(Int) {
  case curr_factor < limit {
    False -> acc
    True ->
      multiples_rec(factor, curr_factor + factor, limit, [curr_factor, ..acc])
  }
}
