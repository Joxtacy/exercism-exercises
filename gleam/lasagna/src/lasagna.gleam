pub fn expected_minutes_in_oven() -> Int {
  40
}

pub fn remaining_minutes_in_oven(actual_minutes_in_oven: Int) -> Int {
  expected_minutes_in_oven() - actual_minutes_in_oven
}

pub fn preparation_time_in_minutes(layers: Int) -> Int {
  layers * 2
}

pub fn total_time_in_minutes(layers: Int, actual_minutes_in_oven: Int) -> Int {
  preparation_time_in_minutes(layers) + actual_minutes_in_oven
}

pub fn alarm() -> String {
  "Ding!"
}
