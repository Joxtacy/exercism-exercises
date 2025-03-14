pub fn is_armstrong_number(num: u32) -> bool {
    if num < 10 {
        return true;
    } else {
        let mut num_size = 0;
        while num / 10_u32.pow(num_size) > 0 {
            num_size += 1;
        }

        let mut sum = 0;
        // for i in 0..num_size { // this also works
        for i in (0..num_size).rev() {
            sum += (num / 10_u32.pow(i) % 10).pow(num_size);
        }
        if sum == num {
            return true;
        }
    }
    false
}
