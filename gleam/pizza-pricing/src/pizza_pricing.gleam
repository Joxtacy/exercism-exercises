pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  calc_pizza_price(0, pizza)
}

fn calc_pizza_price(price: Int, pizza: Pizza) -> Int {
  case pizza {
    ExtraSauce(pizza) -> calc_pizza_price(price + 1, pizza)
    ExtraToppings(pizza) -> calc_pizza_price(price + 2, pizza)
    Margherita -> 7 + price
    Caprese -> 9 + price
    Formaggio -> 10 + price
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  calc_order_price(order, 0)
  + case order {
    [_] -> 3
    [_, _] -> 2
    _ -> 0
  }
}

fn calc_order_price(order: List(Pizza), sum: Int) -> Int {
  case order {
    [] -> sum
    [pizza, ..rest] -> calc_order_price(rest, sum + pizza_price(pizza))
  }
}
