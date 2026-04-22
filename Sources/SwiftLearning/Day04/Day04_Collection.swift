// Day04: コレクション (Array / Dictionary)
//
// ■ Array: 順序付きのリスト
//
//   var nums = [1, 2, 3]
//   nums.append(4)          // 末尾に追加
//   nums.count              // 要素数
//   for n in nums { ... }   // ループ
//
// ■ Dictionary: キーと値のペア
//
//   var scores = ["Alice": 90, "Bob": 80]
//   scores["Alice"]         // Optional(90) ← 存在しないキーは nil
//   scores["Carol"] = 70    // 追加
//   for (name, score) in scores { ... }

// ────────────────────────────────────────────
// 課題1: sum
// Int の配列を受け取り、全要素の合計を返す。
// 例: sum([1, 2, 3, 4]) → 10
//     sum([])            → 0
func sum(_ numbers: [Int]) -> Int {
    // ここに実装してください
}

// 課題2: countOccurrences
// 配列の中に target が何個あるかを返す。
// 例: countOccurrences([1, 2, 1, 3, 1], target: 1) → 3
//     countOccurrences([1, 2, 3], target: 9)        → 0
func countOccurrences(_ array: [Int], target: Int) -> Int {
    // ここに実装してください
}

// 課題3: mostFrequent
// 配列の中で最も多く出現する要素を返す。
// 最多が複数ある場合はどれを返しても良い。空配列のときは nil を返す。
// 例: mostFrequent([1, 2, 2, 3, 2]) → 2
//     mostFrequent([])               → nil
func mostFrequent(_ array: [Int]) -> Int? {
    // ここに実装してください
}
