// Day14: ジェネリクス
//
// ジェネリクスとは「型をパラメータ化する」仕組み。
// 同じロジックを Int でも String でも使いまわせる。
//
// 基本構文:
//   func identity<T>(_ value: T) -> T { return value }
//
// 型制約: T が Comparable に準拠していることを要求する
//   func maxOf<T: Comparable>(_ a: T, _ b: T) -> T { ... }
//
// ジェネリック型:
//   struct Box<T> { var value: T }

// ─────────────────────────────────────────
// 課題1: ジェネリックなスタック Stack<T>
// ─────────────────────────────────────────
// push / pop / peek / isEmpty を持つスタックを実装する。
// pop と peek は要素がない場合 nil を返す。

struct Stack<T> {
    private var items: [T] = []

    mutating func push(_ item: T) {
        // ここに実装してください
        self.items.append(item)
    }

    // 末尾要素を取り出して削除する
    mutating func pop() -> T? {
        // ここに実装してください
        self.items.popLast()
    }

    // 末尾要素を削除せず返す
    func peek() -> T? {
        // ここに実装してください
        self.items.last
    }

    var isEmpty: Bool {
        // ここに実装してください
        self.items.isEmpty
    }
}

// ─────────────────────────────────────────
// 課題2: findFirst<T: Equatable>
// ─────────────────────────────────────────
// 配列から条件に一致する最初の要素を返す。
// 見つからなければ nil を返す。
//
// 使用例:
//   findFirst(in: [1, 2, 3], where: { $0 > 1 })  // Optional(2)
//   findFirst(in: ["a", "b"], where: { $0 == "b" }) // Optional("b")

func findFirst<T>(in array: [T], where predicate: (T) -> Bool) -> T? {
    // ここに実装してください
    array.first(where: predicate)
}

// ─────────────────────────────────────────
// 課題3: swapValues<T>
// ─────────────────────────────────────────
// inout を使って2つの値を入れ替える。
// 標準ライブラリの swap(_:_:) と同等のもの。
//
// 使用例:
//   var a = 1, b = 2
//   swapValues(&a, &b)  // a == 2, b == 1

func swapValues<T>(_ a: inout T, _ b: inout T) {
    // ここに実装してください
    let evacuation = a
    a = b
    b = evacuation
}
