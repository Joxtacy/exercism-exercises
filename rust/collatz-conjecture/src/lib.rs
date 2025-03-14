pub fn collatz(n: u64) -> Option<u64> {
    let adder = |x| x + 1;

    match n {
        0 => None,
        1 => Some(0),
        n if n % 2 == 0 => collatz(n / 2).map(adder),
        _ => collatz(n.checked_mul(3)?.checked_add(1)?).map(adder),
    }
}
