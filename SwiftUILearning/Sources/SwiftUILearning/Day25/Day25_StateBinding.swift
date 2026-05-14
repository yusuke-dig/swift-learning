// Day25: SwiftUI @State / @Binding
// テーマ: カウンターとフォームで状態管理を練習する

import SwiftUI

// ─────────────────────────────────────────
// 解説
// ─────────────────────────────────────────
// @State: ビュー内部の状態を保持するプロパティラッパー
//   @State var count: Int = 0
//   count を変更すると body が自動で再描画される
//
// @Binding: 親の @State を子ビューへ渡す参照
//   親: @State var value = 0
//       ChildView(value: $value)   // $ を付けると Binding になる
//   子: @Binding var value: Int
//       value += 1  // 親の @State が変わる
//
// よく使うパターン:
//   Button("ラベル") { count += 1 }   // アクション
//   Toggle("ラベル", isOn: $isEnabled) // Binding を渡す
// ─────────────────────────────────────────

// 課題1: カウンター
// - @State var count: Int = 0 を持つ（テストで初期値を検証）
// - 「-」ボタン（count を 1 減らす）
// - count を Text で表示
// - 「+」ボタン（count を 1 増やす）
// - 3つを HStack で横並びにする
struct CounterView: View {
    @State var count: Int = 0
    
    var body: some View {
        // ここに実装してください
        HStack {
            Button(action: { count -= 1 }, label: { Text("-") })
            Text("\(count)")
            Button(action: { count += 1 }, label: { Text("+") })
        }
    }
}

// 課題2: トグルフォーム
// - @State var isEnabled: Bool = false を持つ（テストで初期値を検証）
// - Toggle("通知を受け取る", isOn: $isEnabled) を表示する
// - Toggle の下に isEnabled ? "ON" : "OFF" を Text で表示する
// - VStack で縦並び・padding() を付ける
struct ToggleFormView: View {
    @State var isEnabled: Bool = false
    
    var body: some View {
        // ここに実装してください
        VStack {
            Toggle("通知を受け取る", isOn: $isEnabled)
            Text(isEnabled ? "ON" : "OFF")
        }
        .padding()
    }
}

// 課題3: @Binding を受け取る子ビュー
// - @Binding var value: Int を持つ（テストで Binding.constant を使って検証）
// - 「タップで +1」ボタン（タップで value += 1 する）
// - ボタンの下に「現在値: {value}」を Text で表示する
// - VStack で縦並び・spacing: 12
struct StepperChildView: View {
    @Binding var value: Int
    
    var body: some View {
        // ここに実装してください
        VStack(spacing: 12) {
            Button("タップで +1") { value += 1 }
            Text("現在値: \(value)")
        }
    }
}

// ─────────────────────────────────────────
// Preview（Xcode で開いて確認してください）
// ─────────────────────────────────────────
#Preview("課題1") {
    CounterView()
        .padding()
}

#Preview("課題2") {
    ToggleFormView()
        .padding()
}

#Preview("課題3") {
    @Previewable @State var val = 0
    StepperChildView(value: $val)
        .padding()
}
