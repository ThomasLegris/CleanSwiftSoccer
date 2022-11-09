import UIKit
import Foundation

struct MyStruct {
    var title: String
}

class MyClass {
    var title: String

    init(title: String) {
        self.title = title
    }
}

func testStruct() {
    var toto: MyStruct = MyStruct(title: "toto")
    var zaza = toto
    zaza.title = "zaza"
    print("zaza Struct= \(zaza.title)")
    print("toto Struct =\(toto.title)")
}

func testClass() {
    var toto: MyClass = MyClass(title: "toto")
    var zaza = toto
    zaza.title = "zaza"
    print("zaza Class= \(zaza.title)")
    print("toto Class =\(toto.title)")
}

testStruct()
testClass()
