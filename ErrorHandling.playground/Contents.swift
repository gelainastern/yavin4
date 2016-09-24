import Cocoa

enum Token {
    case Number(Double)
    case Plus
    case Minus
    case Multiply
    case Divide
}

class Lexer {
    enum Error: ErrorType {
        case InvalidCharacter(Character)
    }
    
    let input: String.CharacterView
    var position: String.CharacterView.Index
    
    init(input: String) {
        self.input = input.characters
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }
    
    func advance() {
        assert(position < input.endIndex, "Cannot advance past the end!")
        ++position
    }
    
    func getNumber() -> Double {
        var value = 0.0
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                let digitValue = Double(String(nextCharacter))!
                value = 10*value + digitValue
                advance()
            default:
                return value
            }
        }
        return value
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                let value = getNumber()
                tokens.append(.Number(value))
            case "+":
                tokens.append(.Plus)
                advance()
            case "-":
                tokens.append(.Minus)
                advance()
            case "*":
                tokens.append(.Multiply)
                advance()
            case"/":
                tokens.append(.Divide)
                advance()
            case " ":
                advance()
            default:
                throw Error.InvalidCharacter(nextCharacter)
            }
        }
        return tokens
    }
}

class Parser {
    enum Error: ErrorType {
        case UnexpectedEndOfInput
        case InvalidToken(Token)
    }
    
    let tokens: [Token]
    var position = 0
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        return tokens[position++]
    }
    
    func getNumber() throws -> Double {
        guard let token = getNextToken() else {
            throw Error.UnexpectedEndOfInput
        }
        switch token {
        case .Number(var value):
            if let nextToken = getNextToken() {
                switch nextToken {
                case .Plus, .Minus:
                    position--
                    return value
                case .Multiply:
                    value *= try getNumber()
                case .Divide:
                    let divisorResult = try getNumberFollowingDivisor()
                    for i in divisorResult {
                        value /= i
                    }
                    return value
                case .Number(_):
                    throw Error.InvalidToken(nextToken)
                }
            }
            return value
        case .Plus, .Minus, .Multiply, .Divide:
            throw Error.InvalidToken(token)
        }
    }
    
    func getNumberFollowingDivisor() throws -> [Double] {
        var numbers = [Double]()
        guard let token = getNextToken() else {
            throw Error.UnexpectedEndOfInput
        }
        switch token {
        case .Number(let value):
            numbers.append(value)
            if let nextToken = getNextToken() {
                switch nextToken {
                case .Plus, .Minus, .Multiply, .Number(_):
                    position--
                    return numbers
                case .Divide:
                    let returnedArray = try getNumberFollowingDivisor()
                    numbers += returnedArray
                    return numbers
                }
            }
        case .Plus, .Minus, .Divide, .Multiply: return numbers
        }
        return numbers
    }
    
    func parse() throws -> Double {
        var value = try getNumber()
        while let token = getNextToken() {
            switch token {
            case .Plus:
                let nextNumber = try getNumber()
                value += nextNumber
            case .Minus:
                let nextNumber = try getNumber()
                value -= nextNumber
            case .Multiply, .Divide: break
            case .Number: throw Error.InvalidToken(token)
            }
        }
        return value
    }
}

func evaluate(input: String) {
    print("Evaluating \(input)")
    let lexer = Lexer(input: input)
    do {
        let tokens = try lexer.lex()
        print("Lexer output \(tokens)")
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.Error.InvalidCharacter(let character) {
        let charIndex = input.characters.indexOf(character)!
        print("Input contined an invalid character at index \(charIndex) : \(character)")
    } catch Parser.Error.InvalidToken(let token) {
        print("\(token)")
        var newString = ""
        switch token {
        case .Number(let value):
            newString = "\(value)"
        case .Plus:
            newString = "+"
        case .Minus:
            newString = "-"
        default:
            break
        }
        let char = newString[newString.startIndex]
        let tokenIndex = input.characters.indexOf(char)
        print("Invalid token during parsing at index \(tokenIndex!): \(char)")
    } catch Parser.Error.UnexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch {
        print("An error occurred: \(error)")
    }
}

evaluate("10 / 4 + 5 * 3")
