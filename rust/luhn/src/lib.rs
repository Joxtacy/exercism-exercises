/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    if code.trim().len() <= 1 {
        return false;
    }

    code.chars()
        .rev()
        .filter(|c| !c.is_whitespace())
        .enumerate()
        .try_fold(0, |sum, (i, c)| {
            c.to_digit(10)
                .map(|num| if i % 2 == 1 { num * 2 } else { num })
                .map(|num| if num > 9 { num - 9 } else { num })
                .map(|num| sum + num)
        })
        .is_some_and(|sum| sum % 10 == 0)
}
