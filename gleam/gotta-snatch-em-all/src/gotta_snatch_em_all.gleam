import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  case set.contains(collection, their_card), set.contains(collection, my_card) {
    False, True -> #(
      True,
      collection |> set.delete(my_card) |> set.insert(their_card),
    )
    True, False -> #(False, collection)
    False, False -> #(False, collection |> set.insert(their_card))
    True, True -> #(
      False,
      collection |> set.delete(my_card) |> set.insert(their_card),
    )
  }
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  case collections {
    [] -> []
    [collection] -> set.to_list(collection)
    [first, ..rest] -> do_boring_cards(rest, first)
  }
}

fn do_boring_cards(
  collections: List(Set(String)),
  acc: Set(String),
) -> List(String) {
  case collections {
    [] -> []
    [collection] -> set.to_list(set.intersection(acc, collection))
    [collection, ..rest] ->
      do_boring_cards(rest, set.intersection(acc, collection))
  }
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  case collections {
    [] -> 0
    [collection] -> set.size(collection)
    [first, ..rest] -> do_total_cards(rest, first)
  }
}

fn do_total_cards(collections: List(Set(String)), acc: Set(String)) -> Int {
  case collections {
    [] -> set.size(acc)
    [collection, ..rest] -> do_total_cards(rest, set.union(acc, collection))
  }
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.filter(string.starts_with(_, "Shiny "))
}
