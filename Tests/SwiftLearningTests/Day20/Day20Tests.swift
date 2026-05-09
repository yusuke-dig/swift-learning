import Testing
@testable import SwiftLearning

@Suite("Day20: @propertyWrapper")
struct Day20Tests {

    // MARK: - 課題1: @Clamped

    @Test("Clamped: 範囲内の値はそのまま")
    func clampedInRange() {
        struct S { @Clamped(min: 0, max: 100) var score: Int = 50 }
        var s = S()
        s.score = 75
        #expect(s.score == 75)
    }

    @Test("Clamped: 最大値を超えた場合は max に丸まる")
    func clampedOverMax() {
        struct S { @Clamped(min: 0, max: 100) var score: Int = 50 }
        var s = S()
        s.score = 150
        #expect(s.score == 100)
    }

    @Test("Clamped: 最小値を下回った場合は min に丸まる")
    func clampedUnderMin() {
        struct S { @Clamped(min: 0, max: 100) var score: Int = 50 }
        var s = S()
        s.score = -10
        #expect(s.score == 0)
    }

    @Test("Clamped: 初期値も範囲内に丸まる")
    func clampedInitialValue() {
        struct S { @Clamped(min: 1, max: 5) var level: Int = 10 }
        let s = S()
        #expect(s.level == 5)
    }

    // MARK: - 課題2: @Trimmed

    @Test("Trimmed: 前後のスペースが除去される")
    func trimmedSpaces() {
        struct S { @Trimmed var name: String = "" }
        var s = S()
        s.name = "  Swift  "
        #expect(s.name == "Swift")
    }

    @Test("Trimmed: 改行もトリムされる")
    func trimmedNewlines() {
        struct S { @Trimmed var text: String = "" }
        var s = S()
        s.text = "\n  Hello\n"
        #expect(s.text == "Hello")
    }

    @Test("Trimmed: 初期値もトリムされる")
    func trimmedInitialValue() {
        struct S { @Trimmed var tag: String = "  swift  " }
        let s = S()
        #expect(s.tag == "swift")
    }

    @Test("Trimmed: トリム不要な文字列はそのまま")
    func trimmedClean() {
        struct S { @Trimmed var word: String = "" }
        var s = S()
        s.word = "clean"
        #expect(s.word == "clean")
    }

    // MARK: - 課題3: @ClampedWithProjection

    @Test("ClampedWithProjection: 範囲内なら projectedValue は false")
    func projectedValueFalse() {
        struct S { @ClampedWithProjection(min: 0, max: 10) var v: Int = 5 }
        var s = S()
        s.v = 7
        #expect(s.$v == false)
    }

    @Test("ClampedWithProjection: 範囲外なら projectedValue は true")
    func projectedValueTrue() {
        struct S { @ClampedWithProjection(min: 0, max: 10) var v: Int = 5 }
        var s = S()
        s.v = 20
        #expect(s.$v == true)
        #expect(s.v == 10)
    }

    @Test("ClampedWithProjection: 初期値が範囲外なら projectedValue は true")
    func projectedValueInitClamped() {
        struct S { @ClampedWithProjection(min: 0, max: 5) var v: Int = 99 }
        let s = S()
        #expect(s.$v == true)
        #expect(s.v == 5)
    }
}
