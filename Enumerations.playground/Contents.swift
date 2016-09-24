import Cocoa

enum ShapeDimesions {
    case Point
    case Square(Double)
    case Rectangle(width: Double, height: Double)
    
    /* **************
     SILVER CHALLENGE
     ************** */
    
    case RightTriangle(leg1: Double, leg2: Double, hypotenuse: Double)
    func area() -> Double {
        switch self {
        case .Point:
            return 0
        case let .Square(side):
            return side * side
        case let .Rectangle(width: w, height: h):
            return w * h
        case let .RightTriangle(leg1: l1, leg2: l2, hypotenuse: h):
            return 0.5 * l1 * l2
        }
    }
    
    /* **************
     BRONZE CHALLENGE
     ************** */
    
    func perimeter() -> Double {
        switch self {
        case .Point:
            return 0
        case let .Square(side):
            return side * 4
        case let .Rectangle(width: w, height: h):
            return (w * 2) + (h * 2)
        case let .RightTriangle(leg1: l1, leg2: l2, hypotenuse: h):
            return l1 + l2 + h
        }
    }
}

var squareShape = ShapeDimesions.Square(10.0)
var rectShape = ShapeDimesions.Rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimesions.Point
var triangleShape = ShapeDimesions.RightTriangle(leg1: 3, leg2: 4, hypotenuse: 5)
print("square's area = \(squareShape.area())")
print("rectangle's area = \(rectShape.area())")
print("point's area = \(pointShape.area())")
print("square's perimeter = \(squareShape.perimeter())")
print("rectangle's perimeter = \(rectShape.perimeter())")
print("point's perimeter = \(pointShape.perimeter())")
print("right triangle's area = \(triangleShape.area())")

















enum TextAlignment: Int {
    case Left = 20
    case Right = 30
    case Center = 40
    case Justify = 50
}

var alignment = TextAlignment.Left
alignment = .Right

switch alignment {
case .Left:
    print("left aligned")
case .Right:
    print("right aligned")
case .Center:
    print("center aligned")
case .Justify:
    print("justified")
}

print("Left has a raw value of \(TextAlignment.Left.rawValue)")
print("Right has a raw value of \(TextAlignment.Right.rawValue)")
print("Center has a raw value of \(TextAlignment.Center.rawValue)")
print("Justify has a raw value of \(TextAlignment.Justify.rawValue)")
print("The alignment variable has a raw value of \(alignment.rawValue)")

let myRawValue = 20

if let myAlignment = TextAlignment(rawValue: myRawValue) {
    print("successfully converted \(myRawValue) into a TextAlignment")
} else {
    print("\(myRawValue) has no corresponding TextAlignment case")
}

enum ProgrammingLanguage: String {
    case Swift
    case ObjectiveC = "Objective-C"
    case C = "C"
    case Cpp = "C++"
    case Java = "Java"
}

let myFavoriteLanguage = ProgrammingLanguage.Swift
print("My favorite programming language is \(myFavoriteLanguage.rawValue)")


enum Lightbulb {
    case On
    case Off
    
    func surfaceTemperatureForAmbientTemperature(ambient: Double) -> Double {
        switch self {
        case .On:
            return ambient + 150.0
        case .Off:
            return ambient
        }
    }
    mutating func toggle() {
        switch self {
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
}

var bulb = Lightbulb.On
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")

bulb.toggle()
bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")



enum FamilyTree {
    case NoKnownParents
    indirect case OneKnownParent(name: String, ancestors: FamilyTree)
    indirect case TwoKnownParents(fatherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestors: FamilyTree)
    
}

let fredAncestors = FamilyTree.TwoKnownParents(fatherName: "Fred Sr.", fatherAncestors: .OneKnownParent(name: "Beth", ancestors: .NoKnownParents), motherName: "Marsha", motherAncestors: .NoKnownParents)


















