pub fn private_key(p: u64) -> u64 {
    let range = p - 2;
    (rand::random::<f64>() * range as f64).floor() as u64 + 2
}

pub fn public_key(p: u64, g: u64, a: u64) -> u64 {
    modular_exponentiation(g, a, p)
}

pub fn secret(p: u64, b_pub: u64, a: u64) -> u64 {
    modular_exponentiation(b_pub, a, p)
}

fn modular_exponentiation(b: u64, e: u64, m: u64) -> u64 {
    if m == 1 {
        return 0;
    }

    let mut exponent = e;
    let mut r: u128 = 1;
    let mut base: u128 = (b % m) as u128;
    while exponent > 0 {
        if exponent % 2 == 1 {
            r = (r * base) % m as u128;
        }
        base = base.pow(2) % m as u128;
        exponent >>= 1;
    }
    r as u64
}
