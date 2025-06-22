pub fn annotate(board: &[&str]) -> Vec<String> {
    let height = board.len();
    if height == 0 {
        return vec![];
    }

    let mut result = Vec::with_capacity(height);
    let width = board[0].len();
    for (y, row) in board.iter().enumerate() {
        let row_bytes = row.as_bytes();
        let mut annotated_row = String::with_capacity(width);
        for (x, &b) in row_bytes.iter().enumerate() {
            if b == b'*' {
                annotated_row.push('*');
                continue;
            }

            let count = count_adjacent_mines(board, y, x, height, width);

            if count == 0 {
                annotated_row.push(' ');
            } else {
                annotated_row.push(char::from_digit(count, 10).unwrap());
            }
        }
        result.push(annotated_row);
    }
    result
}

fn count_adjacent_mines(board: &[&str], y: usize, x: usize, height: usize, width: usize) -> u32 {
    let mut count = 0;
    for dy in -1isize..=1 {
        for dx in -1isize..=1 {
            if dx == 0 && dy == 0 {
                continue;
            }
            let ny = y as isize + dy;
            let nx = x as isize + dx;
            if (0..height as isize).contains(&ny) && (0..width as isize).contains(&nx) {
                if board[ny as usize].as_bytes()[nx as usize] == b'*' {
                    count += 1;
                }
            }
        }
    }
    count
}
