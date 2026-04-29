// Day10: プロトコル (protocol)
//
// プロトコルは「何ができるか」だけを定義する設計図。
// 実装は採択した側（struct/class/enum）が行う。
//
// 基本構文:
//   protocol Greetable {
//       var name: String { get }
//       func greet() -> String
//   }
//   struct Person: Greetable {
//       var name: String
//       func greet() -> String { "Hi, I'm \(name)" }
//   }
//
// ポイント:
//   - 継承と違い struct/enum でも採択できる
//   - 1つの型が複数のプロトコルを採択できる
//   - プロトコル型として変数に入れると、採択した型なら何でも受け取れる

// ── 課題1: Describable ───────────────────────────────────────
// 以下のプロトコルを採択した Book 構造体を完成させてください。
//
// protocol Describable {
//     func describe() -> String
// }
//
// Book の要件:
// - プロパティ: title: String, author: String
// - describe() は "『title』by author" の形式で返す
//   例: 『Swift入門』by 山田太郎

protocol Describable {
    func describe() -> String
}

struct Book: Describable {
    var title: String
    var author: String

    func describe() -> String {
        // ここに実装してください
    }
}

// ── 課題2: Resettable ────────────────────────────────────────
// 以下のプロトコルを採択した Counter 構造体を完成させてください。
//
// protocol Resettable {
//     mutating func reset()
// }
//
// Counter の要件:
// - プロパティ: count: Int（初期値 0）
// - mutating func increment() で count を +1 する
// - reset() で count を 0 に戻す

protocol Resettable {
    mutating func reset()
}

struct Counter: Resettable {
    var count: Int = 0

    mutating func increment() {
        // ここに実装してください
    }

    mutating func reset() {
        // ここに実装してください
    }
}

// ── 課題3: describeAll ───────────────────────────────────────
// Describable を採択した値の配列を受け取り、
// describe() の結果を改行で連結した文字列を返す関数を実装してください。
//
// 例: [book1, book2] → "『A』by X\n『B』by Y"

func describeAll(_ items: [Describable]) -> String {
    // ここに実装してください
}
