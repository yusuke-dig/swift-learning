// Day07: クロージャ (Closure)
//
// ■ クロージャとは: 名前のない関数。変数に代入したり引数として渡せる。
//
//   let double = { (n: Int) -> Int in n * 2 }
//   double(5)   // → 10
//
// ■ 高階関数の引数として渡す
//
//   func apply(_ n: Int, _ f: (Int) -> Int) -> Int { f(n) }
//   apply(3, { n in n * n })   // → 9
//   apply(3) { n in n * n }    // trailing closure 構文
//
// ■ 省略形
//
//   [1, 2, 3].map({ x in x * 2 })   // 通常
//   [1, 2, 3].map { x in x * 2 }    // trailing closure
//   [1, 2, 3].map { $0 * 2 }        // $0 で最初の引数を参照

// ────────────────────────────────────────────
// 課題1: applyTwice(_:_:)
// 関数 f を値 x に2回適用した結果を返す。
// 例: applyTwice(3) { $0 * 2 }   → 12  (3→6→12)
//     applyTwice(1) { $0 + 10 }  → 21  (1→11→21)
func applyTwice(_ x: Int, _ f: (Int) -> Int) -> Int {
    // ここに実装してください
    let result = f(x)
    return f(result)
}

// 課題2: myFilter(_:_:)
// 配列 array の中で条件 predicate を満たす要素だけを返す。
// 標準ライブラリの filter は使わずに for-in で実装すること。
// 例: myFilter([1, 2, 3, 4, 5]) { $0 % 2 == 0 }  → [2, 4]
//     myFilter([10, 3, 7, 1])   { $0 > 5 }        → [10, 7]
func myFilter(_ array: [Int], _ predicate: (Int) -> Bool) -> [Int] {
    // ここに実装してください
    var result: [Int] = []
    for num in array {
        guard predicate(num) != false else { continue }
        result.append(num)
    }
    return result
}

// 課題3: myMap(_:_:)
// 配列 array の各要素に変換 transform を適用した新しい配列を返す。
// 標準ライブラリの map は使わずに for-in で実装すること。
// 例: myMap([1, 2, 3]) { $0 * $0 }     → [1, 4, 9]
//     myMap([1, 2, 3]) { $0 + 10 }     → [11, 12, 13]
func myMap(_ array: [Int], _ transform: (Int) -> Int) -> [Int] {
    // ここに実装してください
    var result: [Int] = []
    for num in array {
        result.append(transform(num))
    }
    return result
}
