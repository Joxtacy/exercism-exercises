pub fn abbreviate(phrase: &str) -> String {
    /*
    * // This solution doesn't preserve the order of the words
        phrase
            .rsplit([' ', '-', '_'])
            .filter(|c| !c.is_empty())
            .inspect(|hi| println!("{:?}", hi))
            .map(|c| c.chars().next().unwrap().to_ascii_uppercase())
            .collect()
    */

    phrase
        .split_whitespace()
        .flat_map(|word| word.split('-'))
        .flat_map(|word| word.split('_'))
        .filter(|word| !word.is_empty())
        .map(|word| {
            word.chars()
                .enumerate()
                .filter_map(|(i, c)| {
                    if i == 0 || c.is_uppercase() {
                        return Some(c);
                    }
                    None
                })
                .map(|c| c.to_ascii_uppercase())
                .collect::<String>()
        })
        .collect()
}
