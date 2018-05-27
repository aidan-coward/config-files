fn main() {
    for x in 2..30 {
        println!("{}: {}", x, prime_test(x))
    }
}
    




fn prime_test(test_number: u64) -> bool {
    let mut counter: u64 = 1;
    let test_number_float = test_number as f64;
    let max_divisor = (test_number_float.sqrt()) as u64;
    if test_number % 2 == 0 || test_number % 3 == 0 {       // fail if divisible by 2 or 3
        return false 
    }

    while ( counter * 6 - 1 ) <= max_divisor {
        if test_number % ( counter * 6 - 1 ) == 0 || test_number % ( counter * 6 + 1 ) == 0 {
            return false 
        }
        else { counter += 1; }
    }
    true
}
