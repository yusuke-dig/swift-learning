import Testing
@testable import SwiftLearning

@Suite("Day18: some / any（不透明型・存在型）")
struct Day18Tests {

    // MARK: 課題1: makeCircle
    @Test("makeCircle: 面積が π*r² になる")
    func testMakeCircle() {
        let c = makeCircle(radius: 3)
        #expect(abs(c.area() - Double.pi * 9) < 1e-9)

        let c2 = makeCircle(radius: 0)
        #expect(c2.area() == 0)

        let c3 = makeCircle(radius: 1)
        #expect(abs(c3.area() - Double.pi) < 1e-9)
    }

    // MARK: 課題2: sortedByArea
    @Test("sortedByArea: 面積降順に並ぶ")
    func testSortedByArea() {
        let shapes: [any D18Shape] = [
            D18Triangle(base: 2, height: 3),      // area=3
            D18Rectangle(width: 4, height: 5),    // area=20
            D18Circle(radius: 1),                 // area≈3.14
        ]
        let sorted = sortedByArea(shapes)

        #expect(sorted[0].area() > sorted[1].area())
        #expect(sorted[1].area() > sorted[2].area())
        #expect(abs(sorted[0].area() - 20) < 1e-9)
        #expect(abs(sorted[2].area() - 3) < 1e-9)
    }

    @Test("sortedByArea: 空配列は空を返す")
    func testSortedByAreaEmpty() {
        let result = sortedByArea([])
        #expect(result.isEmpty)
    }

    @Test("sortedByArea: 要素1つはそのまま返る")
    func testSortedByAreaSingle() {
        let shapes: [any D18Shape] = [D18Rectangle(width: 2, height: 3)]
        let result = sortedByArea(shapes)
        #expect(result.count == 1)
        #expect(result[0].area() == 6)
    }

    // MARK: 課題3: shapeNames
    @Test("shapeNames: 各 name() を配列で返す")
    func testShapeNames() {
        let shapes: [any D18Shape] = [
            D18Circle(radius: 1),
            D18Rectangle(width: 2, height: 3),
        ]
        let names = shapeNames(shapes)
        #expect(names.count == 2)
        #expect(names[0] == "Circle(r=1.0)")
        #expect(names[1] == "Rectangle(2.0x3.0)")
    }

    @Test("shapeNames: 空配列は空を返す")
    func testShapeNamesEmpty() {
        let names = shapeNames([])
        #expect(names.isEmpty)
    }
}
