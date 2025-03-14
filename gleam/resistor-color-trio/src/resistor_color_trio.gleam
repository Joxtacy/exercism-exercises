pub type Resistance {
  Resistance(unit: String, value: Int)
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  todo
}

fn code(color: String) -> Result(Int, Nil) {
  case color {
    "black" -> Ok(0)
    "brown" -> Ok(1)
    "red" -> Ok(2)
    "orange" -> Ok(3)
    "yellow" -> Ok(4)
    "green" -> Ok(5)
    "blue" -> Ok(6)
    "violet" -> Ok(7)
    "grey" -> Ok(8)
    "white" -> Ok(9)
    _ -> Error(Nil)
  }
}
