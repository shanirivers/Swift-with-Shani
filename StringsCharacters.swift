//: Playground - noun: a place where people can play

import Cocoa

/* STRINGS & CHARACTERS 
    a series of characters represented by the String type, contents of a string are 
    accessed in many ways - 
    but look at strings as a collection of characters. NOTE: Strings are value types
*/

// INITIALIZING AN EMPTY STRING - either: 
// 1. Assign an empty string literal 
var emptyString = ""

// 2. Initialize a new string instance
var stringInitializeInstance = String()

// isEmpty property
if emptyString.isEmpty {
    print("This variable has nothing inside")
}

// WORKING WITH CHARACTERS - for-in

var anAnimal = "Dog!"
for character in anAnimal.characters {
    print(character)
}


// CONCATENATION STRINGS & CHARACTERS
let firstString = "Hello"
let secondString = "there"

var greeting = firstString + " " + secondString

let exclamationPoint = "!"

greeting += exclamationPoint

var otherGreeting = "Hi "

// appendContentsOf()
greeting.appendContentsOf("there!")

// append() - append a Character value to a String variable with the String type’s append() method:
var aChar: Character = "!"

greeting.append(aChar)


/* UNICODE: An international standard for encoding, representing and processing text. 
Enables you to represent almost any character from any language in standardized form, 
and to read & write these characters.
    string and character types are fully unicode compliant */
// UNICODE SCALARS -  Unicode scalar is a unique 21-bit number for a character or modifier 
// like  U+1F425 for FRONT-FACING BABY CHICK ("🐥")

// Escaping special characters: \n \t \r \0 \\ \' \"

// see http://en.wikipedia.org/wiki/List_of_Unicode_characters for more character codes

// Show how to do this to change the button title when app loads - open calculator app

@IBOutlet weak var squareButton: UIButton!
    
    override func viewDidLoad() {
        squareButton.setTitle("\u{0078}\u{00B2}", forState: .Normal)
    }

/* extended grapheme cluster is a sequence of one or more Unicode scalars that 
(when combined) produce a single human-readable character. */


let combinedEAcute: Character = "\u{65}\u{301}"

var  testingSubscript = "\u{0078}\u{00B2}" // is x^2 

//testingSubscript += "\u{00B2}"

testingSubscript.characters.count

// COUNTING CHARACTERS
// count 

greeting.characters.count


// ACCESSING & MODIFYING A STRING

// String indices : each string value asso'd with index type, String.index corresponds to position of ea 
// character in string

/*  IMPORTANT! Swift strings can't be indexed by integer values, therefore have to use startIndex 
    and endIndex to access the beginning and ending of a string's characters because you must 
    iterate over ea. unicode scalar and requires different amt of memory
    
    the list of methods are below:
*/

// predessor() - A String.Index value can access its immediately preceding index
var germanGreeting = "Guten Tag!"
germanGreeting.endIndex
germanGreeting.startIndex
var anIndex = germanGreeting.endIndex.predecessor()
germanGreeting[anIndex]


// successor() - immediately succeeding index 
var successorIndex = germanGreeting.startIndex.successor()
germanGreeting[successorIndex]

// advanceBy(_:) - Any index in a String can be accessed from any other index by chaining these
// methods together, or by using the advancedBy(_:) method
let index = germanGreeting.startIndex.advancedBy(7)
germanGreeting[index]

// rangeOfString

germanGreeting.rangeOfString("!")

// indices - property to create a Range of all the indices used to access individual chars 
// in a string
for index in germanGreeting.characters.indices {
    print ("\(germanGreeting[index])-", terminator: "")
    print(index)
}



// INSERTING & REMOVING

// insert(_:atIndex) -  insert a character into a string at a specified index,
greeting.insert("!", atIndex: greeting.endIndex)


// removeRange(_:) - To remove a substring at a specified range
germanGreeting.removeRange(germanGreeting.endIndex.advancedBy(-4)..<germanGreeting.endIndex)

// insertContentsOf(_:at) -  insert the contents of another string at a specified index
germanGreeting.insertContentsOf(" Morgen".characters, at: germanGreeting.endIndex.predecessor())

// removeAtIndex(_:) -  remove a character from a string at a specified index
greeting.removeAtIndex(greeting.endIndex.predecessor())

greeting

// COMPARING STRINGS & CHARACTERS

// use comparison operators that we already know:  == & !=
var otherGreeting = "Hello there!"

greeting == otherGreeting
greeting == germanGreeting


// Prefix & Suffix Equality: checks whether a string has a particular string prefix or suffix and
// returns a Bool value

// hasSuffix(_:)
var otherPhrase = "Guten Abend"
otherPhrase.hasSuffix("Abend")

// hasPrefix(_:)
germanGreeting.hasPrefix("Guten")
