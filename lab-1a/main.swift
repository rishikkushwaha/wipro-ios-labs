import Foundation


// Student details


let studentName = "Rishik"
let rollNumber = "48"

let marks = [85, 78, 92, 88, 76]
let attendance: Double = 100.0

let passingMarks = 35
let minimumAttendance = 85.0


// Calculate total, average and percentage


var total = 0

for mark in marks {
    total += mark
}

let average = Double(total) / Double(marks.count)
let percentage = Double(total) / 500 * 100


// Arithmetic operators


print("\nArithmetic Operators")

let a = 40
let b = 15

print("Addition:", a + b)
print("Subtraction:", a - b)
print("Multiplication:", a * b)
print("Division:", a / b)
print("Remainder:", a % b)


// Comparison operators


print("\nComparison Operators")

print("a is greater than b:", a > b)
print("a is less than b:", a < b)
print("a is equal to b:", a == b)
print("a is not equal to b:", a != b)


// Logical operators


print("\nLogical Operators")

let passedMarks = percentage >= 35
let attendanceOK = attendance >= minimumAttendance

print("AND:", passedMarks && attendanceOK)
print("OR:", passedMarks || attendanceOK)
print("NOT:", !passedMarks)


// Compound assignment operators


print("\nCompound Assignment Operators")

var score = 50

score += 10
print("After adding 10:", score)

score -= 5
print("After subtracting 5:", score)


// Nil-coalescing operator


print("\nNil-Coalescing Operator")

let bonusMarks: Int? = nil
let bonus = bonusMarks ?? 0

print("Bonus marks:", bonus)


// Grade calculation


func calculateGrade(_ percentage: Double) -> String {

    switch percentage {
    case 90...100:
        return "A"

    case 80..<90:
        return "B"
        
    case 70..<80:
        return "C"

    case 60..<70:
        return "D"

    case 50..<60:
        return "E"

    default:
        return "F"
    }
}


// Check student result


func checkResult(marks: [Int], attendance: Double) -> String {

    if marks.count != 5 {
        return "Invalid: Five subjects are required"
    }

    if attendance < 0 || attendance > 100 {
        return "Invalid: Attendance must be between 0 and 100"
    }

    for mark in marks {
        if mark < 0 || mark > 100 {
            return "Invalid: Marks must be between 0 and 100"
        }
    }

    var passed = true

    for mark in marks {
        if mark < passingMarks {
            passed = false
        }
    }

    if passed && attendance >= minimumAttendance {
        return "PASS"
    } else {
        return "FAIL"
    }
}


// Display student result


print("\n========== STUDENT RESULT ==========")

print("Student Name:", studentName)
print("Roll Number:", rollNumber)
print("Subject Marks:", marks)

print("Total Marks:", total)
print("Average:", average)
print("Percentage:", percentage, "%")

let result = checkResult(marks: marks, attendance: attendance)

print("Attendance:", attendance, "%")
print("Result:", result)
if result == "PASS" {
    print("Grade:", calculateGrade(percentage))
} else {
    print("Grade: F")
}


// Test cases


print("\n========== TEST CASES ==========")

let testCases: [(String, [Int], Double)] = [

    ("Normal Pass", [80, 75, 90, 85, 70], 85),

    ("Zero Marks", [0, 0, 0, 0, 0], 90),

    ("Full Marks", [100, 100, 100, 100, 100], 100),

    ("Failing Marks", [80, 75, 34, 85, 70], 90),

    ("Low Attendance", [80, 75, 90, 85, 70], 74),

    ("Invalid Attendance", [80, 75, 90, 85, 70], 101),

    ("Negative Marks", [80, -1, 90, 85, 70], 90),

    ("Marks Above 100", [80, 75, 101, 85, 70], 90),

    ("Less Than Five Subjects", [80, 75, 90, 85], 90)
]

for test in testCases {

    let result = checkResult(marks: test.1, attendance: test.2)

    print(test.0 + ": " + result)
}
