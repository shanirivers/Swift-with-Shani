/*SWITCH

SWITCH STATEMENTS consider a value and try to match it to a number of cases, it there's a 
match, it'll execute the code associated with it. 

the default case is executed when there isn't a match, it isn't mandatory if you have 
accounted for all and every value

SetUp: */

var statusCode: Int = 404
var errorString: String

switch statusCode {
case 400:
errorString = "Bad request"

default:
errorString = "none"
}

//Switch statements with multiple values
var errorString: String = "The request failed with the error:"

... 
case 400,401,403,404:
errorString = "There was something wrong with the reques."
fallthrough // control transfer stmt, all you to modfiy the order fo execution in some control 
//flow. using it transfer control, hand off to the case below it, asllow you to enter a case 
//and execute its code w/o having to match against it and even though first case matches, the 
//switch statement will continue through the rest of it and not stop, w/o it would stop at the 
// first match
default:
errorString += " Please review the request and try again."

// Ranges
case 100,101:
case 300...307 // "..." is called range mapping

// Value binding bind the matching value in a certain case to a locla const/var to use only
// within matching case's body

case 100,101:
	errorString += " Informational, \(statusCode)"
	
// Where clauses - allows you to check for additional conditions w/in stmt, creates a sort
// of dynamic filter w/in the switch

case let unknownCode where (unknownCode >= 200 && unknowCode < 300) || unknownCode > 505:
	errorString = "\(unknownCode) is not a know error code"
default:
	errorString = "Unexpected error encountered"
	
// Tuples - logically relate grouping of values determined by developer, the different 
// values become a single, compound value, resulting in an ordered list of elements

let error = (statusCode, errorString)
	/// accessing values by indexing
	error.0
	error.1
	// with named index
let error = (code: statusCode, error: errorString)
	error.code
	error.error



// Pattern matching - tuples are helpful in pattern matching(interval matching)

let error = (code: statusCode, error: errorString)
	error.code
	error.error
	
let firstErrorCode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorCode, secondErrorCode)

switch errorCodes {
case (404, 404):
	print("ALL items found")
case (404, _):				// the underscore is a wildcard and will match anything
	print ("First item found")
case (_,404):
	print("Second item found")
default:
	print("NO items found.")
}












