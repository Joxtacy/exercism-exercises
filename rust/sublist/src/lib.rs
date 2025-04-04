#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(first_list: &[T], second_list: &[T]) -> Comparison {
    if first_list.is_empty() && second_list.is_empty() {
        return Comparison::Equal;
    }

    if first_list.is_empty() {
        return Comparison::Sublist;
    }

    if second_list.is_empty() {
        return Comparison::Superlist;
    }

    if first_list == second_list {
        return Comparison::Equal;
    }

    let first_list_len = first_list.len();
    let second_list_len = second_list.len();

    if first_list_len > second_list_len {
        if first_list
            .windows(second_list_len)
            .any(|window| window == second_list)
        {
            return Comparison::Superlist;
        }
    } else if second_list
        .windows(first_list_len)
        .any(|window| window == first_list)
    {
        return Comparison::Sublist;
    }

    Comparison::Unequal
}
