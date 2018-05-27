






pub fn prime_test(num: u64) -> bool {
    if num == 2 { return true };
    if num % 2 == 0 { return false };
    for x in 2..( num / 2 ) {
        if num % x == 0 { return false };
    }
    true
}

