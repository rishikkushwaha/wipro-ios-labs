import Foundation

// Course names
var courses = ["Swift", "Python", "Java", "C++", "JavaScript"]

print("========== ARRAY OPERATIONS ==========")

// Display original courses
print("\nOriginal Courses:")
print(courses)

// Add a course
courses.append("Kotlin")
print("\nAfter Adding a Course:")
print(courses)

// Remove a course
courses.removeAll { $0 == "Java" }
print("\nAfter Removing Java:")
print(courses)

// Sort courses
courses.sort()
print("\nSorted Courses:")
print(courses)

// Filter courses starting with S
let filteredCourses = courses.filter { $0.hasPrefix("S") }
print("\nCourses Starting With S:")
print(filteredCourses)

// Search for a course
if courses.contains("Python") {
print("\nPython is available in the course list.")
} else {
print("\nPython is not available.")
}






// Set operations

print("\n========== SET OPERATIONS ==========")

// Student IDs with duplicate values
let studentIDs = [101, 102, 103, 101, 104, 102, 105, 103]

print("Original Student IDs:")
print(studentIDs)

// Remove duplicates using Set
let uniqueIDs = Set(studentIDs)

print("\nUnique Student IDs:")
print(uniqueIDs)

// Count unique students
print("\nTotal Unique Students:", uniqueIDs.count)






// Dictionary operations

print("\n========== DICTIONARY OPERATIONS ==========")

// Student IDs and their marks
let studentMarks = [
    101: 85,
    102: 72,
    103: 95,
    104: 60,
    105: 88
]

print("Student Marks:")
print(studentMarks)

// Find the topper
if let topper = studentMarks.max(by: { $0.value < $1.value }) {
    print("\nTopper ID:", topper.key)
    print("Topper Marks:", topper.value)
}

// Find students below the threshold
let threshold = 75

print("\nStudents scoring below", threshold, ":")

for (studentID, marks) in studentMarks {
    if marks < threshold {
        print("Student ID:", studentID, "Marks:", marks)
    }
}












// Enum and Switch operations

print("\n========== ENUM OPERATIONS ==========")

enum TaskPriority {
    case low
    case medium
    case high
    case urgent
}

let task = TaskPriority.high

switch task {
case .low:
    print("Task Priority: Low - Complete when free")

case .medium:
    print("Task Priority: Medium - Complete soon")

case .high:
    print("Task Priority: High - Complete today")

case .urgent:
    print("Task Priority: Urgent - Complete immediately")
}











