//https://www.makeschool.com/tutorials/learn-swift-by-example-part-1-structs/structs-in-swift

//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"





/* CLASSES & STRUCTURES - general, flexible constructs that will be building blocks of
your code. Can define properties, methods for functionality using same syntax as for
const, vars and funcs */

/*  Structure: a container or collection of different elements with possibility to add 
funcs to manipulate them,
they're a value type => (copies everything) */

// SYNTAX
struct SomeStructure {
    // structure definition goes here
}

// TUPLE EXAMPLE

var fullName = (firstName: "Paul", middleName: "Tom", lastName: "Small")

// As a struct

struct Player {
    let firstName: String
    let middleName: String
    let lastName: String
}

// Create instances (or initializing a struct) - default behaviour is a 'memberwise 
// initializer' where it takes ea field of struct as a parameter

let player1 = Player(firstName: "Paul", middleName: "Tom", lastName: "Small")
let player2 = Player(firstName: "Phil", middleName: "", lastName: "Jones")

// Accessing, use dot-notation

player1.firstName
player2.firstName
// player1.firstName = "Bob" show you can't change constant values

// Show how structs are more powerful than tuples -> ADD A METHOD AKA FUNCTION

struct PlayerExpanded { // all variables and constants = properties
    let name: String
    let middleName: String?
    let lastName: String
    let age: Int
    
    func fullName() -> String {
        return "\(name) \(lastName)"
    }
    
}

let player3 = PlayerExpanded(name: "Bob", middleName: "Pete" ,lastName: "Smith", age: 25)

player3.fullName()

/* The struct construct was created to enforce immutability, 

when a struct variable is assigned to
another variable, it is assigned by copy. 

This means that the new struct was created with the
same values, this also happens when a struct is passed in as a function parameter. 

-> Value type */


struct PlayerMutable {
    var firstName: String
    var lastName: String
    let age: Int
    
    
    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
    
    // Add the following for computed properties
    
}
var guitarPlayer = PlayerMutable(firstName: "Jon", lastName: "Jones", age: 24)

guitarPlayer.firstName = "Jonathan"
guitarPlayer.fullName()

var newBassPlayer = guitarPlayer
newBassPlayer.firstName = "David"
newBassPlayer.fullName()

// COMPUTED PROPERTIES - mechanism to create related properties
/*
they don't store a peroperty -. they provide a getter & a setter (optional) to retrieve
and set other properties and values indirectly. (this applies to enums, classes & structs)


*** SHIT TO MENTION: 
1. Made a mistake on the last video - meant to say 'instantiation' NOT initialization
	because structures initializers are its variables/constants!
2. Re-explain that structures and enums are passed by value, which means that it lives in 
   the heap (or memory) & copies its values once it is mutated or changed (added/subtracted
   a value)
*/

struct PlayerComputed {
    var firstName: String
    var lastName: String
    let age: Int
    
    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
    
    // Add the following for computed properties using a func as an example that shows the diff
    
    func birthYear () -> Int {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day, .Month, .Year], fromDate: date)
        
        let year = components.year
        return year - age
        
    }
    

}

var pianist = PlayerComputed(firstName: "George", lastName: "Smith", age: 25)
pianist.birthYear()


// A computed properties is indistinguishable from a defined property

struct PlayerComputProp {
    var firstName: String
    var lastName: String
    let age: Int
    
    /*classes, structures, and enumerations can define computed properties, which do not actually store a value. Instead, they provide 
    a getter and an optional setter to retrieve and set other properties and values indirectly.*/
    var fullName: String {
        get { return "\(firstName) \(lastName)" } // a getter, same code as above
        set (newFullName) {         // a setter, accepts string that comes in as a full name
        							// also show that you don't have to use name, newValue 
        							// = the short-hand
            let names = newFullName.componentsSeparatedByString(" ") 
            /* creates array of elements by spliting string using the parameter string, 
            in this case its a space */
            firstName = names[0]
            lastName = names[1]
        }
    }
    
    // Add the following for computed properties
    
    var birthYear: Int {
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day, .Month, .Year], fromDate: date)
        
        let year = components.year
        return year - age
        
    }
}

var vocalist = PlayerComputProp(firstName: "Bob", lastName: "Smith", age: 35)
var drummer = vocalist
drummer.firstName
drummer.fullName = "Sue MacIve"
drummer.firstName
vocalist.fullName

// A struct passed in as a parameter in a function
var originalPlayer = PlayerMutable(firstName: "John", lastName: "Goddard", age: 40)

func transformPlayer(var player: PlayerMutable) -> PlayerMutable {
    player.firstName = "Joe"
    player.lastName = "Bidle"
    return player
}

var newPlayer = transformPlayer(originalPlayer)
newPlayer.firstName


