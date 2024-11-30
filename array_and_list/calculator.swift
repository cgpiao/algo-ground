import Foundation

let OPERATOR_PLUS = "+"
let OPERATOR_MINUS = "-"
let OPERATOR_MULTI = "*"
let OPERATOR_DIV = "/"
struct ArrayStack<T> {
    var items: Array<T?> = []
    var count = 0
    var size = 0
    init(size: Int) {
        items = Array(repeating: nil, count: size)
        self.size = size
    }

    mutating func push(_ item: T) {
        if (self.count == self.size) {
            let newSize = 2 * self.size
            print("resize \(self.size) -> \(newSize)")
            var temp: Array<T?> = Array(repeating: nil, count: newSize)
            for (i, item) in items.enumerated() {
                temp[i] = item
            }
            items = temp
            self.size = newSize
        }
        items[count] = item
        count += 1
    }

    mutating func pop() -> T? {
        if count == 0 {return nil}
        count -= 1
        let item = items[count]
        items[count] = nil
        return item
    }
}

struct OperatorPriority {
    var name: String
    var priority: Int
    var operandCount: Int
}

// var expression = "1 + 2 * 3 + 10 / 2 - 3" // 9
var expression = " 1 + 2 * 3 + 10 / 2" // 12
var operandStack = ArrayStack<Double>(size: 10)
var operatorStack = ArrayStack<String>(size: 20)

// expression = expression.filter { !$0.isWhitespace }

var priorityMap : [String: OperatorPriority] = [:]
priorityMap[OPERATOR_PLUS] = OperatorPriority(name:OPERATOR_PLUS, priority: 1, operandCount: 2)
priorityMap[OPERATOR_MINUS] = OperatorPriority(name:OPERATOR_MINUS, priority: 1, operandCount: 2)
priorityMap[OPERATOR_MULTI] = OperatorPriority(name:OPERATOR_MULTI, priority: 2, operandCount: 2)
priorityMap[OPERATOR_DIV] = OperatorPriority(name:OPERATOR_DIV, priority: 2, operandCount: 2)

var prevOperator = ""

func calculateReusult(_ a: Double, _ b: Double, _ anOperator: String) -> Double {
    print("calculateReusult: \(b), \(anOperator), \(a)")
    return switch(anOperator) {
        case OPERATOR_PLUS: a + b
        case OPERATOR_MINUS: a - b
        case OPERATOR_MULTI: a * b
        default: b / a
    }
}
for char in expression.split(separator: " ") {
    let currOperator = String(char)
    if let _ = currOperator.firstMatch(of: (try! Regex("[0-9]+"))) {
        operandStack.push(Double(currOperator)!)
    } else {
        if operatorStack.count == 0 {
            operatorStack.push(currOperator)
            prevOperator = currOperator
            continue
        }

        if priorityMap[currOperator]!.priority > priorityMap[prevOperator]!.priority {
            operatorStack.push(currOperator)
            prevOperator = currOperator
            continue
        }
        let a = operandStack.pop()
        let b = operandStack.pop()
        let lastOperator = operatorStack.pop()
        let result = calculateReusult(a!, b!, lastOperator!)
        operandStack.push(result)
        operatorStack.push(currOperator)
        prevOperator = currOperator
    }
}
if operatorStack.count > 0 {
    var o = operatorStack.pop()
    repeat {
        let a = operandStack.pop()
        let b = operandStack.pop()
        let result = calculateReusult(a!, b!, o!)
        operandStack.push(result)
        o = operatorStack.pop()
    } while o != nil
}
print(operandStack)
print(operatorStack)