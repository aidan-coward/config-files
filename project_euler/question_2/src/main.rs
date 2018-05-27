//By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms
fn main() {
    let mut num1: u32 = 1;
    let mut num2: u32  = 2;
    let mut num3: u32;
    let mut sum: u32 = 0;
    while num1 < 4000000 {
        if num1 % 2 == 0 {
            sum += num1; }
        num3 = num1;
        num1 = num2;
        num2 += num3;
    }
    println!("{}", sum);
}
