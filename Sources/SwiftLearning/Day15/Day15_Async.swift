// Day15: 非同期処理
//
// async/await は「時間のかかる処理を待つ」構文。
// ネットワーク通信やファイルIO など、結果が後から返ってくる処理に使う。
//
// 基本構文:
//   func fetchData() async -> String { ... }
//   let result = await fetchData()   // ここで一時停止して待つ
//
// 並列実行 (async let):
//   async let a = fetchData()        // すぐに開始（待たない）
//   async let b = fetchData()        // すぐに開始（待たない）
//   let (x, y) = await (a, b)        // ここで両方を待つ

// ─────────────────────────────────────────
// 課題1: fetchGreeting(name:) async -> String
// ─────────────────────────────────────────
// 名前を受け取り "Hello, {name}!" を返す async 関数。
// await して呼び出せることを確認する。

func fetchGreeting(name: String) async -> String {
    // ここに実装してください
    "Hello, \(name)!"
}

// ─────────────────────────────────────────
// 課題2: fetchAll(names:) async -> [String]
// ─────────────────────────────────────────
// 名前のリストを受け取り、それぞれのあいさつを順番に取得して返す。
// ループ内で await を使う（逐次実行）。
//
// 使用例:
//   await fetchAll(names: ["Alice", "Bob"])
//   // ["Hello, Alice!", "Hello, Bob!"]

func fetchAll(names: [String]) async -> [String] {
    // ここに実装してください
    var result: [String] = []
    for name in names {
        result.append(await fetchGreeting(name: name))
    }
    return result
}

// ─────────────────────────────────────────
// 課題3: fetchPair(first:second:) async -> (String, String)
// ─────────────────────────────────────────
// 2つの名前のあいさつを async let で並列取得して返す。
// async let はすぐに処理を開始し、await で結果を受け取る。
//
// 使用例:
//   await fetchPair(first: "Alice", second: "Bob")
//   // ("Hello, Alice!", "Hello, Bob!")

func fetchPair(first: String, second: String) async -> (String, String) {
    // ここに実装してください
    let (greeting1, greeting2) = (await fetchGreeting(name: first), await fetchGreeting(name: second))
    return (greeting1, greeting2)
}
