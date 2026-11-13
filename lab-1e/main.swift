import Foundation

// ==========================================
// R1: STRUCT AND CLASS
// ==========================================

// Course is a struct (value type)
struct Course {
    var name: String
    var instructor: String
    var students: Int
}

// CourseManager is a class (reference type)
class CourseManager {
    var courses: [Course] = []

    func addCourse(_ course: Course) {
        courses.append(course)
    }

    func displayCourses() {
        for course in courses {
            print("Course:", course.name)
            print("Instructor:", course.instructor)
            print("Students:", course.students)
            print()
        }
    }
}

print("========== R1: STRUCT AND CLASS ==========")

let swiftCourse = Course(
    name: "Swift",
    instructor: "Amit",
    students: 30
)

let manager = CourseManager()
manager.addCourse(swiftCourse)

manager.displayCourses()


// ==========================================
// R2: VALUE VS REFERENCE BEHAVIOUR
// ==========================================

print("========== R2: VALUE VS REFERENCE ==========")

// Struct copy
var originalCourse = Course(
    name: "Python",
    instructor: "Rahul",
    students: 25
)

var copiedCourse = originalCourse

// Modify the copied value
copiedCourse.name = "Java"

print("\nStruct Behaviour:")
print("Original Course:", originalCourse.name)
print("Copied Course:", copiedCourse.name)

// Class copy
class CourseRecord {
    var name: String

    init(name: String) {
        self.name = name
    }
}

let originalRecord = CourseRecord(name: "Python")
let copiedRecord = originalRecord

// Modify the copied reference
copiedRecord.name = "Java"

print("\nClass Behaviour:")
print("Original Record:", originalRecord.name)
print("Copied Record:", copiedRecord.name)


// ==========================================
// R3: TEACHER AND CLASSROOM RELATIONSHIP
// ==========================================

print("\n========== R3: WEAK REFERENCES ==========")

class Teacher {
    let name: String

    // Teacher does not own the classroom
    weak var classroom: Classroom?

    init(name: String) {
        self.name = name
    }
}

class Classroom {
    let roomName: String

    // Classroom strongly owns its assigned teacher
    var teacher: Teacher?

    init(roomName: String) {
        self.roomName = roomName
    }
}

func demonstrateClassroomRelationship() {
    let teacher = Teacher(name: "Amit")
    var classroom: Classroom? = Classroom(roomName: "Room 101")

    classroom?.teacher = teacher
    teacher.classroom = classroom

    print("Teacher:", teacher.name)
    print("Classroom:", classroom?.roomName ?? "Not assigned")

    // Release the classroom
    classroom = nil

    if teacher.classroom == nil {
        print("Classroom reference is now nil.")
    }
}

demonstrateClassroomRelationship()


// ==========================================
// R4: STRONG REFERENCE CYCLE AND ITS FIX
// ==========================================

print("\n========== R4: ARC AND REFERENCE CYCLE ==========")

class ClosureOwner {
    let name: String
    var action: (() -> Void)?

    init(name: String) {
        self.name = name
    }

    // This creates a strong reference cycle
    func createStrongCycle() {
        action = {
            print("Action performed by", self.name)
        }
    }

    // This avoids a strong reference cycle
    func createSafeClosure() {
        action = { [weak self] in
            guard let self = self else {
                print("Owner no longer exists.")
                return
            }

            print("Action performed by", self.name)
        }
    }

    deinit {
        print(name, "has been deallocated.")
    }
}

// Demonstrating a strong reference cycle

var strongOwner: ClosureOwner? = ClosureOwner(name: "Strong Owner")

weak var weakStrongOwner: ClosureOwner? = strongOwner

strongOwner?.createStrongCycle()

strongOwner = nil

if weakStrongOwner != nil {
    print("Strong reference cycle exists.")
}

// Break the cycle manually
weakStrongOwner?.action = nil

if weakStrongOwner == nil {
    print("Strong reference cycle has been removed.")
}


// Demonstrating the weak capture solution

var safeOwner: ClosureOwner? = ClosureOwner(name: "Safe Owner")

weak var weakSafeOwner: ClosureOwner? = safeOwner

safeOwner?.createSafeClosure()

safeOwner = nil

if weakSafeOwner == nil {
    print("Weak capture allows the owner to be deallocated.")
}


// ==========================================
// R5: VALUE SEMANTICS, REFERENCE SEMANTICS
// AND ARC
// ==========================================

print("\n========== R5: MEMORY MANAGEMENT ==========")

print("Structs use value semantics.")
print("Classes use reference semantics.")
print("ARC manages the lifetime of class instances.")
print("Strong references keep objects alive.")
print("Weak references do not keep objects alive.")
print("Unowned references are used when another object")
print("is guaranteed to outlive the reference.")