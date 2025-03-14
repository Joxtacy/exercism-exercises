pub fn build_proverb(list: &[&str]) -> String {
    match list.first() {
        None => "".into(),
        Some(word) => list
            .windows(2)
            .map(build_line)
            .chain(std::iter::once(build_last_line(word)))
            .collect::<Vec<_>>()
            .join("\n"),
    }
}

fn build_line(words: &[&str]) -> String {
    format!("For want of a {} the {} was lost.", words[0], words[1])
}

fn build_last_line(word: &str) -> String {
    format!("And all for the want of a {word}.")
}
