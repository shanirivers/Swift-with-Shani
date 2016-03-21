//: Playground - noun: a place where people can play

import Cocoa

// SWITCH STATEMENTS -- 

var birthYear: Int = 1980
var generationString: String

generationClassifications : switch birthYear {
case 1928..<1964:
    generationString = "Post-War Cohort"
    fallthrough
case 1963...1972:                                                       // "..." RANGE MAPPING - Range operators ... & ..<
    generationString = "Baby Boomers - \(birthYear)" //Value binding
    fallthrough                                                          // fallthrough *
    //break generationClassifications                                          // fallthrough *
case 1955...1965:
    generationString = "Generation Jones - \(birthYear)"
case 1966...1976:
    generationString = "Generation X"
case 1977...1994:
    generationString = "Generation Y"
case 1995...2012:
    generationString = "Generation Z"
    
// Where statement
case let unknownYear where (unknownYear >= 1927 || unknownYear <= 2013):
    generationString = "\(unknownYear) is not associated with a generation at this time"
    
default:
    generationString = "Unexpected value entered"
}

// Tuple 

let generationGroup = (birthYear, generationString)

generationGroup.0
generationGroup.1

// Named tuple

let namedGenerationGroup = (year: birthYear, generation: generationString)
namedGenerationGroup.year
namedGenerationGroup.generation


// Pattern match

let firstBirthYear = 1980
let secondBirthYear = 1980
let birthYears = (firstBirthYear, secondBirthYear)

switch birthYears {
case (1990, 1990):
    print("All years found")
case (1990, _):
    print("year was found in first position")
case (_, 1990):
    print("year was found in the second position")
default:
    print("No items found")
}

let firstErrorCode = 400
let secondErrorCode = 400
let errorCodes = (firstErrorCode, secondErrorCode)

switch errorCodes {
case (404, 404):
    print("all items found")
case (404, _):				// the underscore is a wildcard and will match anything
    print ("First item found")
case (_,404):
    print("Second item found")
default:
    print("no items found.")
}




























