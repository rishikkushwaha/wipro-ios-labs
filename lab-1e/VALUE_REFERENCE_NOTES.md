Lab 1E – Structures, Classes and Memory Management

1. Structures

A structure is a value type in Swift.

When a struct is copied, an independent value is created. Changes to the copy do not affect the original.

Example: Course.

2. Classes

A class is a reference type in Swift.

When a class instance is assigned to another variable, both variables refer to the same instance. Changes through one reference are visible through the other.

Example: CourseManager.

3. Value Semantics vs Reference Semantics

* Structs use value semantics.
* Classes use reference semantics.
* Modifying a struct copy does not change the original.
* Modifying an object through another class reference affects the same instance.

4. Strong, Weak and Unowned References

Strong

A strong reference keeps an object alive.

Weak

A weak reference does not keep an object alive. It becomes nil when the referenced object is deallocated.

Unowned

An unowned reference does not keep an object alive. It should only be used when the referenced object is guaranteed to remain alive whenever the reference is accessed.

5. Automatic Reference Counting (ARC)

ARC manages the memory of class instances.

It keeps track of strong references and deallocates an object when no strong references remain.

6. Strong Reference Cycle

A strong reference cycle occurs when two objects strongly retain each other, directly or indirectly.

A closure can also create a cycle when an object strongly captures itself through a closure that it owns.

7. Fixing a Strong Reference Cycle

A capture list such as [weak self] prevents the closure from strongly retaining its owner.

This allows ARC to deallocate the object when its other strong references are released.

8. Stack and Heap

Value semantics and reference semantics describe how values and references behave. They do not mean that every struct always lives on the stack or every class always lives on the heap.

Actual memory placement depends on Swift’s implementation and optimization.

Conclusion

Structs, classes and ARC help manage data, object relationships and memory safely in Swift.