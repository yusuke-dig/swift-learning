import Testing
@testable import SwiftLearning

@Suite("Day08: 構造体")
struct Day08Tests {

    // 課題1: distance
    @Test("Point間の距離")
    func testDistance() {
        let origin = Point(x: 0, y: 0)
        #expect(distance(from: origin, to: Point(x: 3, y: 4)) == 5.0)
        #expect(distance(from: origin, to: Point(x: 0, y: 0)) == 0.0)
        #expect(distance(from: Point(x: 1, y: 1), to: Point(x: 4, y: 5)) == 5.0)
        // 負の座標
        #expect(distance(from: Point(x: -3, y: 0), to: Point(x: 0, y: 4)) == 5.0)
    }

    // 課題2: Rectangle
    @Test("Rectangleの面積")
    func testRectangleArea() {
        #expect(Rectangle(width: 3, height: 4).area() == 12.0)
        #expect(Rectangle(width: 5, height: 5).area() == 25.0)
        #expect(Rectangle(width: 0, height: 10).area() == 0.0)
    }

    @Test("Rectangleの周囲長")
    func testRectanglePerimeter() {
        #expect(Rectangle(width: 3, height: 4).perimeter() == 14.0)
        #expect(Rectangle(width: 5, height: 5).perimeter() == 20.0)
        #expect(Rectangle(width: 0, height: 10).perimeter() == 20.0)
    }

    // 課題3: Stack
    @Test("Stackの基本操作")
    func testStack() {
        var s = IntStack()
        #expect(s.isEmpty == true)

        s.push(1)
        s.push(2)
        s.push(3)
        #expect(s.isEmpty == false)

        #expect(s.pop() == 3)
        #expect(s.pop() == 2)
        #expect(s.pop() == 1)
        #expect(s.pop() == nil)   // 空なら nil
        #expect(s.isEmpty == true)
    }
}
