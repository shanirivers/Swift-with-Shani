//: Playground - noun: a place where people can play
// REFERENCES:https://blog.sabintsev.com/optionals-in-swift-c94fd231e7a4#.mdtgp0eqw
// http://swift.ayaka.me/posts/2015/10/5/optional
// https://blog.sabintsev.com/optionals-in-swift-c94fd231e7a4#.mdtgp0eqw
 

import Cocoa

// Optionals - used to indicate an instance may not have a value - so
// when you look at one , you will assume that either it has a value or
// it doesn't (that it'll = nil) **** "THERE IS A VALUE AND IT EQUALS X"
// OR "THERE ISN'T A VALUE AT ALL"
// 
// Optional types - instance can be nil, it should be an optional,
// otherwise its guaranteed NOT to be nil

// CONSTANT STRING declared as an optional
let constantOptional: String? = "Test"

// VARIABLE STRING declared as an optional
var variableOptional: String? = "Test"

// DECLARING OPTIONAL TYPES  

/* 	 1. Explicitly declared optional: var erroCodeString?
	 2. Implicitly unwrapped optionals: var errorCodeString! - don't need to unwrap, 
BUT accessing an implicitly declared optional w/o a value will cause a runtime error
    
*/

// explicitly declared "?"
var agentName: String?

agentName = "J" // is an optional of type string

print("Hello Agent\(agentName == nil ? ", what is your designation?" : " " + agentName!)")

//    implicitly declared "!", similar but you don't need to unwrap
//it *** can be dangerous if it is nil
	var otherAgentName: String!  
// using '!' forcibly unwraps the optional, therefore if you force unwrap w/ no value -> crash
otherAgentName = "Smith" print("Hello Agent \(otherAgentName)")


// Then comment the assignment of value to see 'nil' output in the print function


//OPTIONAL BINDING - rather then doing the 'if' statement, this does the same thing 
//(checking the optional first), it tests the existence of a value first and if it's 
//not nil it's implicitly unwrapped and assigned to a temporary constant

var givenName: String = "Bob"
var middleName: String? = "Milly"
var familyName: String = "Mack"

// Create a tuple that takes the full name
var fullName = (firstName: givenName, middleName: middleName, lastName: familyName)



// Add a condition to check to see if the optional has a value
if fullName.middleName != nil {
    let name = fullName.middleName!
    print("You have a middle name of \(name)")
}


// *** Now using optional binding "if let" does the same thing as the above if statement
if let middleNameExists = fullName.middleName {
    print("You have a middle name of \(middleNameExists) as determined by using optional binding")
}

// Binding WHERE clause is good if you are only interested in the value that you deem important

if let middleNamePass = fullName.middleName
    where middleNamePass.characters.count == 4 {
        print("You have a middle name of \(middleNamePass) as determined by using optional binding")
    }


// *** Using guard-else to optionally bind AND output depending on whether the optional is nil or not. Basically only let's the assignment occur OR it completely jumps out

var displayName: String {
    guard let tempMiddleName = fullName.middleName else {
        return fullName.firstName + " " + fullName.lastName + "... you're unique - you don't have a middle name"
    }
    return fullName.firstName + " " + tempMiddleName + " " + fullName.lastName
}

print("Hello there, \(displayName)!")

// OPTIONAL CHAINING - Allows chaining a # of queries into optional's value and if all optional in the chain have a value then it'll succeed otherwise it will fail

var errorCodeString: String?
errorCodeString = "60"
var errorDescription : String?
if let theError = errorCodeString, errorCodeInteger = Int(errorCodeString!)
    where errorCodeInteger == 60 {
        errorDescription = ("Error-\(errorCodeInteger): Carbon-based error occurring 60cm from device")
}

var upcaseErrorDescription = errorDescription?.uppercaseString
print(upcaseErrorDescription)

// MODIFYING OPTIONAL IN PLACE - can modify an optional, it's helpful if you want to update a string inside the optional and if there was no vlaue in the optional, it won't update

upcaseErrorDescription?.appendContentsOf(", PLEASE TRY AGAIN")
print(upcaseErrorDescription)

// NIL COALESCING OPTIONAL - OR giving an optional a default value when it is nil

// use a nil coalesing operator: "??"

let description = errorDescription ?? "No error"

