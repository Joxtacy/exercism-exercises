pub fn annotate(minefield: &[&str]) -> Vec<String> {
    let num_rows = minefield.len();

    if num_rows == 0 {
        return vec![];
    }

    if minefield[0].is_empty() {
        return vec!["".to_string()];
    }

    let num_cols = minefield[0].len();

    let cloned_minefield = clone(minefield);
    let mut update_me = cloned_minefield.clone();

    for y in 0..num_rows {
        for x in 0..num_cols {
            increase_bomb_count(&update_me, x, y);
        }
    }

    minefield.iter().map(|s| s.to_string()).collect()
}

fn clone<'a>(minefield: &[&'a str]) -> Vec<&'a [u8]> {
    let mut d = vec![];
    for i in 0..minefield.len() {
        d.push(minefield.get(i).unwrap().as_bytes());
    }
    d
}

fn find_square<'a>(minefield: &[&'a [u8]], x: usize, y: usize) -> Option<&'a u8> {
    if let Some(row) = minefield.get(y) {
        row.get(x)
    } else {
        None
    }
}

fn increase_bomb_count(mut minefield: &[&[u8]], x: usize, y: usize) {
    for dx in -1..=1 {
        for dy in -1..=1 {
            let new_x = x as i32 + dx;
            let new_y = y as i32 + dy;
            if new_x < 0 || new_y < 0 {
                continue;
            }
            if new_x == 0 && new_y == 0 {
                continue;
            }
            if let Some(mut c) = find_square(minefield, new_x as usize, new_y as usize) {
                if c == &b' ' {
                    // set to 1
                    c = &b'1'; // not actually writing anything
                } else if c == &b'*' {
                    // noop
                } else {
                    c = &(*c + 1); // not actually writing anything
                }
            }
        }
    }
}
