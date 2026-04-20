// Day03: オプショナル (Optional / if let / guard let)
//
// Swift の Optional は「値があるかもしれないし、ないかもしれない」型。
// Int? は "Int または nil" を意味する。
//
// ■ アンラップの基本
//
//   // if let: 値があるときだけブロックに入る
//   if let value = someOptional {
//       print(value)  // value は非オプショナル
//   }
//
//   // guard let: 値がなければ早期リターン
//   func example(_ x: Int?) -> Int {
//       guard let x = x else { return 0 }
//       return x * 2  // ここでは x は非オプショナル
//   }
//
//   // ?? (nil合体演算子): nil のときデフォルト値を使う
//   let result = someOptional ?? 0

// ────────────────────────────────────────────
// 課題1: safeDivide
// a を b で割った結果を返す。b が 0 のときは nil を返す。
// 例: safeDivide(10, 2) → 5.0
//     safeDivide(10, 0) → nil
func safeDivide(_ a: Double, _ b: Double) -> Double? {
    // ここに実装してください
}

// 課題2: firstElement
// 配列の最初の要素を返す。空配列のときは nil を返す。
// 例: firstElement([3, 1, 4]) → 3
//     firstElement([])        → nil
func firstElement(_ array: [Int]) -> Int? {
    // ここに実装してください
}

// 課題3: parseAge
// 文字列を受け取り、0〜120 の範囲内の整数に変換して返す。
// 数値でない文字列や範囲外の値は nil を返す。
// 例: parseAge("25")  → 25
//     parseAge("abc") → nil
//     parseAge("150") → nil
func parseAge(_ s: String) -> Int? {
    // ここに実装してください
}
