//: Playground - noun: a place where people can play

import Cocoa
// CONTROL FLOW MANAGED BY:
// 1. WHILE 
// 2. FOR LOOPS ***

// CONDITIONAL STATEMENTS ARE: 
// 1. IF/ELSE
// 2. SWITCH

// FOR-IN LOOPS - iterates over a sequence (e.g. ranges, items in an array, characters in a string)

for index in 1...5 {
    print("\(index) times 3 is \(index * 3)")
}

// If you don't need the value form a sequence, use "_" the underscore instead

var base = 10
let exponent = 2
var answer = 1
for _ in 1...exponent {
    answer *= base
}
 print("\(base) to the power of \(exponent) is \(answer)")

// Fibonacci (fee -bone -nah - chee) sequence with for-in, fibonacci sequence is found in nature
//    as branching in trees, phyllotaxis (the arrangement of leaves
//on a stem), the fruit sprouts of a pineapple,[11] the flowering of
//an artichoke, an uncurling fern, sunflower etc.
//     The Fibonacci Sequence is the series of numbers: 0, 1, 1, 2,
// 3, 5, 8, 13, 21, 34, ... The next number is found by adding up the
// two numbers before it. THE 6TH TERM IS 8, THE 10TH TERM IS 55
// xn is term number "n"
// xn-1 is the previous term (n-1)
// xn-2 is the term before that (n-2)
// https://youtu.be/SjSHVDfXHQ4 Fibonacci TED Talk: The magic of Fibonacci numbers

var startingNumber: Int = 0
var previousNumber: Int = 0
var newNumber: Int = 0
var runningTotal: Int = 0

var nthTerm: Int = 6

print("Fun with Fibonacci numbers - the sequence to the \(nthTerm)th term is:")

for _ in 1...nthTerm {
    // Basic math
    newNumber = startingNumber + previousNumber
          
    previousNumber = startingNumber
    
    print("\(newNumber)")
    
    if newNumber == 1 { print(newNumber)}
    if (startingNumber == 0) {
        startingNumber++
    } else {
        startingNumber = newNumber
    }
}


// Interating over an array

let nameArray = [ "Joe", "Mike", "Milly", "Kate"]

for name in nameArray  {
    print("Hi there, \(name)")
}

// Interating over a dictionary

let numOfLegs = ["spider": 8, "cat": 4, "beetle": 6, "house centipede": 30]

for (animal, legCount) in numOfLegs {
    if legCount < 10 {
        print("A \(animal) has \(legCount) legs.")
    } else {
        print("A \(animal) has \(legCount) - got to love evolution!")
    }
}


//FOR LOOPS - like the traditional C variety, has a condition and an incrementor

for var i = 0; i < 5; ++i {
    print("Hi, I have gone through this for loop \(i + 1) times")
}






// MENTION LABELING STATEMENTS CAN BE USED WITH FOR LOOPS 
