Lab 1C – Collections and Enums

1. Array

An Array stores multiple values in a specific order. It allows duplicate elements and provides access using index positions.

Example: A list of course names.

var courses = ["Swift", "Python", "Java"]

When to use: Use an Array when the order of elements matters, duplicates are allowed, or you need to access elements by index.

2. Set

A Set stores unique values. It automatically removes duplicates, and the order of elements is not guaranteed.

Example: A collection of unique student IDs.

let studentIDs: Set<Int> = [101, 102, 103]

When to use: Use a Set when you need to store unique values and avoid duplicates.

3. Dictionary

A Dictionary stores data as key-value pairs. Each key is unique and is used to access its corresponding value.

Example: Student IDs mapped to marks.

let studentMarks = [
    101: 85,
    102: 72,
    103: 95
]

When to use: Use a Dictionary when you need to associate one value with another and retrieve information using a key.

4. Enum

An Enum represents a fixed group of related options.

Example: Task priority.

enum TaskPriority {
    case low
    case medium
    case high
    case urgent
}

When to use: Use an Enum when a variable should contain one value from a predefined set of choices.

Conclusion

Array, Set, Dictionary, and Enum are useful Swift features for organizing and managing data.

* Array maintains an ordered collection.
* Set stores unique elements.
* Dictionary stores key-value pairs.
* Enum represents a fixed set of related choices.
