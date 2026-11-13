Lab 1D – Swift Optionals

1. What are Optionals?

An optional is a type that can hold either a value or nil.

Example:

var marks: Int? = 85
var missingMarks: Int? = nil

2. if let

if let safely unwraps an optional when a value is available.

if let marks = findMarks(for: 103) {
    print(marks)
} else {
    print("Marks not found")
}

3. guard let

guard let checks whether an optional contains a value. If it does not, the function exits early.

guard let marks = findMarks(for: studentID) else {
    return
}

4. Optional Chaining

Optional chaining allows us to access properties of an optional object safely.

let studentName = student?.name?.uppercased()

If any optional value is nil, the result is nil instead of causing a crash.

5. Nil-Coalescing Operator

The ?? operator provides a default value when an optional is nil.

let name = student?.name ?? "Unknown Student"

6. Handling Missing Values

Dictionary lookups return an optional value when a key may not exist.

Empty text input can be checked using isEmpty.

7. Force Unwrapping

Force unwrapping uses ! to access an optional value directly.

It should generally be avoided because it can cause a runtime crash when the value is nil.

Conclusion

Optionals help handle missing values safely and make Swift programs more reliable.