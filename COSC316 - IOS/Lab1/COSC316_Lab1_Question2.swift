import Foundation
//COSC316 Lab 1 - Question 2

// a)
func payCheck(_ name: String, _ hoursworked: Double, _ hourlyrate: Double, _ bonus: Double = 0.0) -> String{
    // anything over 80 hours is OT
    let hours = min(hoursworked, 80)
    let overtime = max(hoursworked - 80, 0)
    
    let pay = hours * hourlyrate
    let overtimePay = overtime * hourlyrate * 1.5
    let total = pay + overtimePay + bonus
    
    return "\(name): $\(String(format: "%.2f", total))"
}

print (payCheck ("John Doe", 70.5, 21.5, 150.0))
print (payCheck ("Peter Chan", 88.5, 20.0))

// b)
func reverseDigits(_ num: Int, _ reversedStr: String = "") -> String{
    // base case
    if(num == 0){
        return reversedStr.isEmpty ? "0" : reversedStr
    }
    
    let isNegative = num < 0
    // use absolute value in the case of a negative number
    let absoluteValue = abs(num)
    let lastDigit = absoluteValue % 10
    let remainder = absoluteValue / 10
    
    let newString = reversedStr + "\(lastDigit)"
    
    if remainder == 0 {
        // if negative, prepend a '-'
        return isNegative ? "-\(newString)" : newString
    }
    
    return reverseDigits(isNegative ? -remainder : remainder, newString)
}

print (reverseDigits (1234, ""))
print (reverseDigits (-1230, ""))
print (reverseDigits (0, ""))