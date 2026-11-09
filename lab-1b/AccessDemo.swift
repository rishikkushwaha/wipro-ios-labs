import Foundation

public class AccessDemo {

private var privateMessage = "Private: accessible only inside this type"
fileprivate var fileMessage = "Fileprivate: accessible within this file"
internal var internalMessage = "Internal: accessible within this module"
public var publicMessage = "Public: accessible outside this module"
public func showMessages() {
    print(privateMessage)
    print(fileMessage)
    print(internalMessage)
    print(publicMessage)
}

}
