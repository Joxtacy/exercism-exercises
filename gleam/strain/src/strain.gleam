import gleam/list

pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  do_keep(list, predicate, [])
}

fn do_keep(list: List(t), predicate: fn(t) -> Bool, acc: List(t)) -> List(t) {
  case list {
    [] -> list.reverse(acc)
    [item, ..rest] -> {
      case predicate(item) {
        True -> do_keep(rest, predicate, [item, ..acc])
        False -> do_keep(rest, predicate, acc)
      }
    }
  }
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  do_discard(list, predicate, [])
}

fn do_discard(list: List(t), predicate: fn(t) -> Bool, acc: List(t)) -> List(t) {
  case list {
    [] -> list.reverse(acc)
    [item, ..rest] -> {
      case predicate(item) {
        False -> do_discard(rest, predicate, [item, ..acc])
        True -> do_discard(rest, predicate, acc)
      }
    }
  }
}
