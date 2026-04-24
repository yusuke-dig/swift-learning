// Day05: 制御構文 (if / switch / for-in)
//
// ■ switch: 値によって処理を分岐する
//
//   switch score {
//   case 90...100: print("A")
//   case 70..<90:  print("B")
//   default:       print("C")
//   }
//
//   Swift の switch は break 不要・全ケース網羅が必須。
//   範囲 (1...5) や複数値 (1, 3, 5) もマッチできる。
//
// ■ for-in: コレクションや範囲を繰り返す
//
//   for i in 1...5 { print(i) }
//   for i in 1...5 where i % 2 == 0 { print(i) }  // where で絞り込み

// ────────────────────────────────────────────
// 課題1: grade
// 点数 (0〜100) を受け取り、成績を返す。
//   90〜100 → "A", 70〜89 → "B", 50〜69 → "C", 0〜49 → "D"
// 例: grade(95) → "A"
//     grade(72) → "B"
func grade(_ score: Int) -> String {
    // ここに実装してください
}

// 課題2: fizzBuzz
// 1 から n までの FizzBuzz 結果を配列で返す。
//   3の倍数 → "Fizz", 5の倍数 → "Buzz", 両方 → "FizzBuzz", それ以外 → 数字の文字列
// 例: fizzBuzz(5) → ["1", "2", "Fizz", "4", "Buzz"]
func fizzBuzz(_ n: Int) -> [String] {
    // ここに実装してください
}

// 課題3: factorial
// n の階乗を返す。n は 0 以上とする。
// 例: factorial(5) → 120  (5! = 5×4×3×2×1)
//     factorial(0) → 1
func factorial(_ n: Int) -> Int {
    // ここに実装してください
}
