// Day06: 関数 (引数ラベル / デフォルト値 / inout)
//
// ■ 引数ラベル: 呼び出し側に見せる名前と内部名を分けられる
//
//   func greet(to name: String) { print("Hello, \(name)") }
//   greet(to: "Alice")   // ← 呼び出し側は "to:"
//
//   アンダースコアでラベルを省略することも可能:
//   func double(_ n: Int) -> Int { n * 2 }
//   double(5)
//
// ■ デフォルト値: 引数を省略できる
//
//   func connect(host: String, port: Int = 8080) { ... }
//   connect(host: "localhost")        // port は 8080 になる
//   connect(host: "example.com", port: 443)
//
// ■ inout: 引数の値を関数内で書き換える
//
//   func double(_ n: inout Int) { n *= 2 }
//   var x = 3
//   double(&x)   // x は 6 になる

// ────────────────────────────────────────────
// 課題1: repeatString(text:count:)
// text を count 回繰り返した文字列を返す。
// デフォルト値: count のデフォルトは 2。
// 例: repeatString(text: "Hi", count: 3) → "HiHiHi"
//     repeatString(text: "Go")           → "GoGo"
func repeatString(text: String, count: Int = 2) -> String {
    // ここに実装してください
    var result: String = ""
    for _ in 0..<count {
        result += text
    }
    return result
}

// 課題2: swapInts(_:_:)
// inout を使って2つの Int を入れ替える。戻り値なし。
// 例:
//   var a = 1, b = 2
//   swapInts(&a, &b)   → a == 2, b == 1
func swapInts(_ a: inout Int, _ b: inout Int) {
    // ここに実装してください
    let tmp = a
    a = b
    b = tmp
}

// 課題3: clamp(_:lower:upper:)
// value を [lower, upper] の範囲に収めた値を返す。
// 例: clamp(10, lower: 0, upper: 5)  → 5
//     clamp(-3, lower: 0, upper: 5)  → 0
//     clamp(3,  lower: 0, upper: 5)  → 3
func clamp(_ value: Int, lower: Int, upper: Int) -> Int {
    // ここに実装してください
    guard value >= lower else { return lower }
    guard value <= upper else { return upper }
    return value
}
