import XCTest
@testable import Modify

final class ModifyTests: XCTestCase {
    
    class Person: Modifiable {
        var name: String
        var age: Int
        init(_ name: String, age: Int) {
            self.name = name
            self.age = age
        }
    }
    
    class Adult: Person {
        var prefession: String?
    }
    
    func testExample() {
        let p = Person("Allen", age: 24)
            .modified(30, for: \.age)
        XCTAssertEqual(p.age, 30)
        let a = Adult("Allen", age: 24)
            .modified(30, for: \.age)
        XCTAssertEqual(a.age, 30)
        let btn = UIButton()
            .tagged(2)
            .alpha(0.5)
            .frame(CGRect(x: 0, y: 0, width: 100, height: 50))
            .clipsToBounds(true)
        XCTAssertEqual(btn.tag, 2)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
