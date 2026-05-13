// Day24: SwiftUI View / Text / VStack / HStack
// テーマ: プロフィールカード画面を組み立てる

import SwiftUI

// ─────────────────────────────────────────
// 解説
// ─────────────────────────────────────────
// SwiftUI の View はプロトコル。
// body プロパティに「返したいビュー」を書くだけでよい。
//
//   struct HelloView: View {
//       var body: some View {
//           Text("Hello!")
//               .font(.title)      // フォントを変える
//               .foregroundStyle(.blue)  // 文字色を変える
//       }
//   }
//
// VStack(alignment:spacing:) ... 子ビューを縦に並べる
// HStack(alignment:spacing:) ... 子ビューを横に並べる
//
// よく使うモディファイア:
//   .padding()            余白を追加
//   .background(Color.X)  背景色
//   .cornerRadius(12)     角丸
//   .shadow(radius: 4)    影
//   .frame(width:height:) サイズ指定
//   .clipShape(Circle())  円形に切り抜く
// ─────────────────────────────────────────

// 課題1: Text を使って名前を表示するビュー
// - name を受け取り「こんにちは、{name}さん！」を .title フォントで表示する
struct GreetingView: View {
    let name: String

    var body: some View {
        // ここに実装してください
    }
}

// 課題2: VStack でプロフィール情報を縦に並べる
// - name を .headline フォントで表示する
// - role を .subheadline フォント・.secondary 色で表示する
// - VStack の alignment は .leading、spacing は 4
struct ProfileInfoView: View {
    let name: String
    let role: String

    var body: some View {
        // ここに実装してください
    }
}

// 課題3: HStack と VStack を組み合わせたプロフィールカード
// - 左側: initial（頭文字）を .largeTitle フォントで表示し、
//         60×60 の円形・青い背景（Color.blue.opacity(0.2)）を付ける
// - 右側: ProfileInfoView(name:role:) を使う
// - HStack の spacing は 12
// - カード全体に .padding()・白背景・cornerRadius(12)・shadow(radius: 4) を付ける
struct ProfileCardView: View {
    let name: String
    let role: String
    let initial: String

    var body: some View {
        // ここに実装してください
    }
}

// ─────────────────────────────────────────
// Preview（Xcode で開いて確認してください）
// ─────────────────────────────────────────
#Preview("課題1") {
    GreetingView(name: "Swift")
        .padding()
}

#Preview("課題2") {
    ProfileInfoView(name: "山田 太郎", role: "iOSエンジニア")
        .padding()
}

#Preview("課題3") {
    ProfileCardView(name: "山田 太郎", role: "iOSエンジニア", initial: "山")
        .padding()
        .background(Color.gray.opacity(0.1))
}
