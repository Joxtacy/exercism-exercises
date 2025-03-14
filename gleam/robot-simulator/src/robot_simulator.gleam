import gleam/list
import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Action {
  Advance
  Left
  Right
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction:, position:)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  instructions
  |> string.trim
  |> string.to_graphemes
  |> list.filter_map(map_string_to_action)
  |> list.fold(create(direction, position), fn(r, a) { execute_action(r, a) })
}

fn map_string_to_action(action: String) -> Result(Action, Nil) {
  case action {
    "A" -> Ok(Advance)
    "L" -> Ok(Left)
    "R" -> Ok(Right)
    _ -> Error(Nil)
  }
}

fn execute_action(robot: Robot, action: Action) -> Robot {
  case action, robot {
    Advance, Robot(North, Position(x, y)) -> Robot(North, Position(x, y + 1))
    Advance, Robot(South, Position(x, y)) -> Robot(South, Position(x, y - 1))
    Advance, Robot(East, Position(x, y)) -> Robot(East, Position(x + 1, y))
    Advance, Robot(West, Position(x, y)) -> Robot(West, Position(x - 1, y))
    Left, Robot(North, pos) -> Robot(West, pos)
    Left, Robot(South, pos) -> Robot(East, pos)
    Left, Robot(East, pos) -> Robot(North, pos)
    Left, Robot(West, pos) -> Robot(South, pos)
    Right, Robot(North, pos) -> Robot(East, pos)
    Right, Robot(South, pos) -> Robot(West, pos)
    Right, Robot(East, pos) -> Robot(South, pos)
    Right, Robot(West, pos) -> Robot(North, pos)
  }
}
