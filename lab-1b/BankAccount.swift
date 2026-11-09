import Foundation

public class BankAccount {

private var balance: Double
public init(initialBalance: Double) {
    if initialBalance >= 0 {
        balance = initialBalance
    } else {
        balance = 0
        print("Invalid initial balance. Account started with ₹0.")
    }
}
public func deposit(amount: Double) {
    if amount <= 0 {
        print("Deposit amount must be greater than zero.")
    } else {
        balance += amount
        print("Deposited: ₹\(amount)")
    }
}
public func withdraw(amount: Double) {
    if amount <= 0 {
        print("Withdrawal amount must be greater than zero.")
    } else if amount > balance {
        print("Insufficient balance.")
    } else {
        balance -= amount
        print("Withdrawn: ₹\(amount)")
    }
}
public func checkBalance() -> Double {
    return balance
}

}
