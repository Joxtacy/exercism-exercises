use std::{collections::HashMap, thread};

type CharCountMap = HashMap<char, usize>;

// Not my own solution. But a really cool one.
// I wasn't able to make one this good.
pub fn frequency(input: &[&str], worker_count: usize) -> CharCountMap {
    let counter = |input: &[&str]| {
        let mut map = HashMap::new();
        for line in input {
            for c in line
                .chars()
                .filter(|c| c.is_alphabetic())
                .map(|c| c.to_ascii_lowercase())
            {
                *map.entry(c).or_insert(0) += 1;
            }
        }
        map
    };

    match input.len() {
        0 => HashMap::new(),
        n if n < 500 => counter(input),
        _ => thread::scope(|s| {
            let mut handles = Vec::with_capacity(worker_count);
            for lines in input.chunks(input.len() / worker_count + 1) {
                handles.push(s.spawn(|| counter(lines)))
            }

            let mut map = handles.pop().unwrap().join().unwrap();
            for res in handles {
                res.join().unwrap().into_iter().for_each(|(k, v)| {
                    *map.entry(k).or_insert(0) += v;
                });
            }
            map
        }),
    }
}
