pub fn egg_count(display_value: u32) -> usize {
    (0..32)
        .map(|n| (display_value >> n) & 1)
        .fold(0, |acc, x| acc + x as usize)
}
