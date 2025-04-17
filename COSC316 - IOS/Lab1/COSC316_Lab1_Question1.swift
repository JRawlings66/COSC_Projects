import Foundation
// COSC 316 Lab 1 - question 1

let isPrime: (Int) -> Bool = { number in
  if number < 2 { // less than 2 cant be prime
    return false
  }
  let upperLimit = max(2, Int(sqrt(Double(number))))
  for i in 2...upperLimit {
    if number % i == 0 { // if number is divisible by anything other than itself
      return false
    }
  }
  return true

}
// a) 
func printPrimeNumbers(num1: Int, num2: Int){
  // set the range
  let start = min(num1, num2)
  let end = max(num1, num2)

  let primes = getPrimeNumbers(num1: start, num2: end)
  print(primes)
}
// b)
func getPrimeNumbers(num1: Int, num2: Int) -> [Int] {
  var primeNumbers: [Int] = []
  for number in num1...num2{
    if isPrime(number){
      primeNumbers.append(number)
    }
  }
  return primeNumbers
}
// c)
let primeNumbers: (Int, Int) -> [Int] = { num1, num2 in
    // set the range
    let start = min(num1, num2)
    let end = max(num1, num2)
    var primes: [Int] = []
    for number in start...end{
        if isPrime(number){
            primes.append(number)
        }
    }
    return primes
}

printPrimeNumbers(num1: 1, num2: 50)
print(getPrimeNumbers(num1: 1, num2: 50))
print(primeNumbers(1, 50))