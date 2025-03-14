use std::fmt::Display;

#[derive(Debug, PartialEq)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let mut total_minutes = Self::convert_to_minutes(hours, minutes);

        while total_minutes < 0 {
            total_minutes += 24 * 60;
        }

        let hours = (total_minutes / 60) % 24;
        let minutes = total_minutes % 60;

        Clock { hours, minutes }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let mut total_minutes = Self::convert_to_minutes(self.hours, self.minutes + minutes);

        while total_minutes < 0 {
            total_minutes += 24 * 60;
        }

        let hours = (total_minutes / 60) % 24;
        let minutes = total_minutes % 60;

        Clock { hours, minutes }
    }

    fn convert_to_minutes(hours: i32, minutes: i32) -> i32 {
        hours * 60 + minutes
    }
}

impl Display for Clock {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}
