import Testing
import SwiftUI
@testable import SwiftUILearning

// @State/@Binding のビューは直接 UI をテストできないため、
// 「プロパティの初期値」と「Binding の参照」を検証する。
// 動作確認は Xcode の #Preview を使うこと。

@MainActor
@Suite("Day25: SwiftUI @State / @Binding")
struct Day25Tests {

    @Test("課題1: CounterView の初期値は 0")
    func counterViewInitialValue() {
        let view = CounterView()
        #expect(view.count == 0)
    }

    @Test("課題2: ToggleFormView の初期値は false")
    func toggleFormViewInitialValue() {
        let view = ToggleFormView()
        #expect(view.isEnabled == false)
    }

    @Test("課題3: StepperChildView が Binding の値を受け取る")
    func stepperChildViewBinding() {
        let view = StepperChildView(value: .constant(5))
        #expect(view.value == 5)
    }
}
