import Cocoa

var errorCodeString: String?
errorCodeString = "Cat"
var errorDescription: String?
if let theError = errorCodeString, errorCodeInteger = Int(theError) where errorCodeInteger == 404 {
        errorDescription = ("\(errorCodeInteger + 200): the requested resource was not found.")
}

var upCaseErrorDescription = errorDescription?.uppercaseString
upCaseErrorDescription?.appendContentsOf(" PLEASE TRY AGAIN.")
upCaseErrorDescription

let description = errorDescription ?? "No error"

upCaseErrorDescription!.appendContentsOf(" PLEASE TRY AGAIN")
upCaseErrorDescription


// The error is telling me I gave the computer a bad instruction by causing it to force unwrap a nil value. The error is "fatal error: unexpectedly found nil while unwrapping an Optional"