use std::cmp::Ordering;

pub fn find<U: AsRef<[T]>, T: Ord>(array: U, key: T) -> Option<usize> {
    let array = array.as_ref();

    let mut left = 0;
    let mut right = array.len();
    let mut mid;

    while left < right {
        mid = (left + right) / 2;

        match array[mid].cmp(&key) {
            Ordering::Equal => return Some(mid),
            Ordering::Greater => right = mid,
            Ordering::Less => left = mid + 1,
        }
    }

    None
}
