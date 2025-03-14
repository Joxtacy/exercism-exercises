use std::collections::HashMap;

pub fn solve(input: &str) -> Option<HashMap<char, u8>> {
    let (additions, sum) = input.split_once("==").unwrap();
    let sum = sum.trim();
    additions
        .split('+')
        .map(|addition| addition.trim())
        .collect::<Vec<_>>()
        .iter()
        .for_each(|addition| {
            println!("{}", addition);
        });
    println!("{}", sum);

    todo!("Solve the alphametic {input:?}")
}
