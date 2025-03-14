const STUDENTS: [&str; 12] = [
    "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph",
    "Kincaid", "Larry",
];

pub fn plants(diagram: &str, student: &str) -> Vec<&'static str> {
    let index = STUDENTS.iter().position(|&s| s == student).unwrap() * 2;

    diagram
        .lines()
        .flat_map(|line| line[index..=index + 1].chars().map(short_to_long))
        .collect()
}

fn short_to_long(c: char) -> &'static str {
    match c {
        'C' => "clover",
        'G' => "grass",
        'R' => "radishes",
        'V' => "violets",
        _ => panic!("Invalid plant"),
    }
}
