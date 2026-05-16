// Day27: SwiftUI Button / TextField / Form
// テーマ: 設定画面を作りながらユーザー入力の基本を練習する

import SwiftUI

// ─────────────────────────────────────────
// 解説
// ─────────────────────────────────────────
// Button: タップ可能なビュー
//   Button("送信") { /* アクション */ }
//   Button(action: { count += 1 }) { Text("＋") }
//   .buttonStyle(.borderedProminent)  で見た目を変えられる
//
// TextField: 1行テキスト入力
//   @State var name: String = ""
//   TextField("名前を入力", text: $name)
//   .textFieldStyle(.roundedBorder)   でボーダーが付く
//
// Form / Section: 設定画面向けグループレイアウト
//   Form {
//       Section("基本設定") {
//           TextField(...)
//           Toggle("通知", isOn: $notifOn)
//       }
//       Section("外観") {
//           Picker("サイズ", selection: $size) { ... }
//       }
//   }
//   ※ Form は List のスタイル版で、iOS の設定アプリ風になる
// ─────────────────────────────────────────

// 課題1: CounterButton（易）
// - @State var count: Int = 0 を持つ
// - VStack(spacing: 20) に以下を並べる
//     Text("カウント: \(count)")  ← .font(.largeTitle) を付ける
//     Button("＋1") { count += 1 }  ← .buttonStyle(.borderedProminent) を付ける
struct CounterButton: View {
    @State var count: Int = 0

    var body: some View {
        // ここに実装してください
    }
}

// 課題2: GreetingInput（中）
// - @State var name: String = "" を持つ
// - VStack(spacing: 16) に以下を並べる
//     TextField("名前を入力", text: $name)  ← .textFieldStyle(.roundedBorder)
//     Button("あいさつ") { greeting = name.isEmpty ? "名前を入力してください" : "こんにちは、\(name)！" }
//       ← .buttonStyle(.borderedProminent)
//     Text(greeting)  ← @State var greeting: String = ""
// - .padding() を付ける
struct GreetingInput: View {
    @State var name: String = ""
    @State var greeting: String = ""

    var body: some View {
        // ここに実装してください
    }
}

// 課題3: SettingsForm（中）
// 以下の @State を持つ
//   var username: String = ""
//   var notificationsEnabled: Bool = true
//   var fontSize: Int = 16    ← 12 / 16 / 20 の3択
// Form に Section を2つ作る
//   Section("プロフィール"):
//     TextField("ユーザー名", text: $username)
//   Section("通知と外観"):
//     Toggle("通知を受け取る", isOn: $notificationsEnabled)
//     Picker("フォントサイズ", selection: $fontSize) {
//         Text("小 (12)").tag(12)
//         Text("中 (16)").tag(16)
//         Text("大 (20)").tag(20)
//     }
// .navigationTitle("設定") を付ける
struct SettingsForm: View {
    @State var username: String = ""
    @State var notificationsEnabled: Bool = true
    @State var fontSize: Int = 16

    var body: some View {
        // ここに実装してください
    }
}

// ─────────────────────────────────────────
// Preview（Xcode で開いて確認してください）
// ─────────────────────────────────────────
#Preview("課題1: カウンター") {
    CounterButton()
}

#Preview("課題2: あいさつ入力") {
    GreetingInput()
}

#Preview("課題3: 設定画面") {
    NavigationStack {
        SettingsForm()
    }
}
