import Foundation

// ==========================================
// R1: SORT STUDENTS USING A CLOSURE
// ==========================================

struct Student {
    let name: String
    let marks: Int
}

print("========== R1: CLOSURE SORTING ==========")

let students = [
    Student(name: "Rahul", marks: 85),
    Student(name: "Amit", marks: 95),
    Student(name: "Priya", marks: 85),
    Student(name: "Neha", marks: 90),
    Student(name: "Karan", marks: 95)
]

// Sort by marks in descending order
let sortedStudents = students.sorted {
    $0.marks > $1.marks
}

for student in sortedStudents {
    print(student.name, "-", student.marks)
}


// ==========================================
// R2: COMPLETION CLOSURE
// ==========================================

print("\n========== R2: COMPLETION CLOSURE ==========")

func performOperation(completion: () -> Void) {
    print("Operation started.")

    // Simulate some work
    Thread.sleep(forTimeInterval: 1)

    print("Operation completed.")

    // Call completion closure
    completion()
}

performOperation {
    print("Completion closure called successfully.")
}


// ==========================================
// R3: TRAILING CLOSURE AND ARGUMENT NAMES
// ==========================================

print("\n========== R3: TRAILING CLOSURE ==========")

let numbers = [10, 20, 30, 40, 50]

// Trailing closure with shorthand argument name
let doubledNumbers = numbers.map {
    $0 * 2
}

print("Using shorthand arguments:")
print(doubledNumbers)

// Same example using explicit argument names
let doubledNumbersExplicit = numbers.map { number in
    number * 2
}

print("\nUsing explicit argument names:")
print(doubledNumbersExplicit)


// ==========================================
// R4: COUNTER CLOSURE AND CAPTURED STATE
// ==========================================

print("\n========== R4: COUNTER CLOSURE ==========")

func createCounter() -> () -> Int {
    var count = 0

    let counter = {
        count += 1
        return count
    }

    return counter
}

let counter = createCounter()

print("Counter:", counter())
print("Counter:", counter())
print("Counter:", counter())


// ==========================================
// R5: AVOIDING STRONG REFERENCE CYCLES
// ==========================================

print("\n========== R5: AVOIDING RETAIN CYCLES ==========")

class DownloadManager {
    var completionHandler: (() -> Void)?

    func startDownload() {
        print("Download started.")

        // Weak capture prevents a strong reference cycle
        completionHandler = { [weak self] in
            guard let self = self else {
                print("Download manager no longer exists.")
                return
            }

            print("Download completed by", self)
        }
    }

    deinit {
        print("DownloadManager deallocated.")
    }
}

var manager: DownloadManager? = DownloadManager()

weak var weakManager = manager

manager?.startDownload()

manager = nil

if weakManager == nil {
    print("Weak capture allowed DownloadManager to deallocate.")
}

print("\nAll Lab 2B operations completed.")