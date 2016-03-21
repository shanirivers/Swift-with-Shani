//: Playground - noun: a place where people can play

import Cocoa

// CONDITIONAL STATEMENTS ARE: 
// 1. IF/ELSE
// 2. SWITCH


// IF/ELSE -  making decisions based on the content of variables, executes code based on logic statements or conditions

var businessSize: Int = 6

var message: String

if businessSize <= 6 {
    message = "\(businessSize) employees is considered a micro business"
} else {
    message = "\(businessSize) employees is NOT considered a micro business"
}


// TALK BRIEFLY ABOUT COMPARISON OPERATORS AND BE SURE TO ADD A POPUP INSERT WITH WHAT THEY ARE

// TALK ABOUT LOGICAL OPERATORS &&, ||, !

var hasBirthday = false

if !hasBirthday { print("No birthday song for you") }


// TERNARY CONDITIONAL OPERATOR - a more concise version of if/else " a ? b : c "

// condition ? true expression : false expression

var x = 10
var y = 20

print("The larger number is \(x > y ? x : y)")

var age = 18

print("You are able to \(age == 18 ? "go to war, but no drinking for you." : "do anything.")")

// NESTED CONDITIONALS

businessSize = 300

if businessSize <= 1000 {
    if businessSize < 500 && businessSize > 250 {
        print("This is a medium sized business")
    } else {
        print("This is a small business")
    }
} else {
    print("This is a large business")
}

/* Nested conditionals are fine up to a point if the nesting is > 2 levels it's less maintainable an readable */

// ELSE IF - Break up the previous example using else if instead!


//GUARD/ ELSE - its similar to if/else in that it executes stmts depend on BOOL value, but more strict. basically if a condition is not met, it exits out of the statement without evaluating anything else

businessSize = 0
var betterMessage: String  {
    
    guard businessSize > 0 else {
        return "This is not a valid business size"
    }
    if businessSize < 15 {
        print("This is a small business")
    }
    
    return "This is a valid business size"
}

print(betterMessage)


var age: Int = 25

if age < 18 {
    print("You are not an adult")
} else {
    print("You are an adult")
}

age = 5
if age < 4 || age > 2 {
    print("You are a toddler")
}

var hasBirthday = false

if !hasBirthday {
    print("No birthday song for you")
} else {
    print("Happy birthday, to you...")
}

// TERNARY CONDITIONAL OPERATOR - a more concise version of if/else " a ? b : c "

// condition ? true expression : false expression

!hasBirthday ? print("You have to wait next year for me to sing to you") : print("Happy birthday to you...")

var businessSize: Int = 0

if businessSize < 20 {
    if businessSize < 10 {
        print("This is a micro business")
    } else {
        print("This is a small business")
    }
} else {
    print("This is not a small business")
}

// ELSE IF

if businessSize < 10 {
    print("This is a micro business")
} else if businessSize >= 10 && businessSize < 20 {
    print("This is a small business")
} else {
    print("This is not a small or micro size business")
}


businessSize = 20
var messageSize: String = ""

var message: String {
    guard businessSize > 0 else {
        return "This is not a valid business size"
    }
    
    return "This is a valid business size"
}


print(message)














