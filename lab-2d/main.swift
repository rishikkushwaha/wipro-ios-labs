import Foundation

// ==========================================
// R1: CUSTOM VALIDATION ERROR
// ==========================================

enum ValidationError: Error {
    case emptyName
    case invalidMark
    case invalidID
}

// Student model
struct Student {
    let id: Int
    let name: String
    let mark: Int
}

// ==========================================
// R2: THROWING STUDENT REGISTRATION
// ==========================================

func registerStudent(
    id: Int,
    name: String,
    mark: Int
) throws -> Student {

    let cleanedName = name.trimmingCharacters(
        in: .whitespacesAndNewlines
    )

    guard !cleanedName.isEmpty else {
        throw ValidationError.emptyName
    }

    guard mark >= 0 && mark <= 100 else {
        throw ValidationError.invalidMark
    }

    guard id > 0 else {
        throw ValidationError.invalidID
    }

    return Student(
        id: id,
        name: cleanedName,
        mark: mark
    )
}

// ==========================================
// R3: ERROR HANDLING USING DO/CATCH
// ==========================================

func displayRegistration(
    id: Int,
    name: String,
    mark: Int
) {
    do {
        let student = try registerStudent(
            id: id,
            name: name,
            mark: mark
        )

        print("Registration successful!")
        print("Student ID:", student.id)
        print("Student Name:", student.name)
        print("Student Mark:", student.mark)

    } catch ValidationError.emptyName {
        print("Error: Student name cannot be empty.")

    } catch ValidationError.invalidMark {
        print("Error: Marks must be between 0 and 100.")

    } catch ValidationError.invalidID {
        print("Error: Student ID must be greater than zero.")

    } catch {
        print("An unexpected error occurred.")
    }
}

print("========== R1, R2 AND R3: THROWING FUNCTION ==========")

// Valid registration
print("\nValid Registration:")
displayRegistration(id: 101, name: "Rahul", mark: 85)

// Empty name
print("\nEmpty Name:")
displayRegistration(id: 102, name: "   ", mark: 75)

// Invalid marks
print("\nInvalid Marks:")
displayRegistration(id: 103, name: "Amit", mark: 120)

// Invalid ID
print("\nInvalid ID:")
displayRegistration(id: 0, name: "Priya", mark: 90)


// ==========================================
// R4: OPTIONAL RETURN APPROACH
// ==========================================

func registerStudentOptional(
    id: Int,
    name: String,
    mark: Int
) -> Student? {

    return try? registerStudent(
        id: id,
        name: name,
        mark: mark
    )
}

print("\n========== R4: OPTIONAL RETURN ==========")

if let student = registerStudentOptional(
    id: 104,
    name: "Neha",
    mark: 92
) {
    print("Registration successful:", student.name)
} else {
    print("Registration failed. Invalid student details.")
}


// ==========================================
// R4: RESULT TYPE APPROACH
// ==========================================

func registerStudentResult(
    id: Int,
    name: String,
    mark: Int
) -> Result<Student, ValidationError> {

    do {
        let student = try registerStudent(
            id: id,
            name: name,
            mark: mark
        )

        return .success(student)

    } catch let error as ValidationError {
        return .failure(error)

    } catch {
        // This should not occur with the current validation function.
        return .failure(.invalidID)
    }
}

print("\n========== R4: RESULT TYPE ==========")

let registrationResult = registerStudentResult(
    id: 105,
    name: "",
    mark: 80
)

switch registrationResult {
case .success(let student):
    print("Registration successful:", student.name)

case .failure(let error):
    switch error {
    case .emptyName:
        print("Result Error: Student name cannot be empty.")

    case .invalidMark:
        print("Result Error: Marks must be between 0 and 100.")

    case .invalidID:
        print("Result Error: Student ID must be greater than zero.")
    }
}


// ==========================================
// R5: SAFE INVALID INPUT HANDLING
// ==========================================

print("\n========== R5: SAFE INPUT HANDLING ==========")

let testRegistrations = [
    (id: 106, name: "Karan", mark: 88),
    (id: -1, name: "Ravi", mark: 70),
    (id: 107, name: "Anjali", mark: 150),
    (id: 108, name: "   ", mark: 80)
]

for registration in testRegistrations {
    displayRegistration(
        id: registration.id,
        name: registration.name,
        mark: registration.mark
    )
}

print("\nAll Lab 2D operations completed.")