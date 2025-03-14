pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  do_append(first, second, [])
}

fn do_append(first: List(a), second: List(a), acc: List(a)) -> List(a) {
  case first {
    [] -> {
      case second {
        [] -> reverse(acc)
        [item, ..rest] -> do_append(first, rest, [item, ..acc])
      }
    }
    [item, ..rest] -> do_append(rest, second, [item, ..acc])
  }
}

pub fn concat(lists: List(List(a))) -> List(a) {
  do_concat(lists, [])
}

fn do_concat(lists: List(List(a)), acc: List(a)) -> List(a) {
  case lists {
    [] -> acc
    [list, ..rest] -> do_concat(rest, append(acc, list))
  }
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  do_filter(list, function, [])
}

fn do_filter(list: List(a), function: fn(a) -> Bool, acc: List(a)) -> List(a) {
  case list {
    [] -> reverse(acc)
    [item, ..rest] -> {
      case function(item) {
        True -> do_filter(rest, function, [item, ..acc])
        False -> do_filter(rest, function, acc)
      }
    }
  }
}

pub fn length(list: List(a)) -> Int {
  do_count(list, 0)
}

fn do_count(list: List(a), acc: Int) -> Int {
  case list {
    [] -> acc
    [_, ..rest] -> do_count(rest, acc + 1)
  }
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  do_map(list, function, [])
}

fn do_map(list: List(a), function: fn(a) -> b, acc: List(b)) -> List(b) {
  case list {
    [] -> reverse(acc)
    [item, ..rest] -> do_map(rest, function, [function(item), ..acc])
  }
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [item, ..rest] -> foldl(rest, function(initial, item), function)
  }
}

pub fn foldr(
  over list: List(a),
  from initial: d,
  with function: fn(d, a) -> d,
) -> d {
  foldl(reverse(list), initial, function)
}

pub fn reverse(list: List(a)) -> List(a) {
  do_reverse(list, [])
}

fn do_reverse(list: List(a), acc: List(a)) -> List(a) {
  case list {
    [] -> acc
    [item, ..rest] -> do_reverse(rest, [item, ..acc])
  }
}
