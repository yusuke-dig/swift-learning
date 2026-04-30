import Testing
@testable import SwiftLearning

@Suite("Day11: エラー処理")
struct Day11Tests {

    // ── 課題1: parseTemperature ─────────────────────────────
    @Test("parseTemperature: 有効な値はそのまま返る")
    func testParseTemperatureValid() throws {
        #expect(try parseTemperature(0.0) == 0.0)
        #expect(try parseTemperature(-273.15) == -273.15)
        #expect(try parseTemperature(1000.0) == 1000.0)
    }

    @Test("parseTemperature: -273.15 未満は tooCold")
    func testParseTemperatureTooCold() {
        #expect(throws: TemperatureError.tooCold) {
            try parseTemperature(-273.16)
        }
    }

    @Test("parseTemperature: 1000 超は tooHot")
    func testParseTemperatureTooHot() {
        #expect(throws: TemperatureError.tooHot) {
            try parseTemperature(1000.01)
        }
    }

    // ── 課題2: safeSqrt ─────────────────────────────────────
    @Test("safeSqrt: 正の値は平方根を返す")
    func testSafeSqrtPositive() throws {
        #expect(try safeSqrt(9.0) == 3.0)
        #expect(try safeSqrt(0.0) == 0.0)
    }

    @Test("safeSqrt: 負の値は negativeInput")
    func testSafeSqrtNegative() {
        #expect(throws: MathError.negativeInput) {
            try safeSqrt(-1.0)
        }
    }

    // ── 課題3: describeTemperature ──────────────────────────
    @Test("describeTemperature: 有効な温度")
    func testDescribeTemperatureValid() {
        #expect(describeTemperature(25.0) == "25.0℃ は有効です")
    }

    @Test("describeTemperature: 低すぎる")
    func testDescribeTemperatureTooCold() {
        #expect(describeTemperature(-300.0) == "低すぎます")
    }

    @Test("describeTemperature: 高すぎる")
    func testDescribeTemperatureTooHot() {
        #expect(describeTemperature(9999.0) == "高すぎます")
    }
}
