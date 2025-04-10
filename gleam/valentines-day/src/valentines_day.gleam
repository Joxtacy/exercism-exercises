pub type Approval {
  Maybe
  No
  Yes
}

pub type Cuisine {
  Korean
  Turkish
}

pub type Genre {
  Crime
  Horror
  Romance
  Thriller
}

pub type Activity {
  BoardGame
  Chill
  Movie(Genre)
  Restaurant(Cuisine)
  Walk(Int)
}

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
    Movie(Romance) -> Yes
    Restaurant(Korean) -> Yes
    Restaurant(_) -> Maybe
    Walk(d) if d > 11 -> Yes
    Walk(d) if d > 6 -> Maybe
    _ -> No
  }
}
