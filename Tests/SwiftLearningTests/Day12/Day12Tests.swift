import Testing
@testable import SwiftLearning

@Suite("Day12: 列挙型")
struct Day12Tests {

    // ── 課題1: Direction ────────────────────────────────────
    @Test("Direction: north の反対は south")
    func testDirectionNorth() {
        #expect(Direction.north.opposite == .south)
    }

    @Test("Direction: south の反対は north")
    func testDirectionSouth() {
        #expect(Direction.south.opposite == .north)
    }

    @Test("Direction: east の反対は west")
    func testDirectionEast() {
        #expect(Direction.east.opposite == .west)
    }

    @Test("Direction: west の反対は east")
    func testDirectionWest() {
        #expect(Direction.west.opposite == .east)
    }

    // ── 課題2: Coin ─────────────────────────────────────────
    @Test("Coin: 各硬貨の value")
    func testCoinValues() {
        #expect(Coin.one.value == 1)
        #expect(Coin.five.value == 5)
        #expect(Coin.ten.value == 10)
        #expect(Coin.fifty.value == 50)
        #expect(Coin.hundred.value == 100)
        #expect(Coin.fiveHundred.value == 500)
    }

    // ── 課題3: area ─────────────────────────────────────────
    @Test("area: circle")
    func testAreaCircle() {
        let result = area(of: .circle(radius: 3.0))
        #expect(abs(result - Double.pi * 9.0) < 1e-9)
    }

    @Test("area: rectangle")
    func testAreaRectangle() {
        #expect(area(of: .rectangle(width: 4.0, height: 5.0)) == 20.0)
    }

    @Test("area: triangle")
    func testAreaTriangle() {
        #expect(area(of: .triangle(base: 6.0, height: 4.0)) == 12.0)
    }
}
