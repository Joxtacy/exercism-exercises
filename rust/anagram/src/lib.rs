use std::collections::{HashMap, HashSet};

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    possible_anagrams
        .iter()
        .filter(|&possible_anagram| is_anagram(word, possible_anagram))
        .copied()
        .collect()
}

fn is_anagram(a: &str, b: &str) -> bool {
    // cannot be anagram if words are different lengths
    if a.len() != b.len() {
        return false;
    }

    // words are not anagrams if they are the same word
    if a.to_lowercase() == b.to_lowercase() {
        return false;
    }

    let letters_a = get_letter_counts(a);
    let letters_b = get_letter_counts(b);

    letters_a == letters_b
}

fn get_letter_counts(word: &str) -> HashMap<char, u32> {
    let mut letters_a: HashMap<char, u32> = HashMap::new();

    word.to_lowercase().chars().for_each(|c| {
        if letters_a.contains_key(&c) {
            letters_a.insert(c, letters_a.get(&c).unwrap() + 1);
        } else {
            letters_a.insert(c, 1);
        }
    });

    letters_a
}
