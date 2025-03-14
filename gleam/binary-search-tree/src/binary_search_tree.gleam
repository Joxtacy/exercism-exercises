import gleam/list

pub type Tree {
  Nil
  Node(data: Int, left: Tree, right: Tree)
}

pub fn to_tree(data: List(Int)) -> Tree {
  data
  |> list.fold(Nil, insert)
}

fn insert(node: Tree, data: Int) -> Tree {
  case node {
    Nil -> Node(data, Nil, Nil)
    Node(d, l, r) if data <= d -> Node(d, insert(l, data), r)
    Node(d, l, r) -> Node(d, l, insert(r, data))
  }
}

pub fn sorted_data(data: List(Int)) -> List(Int) {
  data
  |> to_tree
  |> to_list
}

fn to_list(node: Tree) -> List(Int) {
  case node {
    Nil -> []
    Node(d, l, r) -> list.concat([to_list(l), [d], to_list(r)])
  }
}

pub fn search(node: Tree, value: Int) -> Bool {
  case node {
    Nil -> False
    Node(d, _, _) if value == d -> True
    Node(d, l, r) -> {
      case value < d {
        True -> search(l, value)
        False -> search(r, value)
      }
    }
  }
}
