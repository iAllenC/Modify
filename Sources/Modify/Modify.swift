
import Foundation

public protocol Modifiable {
    associatedtype Root
    func modified<Value>(_ value: Value, for keyPath: ReferenceWritableKeyPath<Root, Value>) -> Root
    
}

extension Modifiable {
    
    public func modified<Value>(_ value: Value, for keyPath: ReferenceWritableKeyPath<Self, Value>) -> Self {
        self[keyPath: keyPath] = value
        return self
    }
    
}

public protocol ModifiableValue {
    func modified<Value>(_ value: Value, for keyPath: WritableKeyPath<Self, Value>) -> Self
}

extension ModifiableValue {
    public func modified<Value>(_ value: Value, for keyPath: WritableKeyPath<Self, Value>) -> Self {
        var copy = self
        copy[keyPath: keyPath] = value
        return copy
    }
}

protocol Modify {
    func modified<Value>(_ value: Value, for keyPath: WritableKeyPath<Self, Value>) -> Self
}

extension NSObject: Modifiable { }
