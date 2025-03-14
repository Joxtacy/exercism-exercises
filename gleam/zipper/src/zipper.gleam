pub type Tree(a) {
  Leaf
  Node(value: a, left: Tree(a), right: Tree(a))
}

pub opaque type Zipper(a) {
  Zipper(tree: Tree(a), crumbs: List(Crumb(a)))
}

pub opaque type Crumb(a) {
  LeftCrumb(value: a, sibling: Tree(a))
  RightCrumb(value: a, sibling: Tree(a))
}

pub fn to_zipper(tree: Tree(a)) -> Zipper(a) {
  Zipper(tree, [])
}

pub fn to_tree(zipper: Zipper(a)) -> Tree(a) {
  case up(zipper) {
    Error(Nil) -> zipper.tree
    Ok(parent) -> to_tree(parent)
  }
}

pub fn value(zipper: Zipper(a)) -> Result(a, Nil) {
  case zipper.tree {
    Leaf -> Error(Nil)
    Node(value, ..) -> Ok(value)
  }
}

pub fn up(zipper: Zipper(a)) -> Result(Zipper(a), Nil) {
  case zipper.crumbs {
    [LeftCrumb(value, right), ..rest] ->
      Ok(Zipper(Node(value, zipper.tree, right), rest))
    [RightCrumb(value, left), ..rest] ->
      Ok(Zipper(Node(value, left, zipper.tree), rest))
    _ -> Error(Nil)
  }
}

pub fn left(zipper: Zipper(a)) -> Result(Zipper(a), Nil) {
  case zipper.tree {
    Leaf -> Error(Nil)
    Node(value, left, right) ->
      Ok(Zipper(left, [LeftCrumb(value, right), ..zipper.crumbs]))
  }
}

pub fn right(zipper: Zipper(a)) -> Result(Zipper(a), Nil) {
  case zipper.tree {
    Leaf -> Error(Nil)
    Node(value, left, right) ->
      Ok(Zipper(right, [RightCrumb(value, left), ..zipper.crumbs]))
  }
}

pub fn set_value(zipper: Zipper(a), value: a) -> Zipper(a) {
  case zipper.tree {
    Leaf -> Zipper(Node(value, Leaf, Leaf), zipper.crumbs)
    Node(_, left, right) -> Zipper(Node(value, left, right), zipper.crumbs)
  }
}

pub fn set_left(zipper: Zipper(a), tree: Tree(a)) -> Result(Zipper(a), Nil) {
  case zipper.tree {
    Leaf -> Error(Nil)
    Node(value, _, right) -> Ok(Zipper(Node(value, tree, right), zipper.crumbs))
  }
}

pub fn set_right(zipper: Zipper(a), tree: Tree(a)) -> Result(Zipper(a), Nil) {
  case zipper.tree {
    Leaf -> Error(Nil)
    Node(value, left, _) -> Ok(Zipper(Node(value, left, tree), zipper.crumbs))
  }
}
