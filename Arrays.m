

import Cocoa

/*  COLLECTIONS TYPES:  ** Collections are mutable, therefore can's use constants
    1. Array ***  Stores values of same type in a ordered list. 
    2. Dictionary
    3. Set
*/

// Array Long-Hand: Array<Element>

var arrayOfInts: Array<Int>  // have to initialize the array first before adding elements to it
arrayOfInts += [1]
// Array Short-Hand

var arrayOfStrings: [String]



// Creating an empty array
var someStrings = [String]()
print("SomeStrings is of type [String] with \(someStrings.count) items")

// Creating array literal
var shoppingList = ["Kimchi", "Coconut milk", "Banana", "Apples"] // Initializing an array w/ a literal

// ACCESSING & MODIFYING

// subscript syntax - retrieving a value using subscript, arrays are zero-indexed

var firstItem = shoppingList[0]

// count
print("shoppingList is of type [String] with \(shoppingList.count) items")

// append(_:) or +=
shoppingList.append("Almond Flour")

shoppingList += ["Dates"]

// insert(_:atIndex)
shoppingList.insert("Dog Food", atIndex: 4)

// removeAtIndex

let dogFood = shoppingList.removeAtIndex(4)

// removeLast

let lastItem = shoppingList.removeLast()


// INTERATING OVER AN ARRAY

// for-in

for item in shoppingList {
    print(item)
}
// enumerate() - method interates over array and returns a tuple composed of the index and the value. 
// you can decopose the tuple into temporary constants/variables as part of the iteration
// DEFINITION: Returns a lazy SequenceType containing pairs (n,x), where ns are consecutive Ints 
// starting at 0 and nx are the elements of base:


for (index, value) in shoppingList.enumerate() {
    print("\(index + 1): \(value)")
}



for (n, c) in "Shani".characters.enumerate() {
    print("\(n): \(c)")
}