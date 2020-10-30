import XCTest
@testable import Modify

final class ModifyTests: XCTestCase {
    
    class Person: Modify {
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
            .modify(\.age, to: 25)
            .modify {
                $0.name = "Iverson"
            }
        XCTAssert(p.age == 25)
        XCTAssert(p.name == "Iverson")
        let a = Adult("Allen", age: 25)
            .modify(\.age, to: 26)
            .modify(\.prefession, to: "Developer")
            .modify {
                $0.name = "Iverson"
            }
        XCTAssert(a.age == 26)
        XCTAssert(a.prefession == "Developer")
        XCTAssert(a.name == "Iverson")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
