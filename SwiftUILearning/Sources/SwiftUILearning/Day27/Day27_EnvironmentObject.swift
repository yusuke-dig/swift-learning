// Day27: SwiftUI @Environment / @EnvironmentObject
// テーマ: テーマ切替アプリを作りながら環境値の仕組みを練習する

import SwiftUI

// ─────────────────────────────────────────
// 解説
// ─────────────────────────────────────────
// @EnvironmentObject: ビューツリー全体で共有するオブジェクト
//   - 親で .environmentObject(obj) を注入すると
//     子孫どこでも @EnvironmentObject var obj: MyModel で受け取れる
//   - @State / @Binding と違い、Binding を手渡しせずに済む
//
// @Environment: システム提供の環境値を読み取る
//   @Environment(\.colorScheme) var colorScheme  // ライト/ダーク
//   @Environment(\.dismiss) var dismiss          // シートを閉じる
//   独自キーを定義して inject することもできる
//
// よく使うパターン:
//   class ThemeModel: ObservableObject {
//       @Published var isDark: Bool = false
//   }
//   // 親: .environmentObject(ThemeModel())
//   // 子: @EnvironmentObject var theme: ThemeModel
// ─────────────────────────────────────────

// モデル（変更不要）
class ThemeModel: ObservableObject {
    @Published var isDark: Bool = false
    var background: Color { isDark ? Color.black : Color.white }
    var foreground: Color { isDark ? Color.white : Color.black }
}

// 課題1: ThemeToggleButton（易）
// - @EnvironmentObject var theme: ThemeModel を受け取る
// - Button("ダークモード ON" / "ライトモード ON") で theme.isDark をトグルする
//   ※ isDark が true のとき "ライトモード ON"、false のとき "ダークモード ON"
// - .buttonStyle(.borderedProminent) を付ける
struct ThemeToggleButton: View {
    @EnvironmentObject var theme: ThemeModel

    var body: some View {
        // ここに実装してください
        Button(theme.isDark ? "ライトモード ON" : "ダークモード ON") {
            theme.isDark.toggle()
        }
    }
}

// 課題2: ThemedCard（中）
// - @EnvironmentObject var theme: ThemeModel を受け取る
// - let title: String / let description: String を受け取る
// - VStack(alignment: .leading, spacing: 8) に以下を並べる
//     Text(title)        ← .font(.headline)、.foregroundColor(theme.foreground)
//     Text(description)  ← .font(.body)、.foregroundColor(theme.foreground)
// - .padding() を付け、background(theme.background) → .cornerRadius(12) → .shadow(radius: 4)
struct ThemedCard: View {
    @EnvironmentObject var theme: ThemeModel
    let title: String
    let description: String

    var body: some View {
        // ここに実装してください
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(theme.foreground)
            Text(description)
                .font(.body)
                .foregroundColor(theme.foreground)
        }
        .padding()
        .background(theme.background)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}

// 課題3: ThemeRootView（中）
// - @StateObject var theme = ThemeModel() を持つ
// - VStack(spacing: 24) に以下を並べる
//     ThemeToggleButton()
//     ThemedCard(title: "SwiftUI", description: "宣言的UIフレームワーク")
//     ThemedCard(title: "環境オブジェクト", description: "ビューツリー全体で状態共有")
// - .padding()、background(theme.background)、.ignoresSafeArea() を付ける
// - .environmentObject(theme) で子ビューへ注入する
struct ThemeRootView: View {
    @StateObject var theme = ThemeModel()

    var body: some View {
        // ここに実装してください
        VStack(spacing: 24) {
            ThemeToggleButton()
            ThemedCard(title: "SwiftUI", description: "宣言的UIフレームワーク")
            ThemedCard(title: "環境オブジェクト", description: "ビューツリー全体で状態共有")
        }
        .padding()
        .background(theme.background)
        .ignoresSafeArea()
        .environmentObject(theme)
    }
}

// ─────────────────────────────────────────
// Preview（Xcode で開いて確認してください）
// ─────────────────────────────────────────
#Preview("テーマ切替") {
    ThemeRootView()
}

#Preview("カード単体（ライト）") {
    ThemedCard(title: "サンプル", description: "説明テキスト")
        .environmentObject(ThemeModel())
        .padding()
}
