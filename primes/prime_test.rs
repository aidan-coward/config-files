use std::num::Float;

pub fn prime_test(test_number: u64) -> bool {
    let mut counter: i64 = 1;
    if x % 2 == 0 || x % 3 == 0 {       // fail if divisible by 2 or 3
        return false 
    }

    while ( counter * 6 + 1) < (test_number).sqrt() {
        if test_number % ( counter * 6 - 1 ) == 0 || test_number % ( counter * 6 + 1 ) == 0 {
            return false 
        }
        else k += 1;
    }

    true
}


        


