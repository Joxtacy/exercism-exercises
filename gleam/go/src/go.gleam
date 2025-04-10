import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  game
  |> rule1
  |> result.map(rule2)
  |> result.try(rule3)
  |> result.try(rule4)
  |> result.map(fn(game) {
    case game.player {
      White -> Game(..game, player: Black)
      Black -> Game(..game, player: White)
    }
  })
  |> result.map_error(fn(error) { Game(..game, error:) })
  |> result.unwrap_both
}
