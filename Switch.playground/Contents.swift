import Cocoa


// The following code will print "(1, 4) is in quadrant 1"

let point = (x: 1, y: 4)

switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")
case let q2 where (point.x < 0) && (point.y > 0):
    print("\(q2) is in quadrant 2")
case let q3 where (point.x < 0) && (point.y < 0):
    print("\(q3) is in quadrant 2")
case let q4 where (point.x > 0) && (point.y < 0):
    print("\(q4) is in quadrant 2")
case(_, 0):
    print("\(point) sits on the x-axis")
case (0, _):
    print("\(point) sits on the y-axis")
default:
    print("Case not covered.")
}














var statusCode: Int = 404
var errorString: String
switch statusCode {
case 400:
    errorString = "BadRequest"
case 401:
    errorString = "Unautorized"
case 403:
    errorString = "Forbidden"
case 404:
    errorString = "Not found"
default:
    errorString = "None"
}

var secondStatusCode: Int = 405
var secondErrorString: String
switch secondStatusCode {
case 400, 401, 403, 404:
    secondErrorString = "There was something wrong with the request. "
fallthrough
default:
    secondErrorString = "Please review the request and try again."
}

var thirdStatusCode: Int = 404
var thirdErrorString: String = "The request failed with the error:"
switch thirdStatusCode {
case 100, 101:
    thirdErrorString += " Informational, \(thirdStatusCode)."
case 204:
    thirdErrorString += " Successful but no content, 204."
case 300...307:
    thirdErrorString += " Redirection, \(thirdStatusCode)."
case 400...417:
    thirdErrorString += " Client error, \(thirdStatusCode)."
case 500...505:
    thirdErrorString += " Server error, \(thirdStatusCode)."
case let unknownCode:
    thirdErrorString = "\(unknownCode) is not a known error code."
}


var fourthStatusCode: Int = 1000
var fourthErrorString: String = "The request failed with the error:"
switch fourthStatusCode {
case 100, 101:
    fourthErrorString += " Informational, \(fourthStatusCode)."
case 204:
    fourthErrorString += " Successful but no content, 204."
case 300...307:
    fourthErrorString += " Redirection, \(fourthStatusCode)."
case 400...417:
    fourthErrorString += " Client error, \(fourthStatusCode)."
case 500...505:
    fourthErrorString += " Server error, \(fourthStatusCode)."
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:
        fourthErrorString = "\(unknownCode) is not a known error code."
default:
    fourthErrorString = "Unexpected error encountered."
}


var fifthStatusCode: Int = 418
var fifthErrorString: String = "The request failed with the error:"
switch fifthStatusCode {
case 100, 101:
    fifthErrorString += " Informational, \(fifthStatusCode)."
case 204:
    fifthErrorString += " Successful but no content, 204."
case 300...307:
    fifthErrorString += " Redirection, \(fifthStatusCode)."
case 400...417:
    fifthErrorString += " Client error, \(fifthStatusCode)."
case 500...505:
    fifthErrorString += " Server error, \(fifthStatusCode)."
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:
    fifthErrorString = "\(unknownCode) is not a known error code."
default:
    fifthErrorString = "Unexpected error encountered."
}

let error = (code: fifthStatusCode, error: fifthErrorString)
error.code
error.error

let errorCode1 = 404
let errorCode2 = 200
let errorCodes = (errorCode1, errorCode2)

switch errorCodes {
case (404, 404):
    print("No items found.")
case (404, _):
    print("First item not found.")
case (_, 404):
    print("Second item not found.")
default:
    print("All items found.")
}


let age = 25
switch age {
case 18...35:
    print("Cool demographic")
default:
    break
}

if case 18...35 = age where age >= 21 {
    print("In cool demographic and of drinking age")
}














