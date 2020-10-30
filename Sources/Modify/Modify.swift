
import Foundation
#if !os(Linux)
  import CoreGraphics
#endif
#if os(iOS) || os(tvOS)
  import UIKit.UIGeometry
#endif

public protocol Modify { }

/// Direct Modify For Reference Type
public extension Modify where Self: AnyObject {
    
    
    /// Modify the value of the defined keypath for self and then return self
    ///
    /// ```
    /// let label = UILabel()
    ///     .modify(\.textColor, to: .black)
    ///     .modify(\.textAlignment, to: .center)
    /// ```
    /// Equals
    /// ```
    /// let label = UILabel()
    /// label.textColor = .black
    /// label.textAlignment = .center
    /// ```
    @discardableResult
    func modify<Value>(_ keyPath: ReferenceWritableKeyPath<Self, Value>, to value: Value) -> Self {
        self[keyPath: keyPath] = value
        return self
    }

    /// Modify self using `modify` then return self
    ///
    /// ```
    /// let btn = UIButton()
    ///     .modify {
    ///         $0.addTarget(self, action: #selector(aSelector), for: .touchUpInside)
    ///         $0.setImage(UIImage(named: "a_icon"), for: .normal)
    ///     }
    /// ```
    /// Equals
    /// ```
    /// let label = UIButton()
    /// btn.addTarget(self, action: #selector(aSelector), for: .touchUpInside)
    /// btn.setImage(UIImage(named: "a_icon"), for: .normal)
    /// ```
    @discardableResult
    func modify(_ modify: (Self) throws -> Void) rethrows -> Self {
        try modify(self)
        return self
    }
}

/// Copied Modify For Value Type
public extension Modify where Self: Any {
    
    /// Make a copy of self, then modify the value of the defined keypath for the copied self and return it
    ///
    /// ```
    /// struct Person: Modify {
    ///     var name: String
    /// }
    /// let p = Person(name: "Allen")
    ///     .modified(\.name, to: "Iverson")
    /// ```
    /// Equals
    /// ```
    /// let p = Person(name: "Allen")
    /// var p1 = p
    /// p1.name = "Iverson"
    /// ```
    func modified<Value>(_ keyPath: WritableKeyPath<Self, Value>, to value: Value) -> Self {
        var copy = self
        copy[keyPath: keyPath] = value
        return copy
    }
    
    /// Make a copy of self, then modify the copied self using `modify` and return self
    ///
    /// ```
    /// let a = [1, 2, 3]
    ///     .modified {
    ///         $0.append(4)
    ///     }
    /// ```
    /// Equals
    /// ```
    /// let a = [1, 2, 3]
    /// var a1 = a
    /// a1.append(4)
    /// ```
    func modified(_ modify: (inout Self) throws -> Void) rethrows -> Self {
        var copy = self
        try modify(&copy)
        return copy
    }
    
}

extension NSObject: Modify { }

#if !os(Linux)
extension CGPoint: Modify { }
extension CGRect: Modify { }
extension CGSize: Modify { }
extension CGVector: Modify { }
#endif

extension String: Modify { }
extension Array: Modify { }
extension Dictionary: Modify { }
extension Set: Modify { }

#if os(iOS) || os(tvOS)
extension UIEdgeInsets: Modify { }
extension UIOffset: Modify { }
extension UIRectEdge: Modify { }
#endif
