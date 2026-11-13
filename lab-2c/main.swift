import Foundation

// ==========================================
// R1: PROTOCOL AND CONFORMANCE
// ==========================================

protocol Displayable {
    var displayInfo: String { get }
}

struct Student: Displayable {
    let name: String
    let marks: Int

    var displayInfo: String {
        return "Student: \(name), Marks: \(marks)"
    }
}

struct Course: Displayable {
    let name: String
    let instructor: String

    var displayInfo: String {
        return "Course: \(name), Instructor: \(instructor)"
    }
}

print("========== R1: PROTOCOLS ==========")

let student = Student(name: "Rahul", marks: 90)
let course = Course(name: "Swift", instructor: "Amit")

print(student.displayInfo)
print(course.displayInfo)


// ==========================================
// R2: EXTENSION
// ==========================================

extension String {
    var wordCount: Int {
        let words = self.split(whereSeparator: { $0.isWhitespace })
        return words.count
    }
}

print("\n========== R2: EXTENSIONS ==========")

let message = "Swift is easy to learn"

print("Message:", message)
print("Word Count:", message.wordCount)


// ==========================================
// R3: GENERIC STACK
// ==========================================

struct Stack<T> {
    private var items: [T] = []

    var isEmpty: Bool {
        return items.isEmpty
    }

    mutating func push(_ item: T) {
        items.append(item)
    }

    mutating func pop() -> T? {
        return items.popLast()
    }

    func peek() -> T? {
        return items.last
    }
}

print("\n========== R3: GENERIC STACK ==========")

var numberStack = Stack<Int>()

numberStack.push(10)
numberStack.push(20)
numberStack.push(30)

print("Is Stack Empty:", numberStack.isEmpty)
print("Top Element:", numberStack.peek() ?? 0)
print("Removed Element:", numberStack.pop() ?? 0)
print("New Top Element:", numberStack.peek() ?? 0)

var stringStack = Stack<String>()

stringStack.push("Swift")
stringStack.push("Python")

print("String Stack Top:", stringStack.peek() ?? "Empty")


// ==========================================
// R4: GENERIC FUNCTION WITH PROTOCOL CONSTRAINT
// ==========================================

print("\n========== R4: GENERIC CONSTRAINTS ==========")

func showDetails<T: Displayable>(_ item: T) {
    print(item.displayInfo)
}

// Valid use: Student conforms to Displayable
showDetails(student)

// Valid use: Course conforms to Displayable
showDetails(course)

// Invalid use:
// Uncommenting the following line causes a compile-time error
// because Int does not conform to Displayable.
//
// showDetails(100)

print("Both valid protocol-constrained calls worked.")


// ==========================================
// R5: EXTENSION VS NEW TYPE
// ==========================================

print("\n========== R5: EXTENSIONS AND STORED STATE ==========")

print("Extensions can add computed properties and methods.")
print("Extensions cannot add stored properties to existing types.")
print("A new type should be created when new stored state is required.")

print("\nAll Lab 2C operations completed.")