//: Playground - noun: a place where people can play

import Cocoa
// CONTROL FLOW MANAGED BY:
// 1. WHILE ***
// 2. FOR LOOPS 

// CONDITIONAL STATEMENTS ARE: 
// 1. IF/ELSE
// 2. SWITCH
//     WHILE LOOPS - perform loop until a condition becomes false.
// Best for when the number of iterations is not known before it
// begins.
// 
//     2 KINDS:  While & Repeat-While
// 
//     While loop - start by evaluating a single condition, if true
// loop will continue until it's false
// 

var i = 1
var myFirstInt: Int = 0

while i < 6 {
    ++myFirstInt
    print("\(myFirstInt)")
    i++
}

var test = 0
var collectData: Int = 0

probeData : while test < 10 {
    ++collectData
    test++
    print("Collected \(collectData) of 10 data packets for \(test) tests from alien planet atmosphere")
}

//    * ** WHILE LOOPS  evaluate the condition *before* stepping into
//the loop therefore there's a possiblity that it won't ever execute */

//     REPEAT-WHILE - (also known as do-while in other languages) the
// difference between this and a while, is that it will execute at
// least once before evaluating the condition, so if you need it to
// execute no matter what then use this

repeat {
++myFirstInt
print("\(myFirstInt)")
i++
} while i < 6


repeat {
++collectData
print("Sent \(collectData) of \(test) data packets, with at least 1 extra data packet sent.")
test++
} while test < 10



//     MENTION LABELED STATEMENTS CAN BE USED WITH WHILE LOOPS -
// explicitly give a loop a name/lable

var shields = 0
var shipExplode = false
starshipEnterprise: repeat {
    // Fire torpedos even if the shields are down
   print("Fire torpedos")
    --shields
    
} while shields > 0

var shields = 0
var shipExplodes = true

repeat {
    // Fire torpedos even if the ship's shields are down
    if !shipExplodes { print("Fire torpedos!") }
    --shields
} while shields > 0


// Fibonacci sequence with while loop
var term: Int = 0
var previousTerm: Int = 0
var newTerm: Int = 0
var runningTotal: Int = 0

var nthTermOfFibonacciSequence: Int = 10
while (term < nthTermOfFibonacciSequence) {
    newTerm = term + previousTerm
    
    // if to find the sum of even valued terms, based on if the modulus of the newTerm is equal to 0
    if newTerm % 2 == 0 { runningTotal += newTerm }
    
    print("\(newTerm)")
    
    previousTerm = term
    
    if (term == 0) {
        term++
    } else {
        term = newTerm
    }
    
    
}
