pub fn verse(n: u32) -> String {
    if n == 0 {
        "No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall."
            .to_string()
    } else {
        format!("{}\n{}", first_row(n), second_row(n))
    }
}

pub fn sing(start: u32, end: u32) -> String {
    let mut verses = vec![];
    for v in (end..=start).rev() {
        verses.push(verse(v));
    }
    verses.join("\n\n")
}

fn first_row(n: u32) -> String {
    match n {
        0 => "No more bottles of beer on the wall, no more bottles of beer.".to_string(),
        1 => "1 bottle of beer on the wall, 1 bottle of beer.".to_string(),
        n => format!("{} bottles of beer on the wall, {} bottles of beer.", n, n),
    }
}

fn second_row(n: u32) -> String {
    match n {
        0 => "Go to the store and buy some more, 99 bottles of beer on the wall.".to_string(),
        1 => "Take it down and pass it around, no more bottles of beer on the wall.".to_string(),
        n => format!(
            "Take one down and pass it around, {} {} of beer on the wall.",
            n - 1,
            if n - 1 == 1 { "bottle" } else { "bottles" }
        ),
    }
}
