// Day02: 基本型と型推論 (Int / String / Bool / Double)
//
// Swift には主に4つの基本型があります。
//   Int    → 整数  例: let age: Int = 20
//   Double → 小数  例: let pi: Double = 3.14
//   String → 文字列 例: let name = "Alice"  // 型推論で String
//   Bool   → 真偽値 例: let flag = true      // 型推論で Bool
//
// 型変換は自動では行われません。明示的に変換が必要です。
//   Double(age)   // Int → Double
//   String(42)    // Int → String
//
// 課題: 以下の3つの関数を実装してください。

// 課題1 (易): 摂氏を華氏に変換する
// 公式: F = C × 1.8 + 32
func celsiusToFahrenheit(_ celsius: Double) -> Double {
    // ここに実装してください
    return celsius * 1.8 + 32
}

// 課題2 (中): 文字列が「長い単語」かどうか判定する
// 6文字以上なら true を返す
func isLongWord(_ word: String) -> Bool {
    // ここに実装してください
    return word.count >= 6
}

// 課題3 (中): 整数の絶対値を返す
// 標準ライブラリの abs() は使わず、自分で実装する
func absolute(_ n: Int) -> Int {
    // ここに実装してください
    return n >= 0 ? n : -n
}
