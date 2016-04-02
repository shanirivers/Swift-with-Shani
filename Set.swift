import Cocoa

/*  COLLECTIONS TYPES:  ** Collections are mutable, therefore can's use constants
    1. Array ***  Stores values of same type in a ordered list. 
    2. Dictionary
	3. Set  *** stores distinct values of the same type in a collection with no defined ordering. 
	-> It's a data structure. When to use a set, when order isn't important.
	
	You can use a set instaead of an array, while the order is not important, if you only 
	item to appear once.  -> like a set of music genres or art styles
	
	The type must be hashable (Int, String, Double, Bool) LIKE dictionary's keys
*/

// CREATING & INITIALIZING AN EMPTY SET

var letters = Set <Character>()

var artStyles = Set <String>()

// if content exist, empty set
letters.insert("a")

letters = []

letters.isEmpty


// CREATING A SET WITH ARRAY LITERALS

var favoriteGenres : Set<String> = ["Rock", "Dubstep", "Alternative", "Rap"]
var favoriteArtStyles: Set<String> = ["Dada", "Baroque", "Art Deco"]

// could also use type inference to create a set with an array literal
var favArtStyles: Set = ["Art Nouveau", "Dada", "Futurism"]

// ACCESSING AND MODIFYING - through methods and properties

// count:
favArtStyles.count

// isEmpty:
favArtStyles.isEmpty

// insert(_:)
favoriteGenres.insert("Pop")

//remove(_:)
favoriteGenres.remove("Rap")

// removeAll(_:)
favArtStyles.removeAll()
favArtStyles

// contains(_:)
favoriteArtStyles.contains("Dada")


// INTERATING OVER A SET
// for-in

for style in favoriteArtStyles {
    print (style)
}


// FUNDAMENTAL SET OPERATIONS

let oddDigits : Set     = [1,3,5,7,9]
let evenDigits : Set    = [2,4,6,8]
let primeDigits : Set   = [2,3,5,7]

// a.intersect(b)
oddDigits.intersect(primeDigits).sort()

// a.exclusiveOr(b)
oddDigits.exclusiveOr(primeDigits).sort()

// a.union(b)
oddDigits.union(evenDigits).sort()

// a.substract(b)
evenDigits.subtract(primeDigits).sort()
oddDigits.subtract(primeDigits).sort()



// SET MEMBERSHIP & EQUALITY
/*  A is a superset of set B ( because A contains all the elements of B)
    B is a subset of A (because all of B's elements are contained in A)
    C & B are disjoint - have no elements in common
*/

// ==

var someDigits = evenDigits

someDigits == evenDigits

someDigits == oddDigits

let littleSetOfDigits :Set = [2,4]

// isSubsetOf(_:)

someDigits.isSubsetOf(evenDigits)

// isSuperSetOf(_:)

evenDigits.isSupersetOf(someDigits)

// isStrictSubsetOf(_:) or isStrictSupersetOf(_:)

littleSetOfDigits.isStrictSubsetOf(evenDigits)
evenDigits.isStrictSupersetOf(littleSetOfDigits)

// isDisjointWith(_:)

evenDigits.isDisjointWith(oddDigits)
evenDigits.isDisjointWith(primeDigits)














