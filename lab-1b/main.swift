import Foundation

// Create a bank account

let account = BankAccount(initialBalance: 5000)

print("========== BANK ACCOUNT ==========")

// Check initial balance
print("Initial Balance: ₹\(account.checkBalance())")

// Deposit money
print("\nDepositing money:")
account.deposit(amount: 1000)
account.deposit(amount: 0)
account.deposit(amount: -500)

// Withdraw money
print("\nWithdrawing money:")
account.withdraw(amount: 2000)
account.withdraw(amount: 10000)
account.withdraw(amount: -500)

// Check final balance
print("Final Balance: ₹\(account.checkBalance())")

// Test invalid account setup
print("\nTesting invalid account:")

let invalidAccount = BankAccount(initialBalance: -1000)

print("Invalid Account Balance: ₹\(invalidAccount.checkBalance())")


// Access modifier demonstration

print("\n========== ACCESS MODIFIERS ==========")

let demo = AccessDemo()

// Internal and public properties can be accessed here
print(demo.internalMessage)
print(demo.publicMessage)

// Private and fileprivate properties cannot be accessed directly here.
// They are demonstrated through showMessages().

print("\nAccessing messages through the class method:")
demo.showMessages()
