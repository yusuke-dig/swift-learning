import Testing
@testable import SwiftLearning

@Suite("Day09: クラスと継承")
struct Day09Tests {

    // ── 課題1: Circle ───────────────────────────────────────
    @Test("Circle: area は π × r²")
    func testCircleArea() {
        let c = Circle(color: "red", radius: 3.0)
        #expect(abs(c.area() - Double.pi * 9.0) < 1e-9)
    }

    @Test("Circle: color が引き継がれる")
    func testCircleColor() {
        let c = Circle(color: "blue", radius: 1.0)
        #expect(c.color == "blue")
    }

    @Test("Circle: describe に color が含まれる")
    func testCircleDescribe() {
        let c = Circle(color: "green", radius: 2.0)
        let desc = c.describe()
        #expect(desc.contains("green"))
    }

    // ── 課題2: Rect ─────────────────────────────────────────
    @Test("Rect: area は width × height")
    func testRectArea() {
        let r = Rect(color: "white", width: 4.0, height: 5.0)
        #expect(r.area() == 20.0)
    }

    @Test("Rect: color が引き継がれる")
    func testRectColor() {
        let r = Rect(color: "black", width: 2.0, height: 3.0)
        #expect(r.color == "black")
    }

    @Test("Rect: width=0 なら area は 0")
    func testRectZeroWidth() {
        let r = Rect(color: "gray", width: 0.0, height: 10.0)
        #expect(r.area() == 0.0)
    }

    // ── 課題3: isLarger ─────────────────────────────────────
    @Test("isLarger: 大きい方を返す")
    func testIsLargerReturnsLarger() {
        let big = Circle(color: "red", radius: 5.0)
        let small = Rect(color: "blue", width: 1.0, height: 1.0)
        let result = isLarger(big, small)
        #expect(result === big)
    }

    @Test("isLarger: 面積が同じなら a を返す")
    func testIsLargerEqualReturnsA() {
        let a = Rect(color: "red", width: 2.0, height: 3.0)
        let b = Rect(color: "blue", width: 3.0, height: 2.0)
        let result = isLarger(a, b)
        #expect(result === a)
    }

    @Test("isLarger: b の方が大きければ b を返す")
    func testIsLargerReturnB() {
        let small = Circle(color: "red", radius: 1.0)
        let big = Rect(color: "blue", width: 10.0, height: 10.0)
        let result = isLarger(small, big)
        #expect(result === big)
    }
}
