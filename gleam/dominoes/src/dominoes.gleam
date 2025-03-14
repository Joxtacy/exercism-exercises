import gleam/io
import gleam/set

pub type Domino =
  #(Int, Int)

pub fn can_chain(chain: List(Domino)) -> Bool {
  let s = set.from_list([88, 89])
  let s = set.delete(s, 88)
  io.debug(s)
  case chain {
    [] -> True
    [#(a, b)] -> a == b
    _ -> False
  }
}
