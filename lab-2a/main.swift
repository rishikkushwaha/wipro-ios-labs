import Foundation

// ==========================================
// R1: FUNCTIONS
// ==========================================

// Calculate the mean of an array of numbers
func calculateMean(for numbers: [Double]) -> Double? {
    guard !numbers.isEmpty else {
        return nil
    }

    let total = numbers.reduce(0, +)
    return total / Double(numbers.count)
}

// Find the maximum value
func findMaximum(in numbers: [Double]) -> Double? {
    return numbers.max()
}

// Validate an email-like input
func isValidEmail(_ email: String) -> Bool {
    let cleanedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)

    let parts = cleanedEmail.split(separator: "@")

    guard parts.count == 2 else {
        return false
    }

    let username = parts[0]
    let domain = parts[1]

    guard !username.isEmpty,
          !domain.isEmpty,
          let dotIndex = domain.lastIndex(of: ".") else {
        return false
    }

    return dotIndex != domain.startIndex &&
           dotIndex < domain.index(before: domain.endIndex)
}

// Format a display name
func formatDisplayName(_ name: String) -> String {
    let words = name
        .trimmingCharacters(in: .whitespacesAndNewlines)
        .split(whereSeparator: { $0.isWhitespace })

    return words
        .map { $0.capitalized }
        .joined(separator: " ")
}

print("========== R1: FUNCTIONS ==========")

let marks: [Double] = [85, 90, 75, 95, 80]

if let mean = calculateMean(for: marks) {
    print("Mean:", mean)
} else {
    print("No marks available.")
}

if let maximum = findMaximum(in: marks) {
    print("Maximum Marks:", maximum)
} else {
    print("No marks available.")
}

print("Valid Email:", isValidEmail("student@gmail.com"))
print("Invalid Email:", isValidEmail("student@gmail"))

print("Formatted Name:", formatDisplayName("  rahul kumar  "))


// ==========================================
// R2: FILTER, MAP AND REDUCE
// ==========================================

struct Transaction {
    let description: String
    let amount: Double
    let isExpense: Bool
}

print("\n========== R2: FILTER, MAP AND REDUCE ==========")

let transactions = [
    Transaction(description: "Food", amount: 250, isExpense: true),
    Transaction(description: "Salary", amount: 20000, isExpense: false),
    Transaction(description: "Travel", amount: 500, isExpense: true),
    Transaction(description: "Shopping", amount: 1200, isExpense: true),
    Transaction(description: "Freelancing", amount: 3000, isExpense: false)
]

// Select only expenses
let expenses = transactions.filter { $0.isExpense }

print("\nExpenses:")
for expense in expenses {
    print(expense.description, ":", expense.amount)
}

// Transform expenses into an array of amounts
let expenseAmounts = expenses.map { $0.amount }

print("\nExpense Amounts:")
print(expenseAmounts)

// Calculate total expenses
let totalExpenses = expenseAmounts.reduce(0, +)

print("\nTotal Expenses:", totalExpenses)


// ==========================================
// R3: SORT STUDENTS BY MARKS AND NAME
// ==========================================

struct Student {
    let name: String
    let marks: Int
}

print("\n========== R3: STUDENT SORTING ==========")

let students = [
    Student(name: "Rahul", marks: 85),
    Student(name: "Amit", marks: 95),
    Student(name: "Priya", marks: 85),
    Student(name: "Neha", marks: 90),
    Student(name: "Karan", marks: 95)
]

// Sort marks in descending order.
// If marks are equal, sort names alphabetically.
let sortedStudents = students.sorted {
    if $0.marks == $1.marks {
        return $0.name < $1.name
    }

    return $0.marks > $1.marks
}

for student in sortedStudents {
    print(student.name, "-", student.marks)
}


// ==========================================
// R4: LOOP VS HIGHER-ORDER FUNCTIONS
// ==========================================

print("\n========== R4: LOOP VS HIGHER-ORDER FUNCTIONS ==========")

// Solution using a normal loop
func calculateExpensesUsingLoop(
    from transactions: [Transaction]
) -> Double {

    var total = 0.0

    for transaction in transactions {
        if transaction.isExpense {
            total += transaction.amount
        }
    }

    return total
}

// Solution using filter, map and reduce
func calculateExpensesUsingFunctions(
    from transactions: [Transaction]
) -> Double {

    return transactions
        .filter { $0.isExpense }
        .map { $0.amount }
        .reduce(0, +)
}

let loopTotal = calculateExpensesUsingLoop(from: transactions)

let functionTotal = calculateExpensesUsingFunctions(
    from: transactions
)

print("Total Using Loop:", loopTotal)
print("Total Using Higher-Order Functions:", functionTotal)


// ==========================================
// R5: CLEAR PARAMETER LABELS AND RETURN TYPES
// ==========================================

print("\n========== R5: FUNCTION DESIGN ==========")

func calculatePercentage(
    obtainedMarks: Double,
    totalMarks: Double
) -> Double? {

    guard totalMarks > 0 else {
        return nil
    }

    return (obtainedMarks / totalMarks) * 100
}

if let percentage = calculatePercentage(
    obtainedMarks: 425,
    totalMarks: 500
) {
    print("Percentage:", percentage)
} else {
    print("Invalid total marks.")
}

print("\nAll Lab 2A operations completed.")