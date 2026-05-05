// Day16: Equatable / Comparable / Hashable
//
// ## Equatable
// 「等しいかどうか」を比較できるようにするプロトコル。
// `==` 演算子が使えるようになる。
//
//     struct Point: Equatable {
//         var x: Int
//         var y: Int
//     }
//     Point(x:1, y:2) == Point(x:1, y:2) // true
//
// structの場合、全プロパティがEquatableなら自動で合成される。
//
// ## Comparable
// 「大小」を比較できるようにするプロトコル。Equatableを継承。
// `<` を実装すれば `<=`, `>`, `>=` も使える。
// `.sorted()` や `min()` / `max()` も動くようになる。
//
//     struct Point: Comparable {
//         static func < (lhs: Point, rhs: Point) -> Bool { lhs.x < rhs.x }
//     }
//
// ## Hashable
// Dictionaryのキーやのの要素にするためのプロトコル。Equatableを継承。
// structの場合、全プロパティがHashableなら自動で合成される。
// 手動実装は `hash(into:)` を使う。
//
//     struct Point: Hashable {}
//     let set: Set<Point> = [Point(x:1, y:2)]

import Foundation

// ----------------------------------------
// 課題で使う型（変更不要）
// ----------------------------------------

struct Point16: Equatable, Comparable, Hashable {
    let x: Int
    let y: Int

    // Comparable: x が同じ場合は y で比較する
    static func < (lhs: Point16, rhs: Point16) -> Bool {
        if lhs.x != rhs.x { return lhs.x < rhs.x }
        return lhs.y < rhs.y
    }
}

// ----------------------------------------
// 課題1: isEqual(_:_:)
// 2つの値が等しいか返す。T は Equatable に準拠している。
// 例: isEqual(1, 1) → true
//     isEqual("a", "b") → false
// ----------------------------------------

func isEqual<T: Equatable>(_ a: T, _ b: T) -> Bool {
    // ここに実装してください
    a == b
}

// ----------------------------------------
// 課題2: comparePoints(_:_:)
// 2つの Point16 を比較し、以下の文字列を返す。
//   lhs < rhs  → "less"
//   lhs == rhs → "equal"
//   lhs > rhs  → "greater"
// ----------------------------------------

func comparePoints(_ lhs: Point16, _ rhs: Point16) -> String {
    // ここに実装してください
    if lhs < rhs { return "less" }
    if lhs == rhs { return "equal" }
    if lhs > rhs { return "greater" }
    return "unkwnon"
}

// ----------------------------------------
// 課題3: uniqueElements(_:)
// 配列から重複を除いた要素を返す（順序不問）。
// T は Hashable に準拠している。
// 例: uniqueElements([1, 2, 1, 3]) → [1, 2, 3] (順序不問)
// ----------------------------------------

func uniqueElements<T: Hashable>(_ array: [T]) -> [T] {
    // ここに実装してください
    return Array(Set(array))
}
