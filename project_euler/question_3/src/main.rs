extern crate prime_utils;

//use prime_utils::prime_test;

fn main() {
    let mut list_divisors: Vec<u64> = Vec::new();
    let mut list_prime_divisors: Vec<u64> = Vec::new();
    let big_num: u64 = 600851475143;
    let big_num_float = big_num as f64;
    let ceiling_float = big_num_float.sqrt();
    let ceiling = ceiling_float as u64;

    for x in 3..( ceiling + 1) {
        if big_num % x == 0 {
            list_divisors.push(x);
        }
    }

    for divisor in list_divisors {
        println!("the divisors of {} are: {}", big_num, divisor);
        if prime_utils::prime_test(divisor) {
            list_prime_divisors.push(divisor)
        }
    }
    
    for prime_divisor in list_prime_divisors {
        println!("the prime divisors of {} are: {}", big_num, prime_divisor);
    }
}
