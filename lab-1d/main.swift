import Foundation

// Student ID and marks
let studentMarks = [
    101: 85,
    102: 72,
    103: 95,
    104: 60,
    105: 88
]

// R1: Function that returns optional marks for a student ID
func findMarks(for studentID: Int) -> Int? {
    return studentMarks[studentID]
}

print("========== OPTIONAL MARKS LOOKUP ==========")

// R2: Using if let
print("\nUsing if let:")

if let marks = findMarks(for: 103) {
    print("Student ID 103 Marks:", marks)
} else {
    print("Student marks not found.")
}

// R2: Using guard let
func displayMarks(for studentID: Int) {
    guard let marks = findMarks(for: studentID) else {
        print("No marks found for Student ID:", studentID)
        return
    }

    print("Student ID:", studentID, "Marks:", marks)
}

print("\nUsing guard let:")
displayMarks(for: 101)

// R2: Optional chaining
struct StudentProfile {
    let name: String?
}

let student: StudentProfile? = StudentProfile(name: "Rahul")

let studentName = student?.name?.uppercased()

print("\nUsing optional chaining:")
print("Student Name:", studentName ?? "Name not available")

// R2: Nil-coalescing operator
let missingStudent: StudentProfile? = nil

let displayName = missingStudent?.name ?? "Unknown Student"

print("\nUsing nil-coalescing operator:")
print("Student Name:", displayName)


// R3: Handling a missing dictionary key
print("\n========== MISSING KEY HANDLING ==========")

displayMarks(for: 999)


// R3: Handling an empty text field
print("\n========== EMPTY TEXT FIELD HANDLING ==========")

func searchStudent(input: String) {
    let enteredText = input.trimmingCharacters(in: .whitespacesAndNewlines)

    guard !enteredText.isEmpty else {
        print("Please enter a Student ID.")
        return
    }

    guard let studentID = Int(enteredText) else {
        print("Invalid Student ID. Please enter a number.")
        return
    }

    displayMarks(for: studentID)
}

// Empty input
searchStudent(input: "   ")

// Valid input
searchStudent(input: "102")

// Invalid input
searchStudent(input: "abc")