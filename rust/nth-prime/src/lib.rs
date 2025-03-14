pub fn nth(n: u32) -> u32 {
    let mut count = 0;
    let mut num = 2;
    while count < n {
        num += 1;
        if is_prime(num) {
            count += 1;
        }
    }
    num
}

fn is_prime(n: u32) -> bool {
    if n <= 1 {
        return false;
    } else if n <= 3 {
        return true;
    } else if n % 2 == 0 || n % 3 == 0 {
        return false;
    }

    let mut i: u32 = 5;
    while i.pow(2) <= n {
        if n % i == 0 || n % (i + 2) == 0 {
            return false;
        }
        i += 6;
    }
    true
}
