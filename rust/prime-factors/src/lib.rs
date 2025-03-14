pub fn factors(n: u64) -> Vec<u64> {
    let mut factors = vec![];
    let mut candidates = 2..;
    let mut num = n;

    while num > 1 {
        let candidate = candidates.next().unwrap();

        while num % candidate == 0 {
            num /= candidate;
            factors.push(candidate);
        }
    }
    factors
}
