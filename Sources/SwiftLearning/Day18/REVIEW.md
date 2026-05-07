# Day18 Review: some / any（不透明型・存在型）

## 課題1: makeCircle

**実装**
```swift
func makeCircle(radius: Double) -> some D18Shape {
    D18Circle(radius: radius)
}
```

**評価**
`some D18Shape` を正しく使えています。`D18Circle` を直接返すことで、コンパイラが具体型を把握しつつ呼び出し側には `D18Shape` の契約だけを公開できています。これ以上シンプルにはできない理想的な実装です。

---

## 課題2: sortedByArea

**実装**
```swift
func sortedByArea(_ shapes: [any D18Shape]) -> [any D18Shape] {
    shapes.sorted { $0.area() > $1.area() }
}
```

**評価**
`sorted(by:)` にクロージャを渡す形で面積降順ソートを一行で表現できています。`[any D18Shape]` を受けて `[any D18Shape]` を返す型シグネチャも正確です。

**補足**
`sorted` は新しい配列を返す（元を変えない）非破壊版、`sort` はインプレース版です。`[any D18Shape]` は `let` で受けても使えるため `sorted` が正解です。

---

## 課題3: shapeNames

**実装**
```swift
func shapeNames(_ shapes: [any D18Shape]) -> [String] {
    shapes.map { $0.name() }
}
```

**評価**
`map` を使って `name()` を写像する最もシンプルな実装です。`$0.name()` は `any D18Shape` のプロトコルメソッドを呼んでおり、Swift の存在型を正しく使えています。

---

## 今日の議論で理解したこと

- `some` は「コンパイラだけが知る具体型」→ ボックス化なし・インライン展開可能
- `any` は「実行時多態のボックス」→ 異種混在が必要な場所で使う
- 判断基準: ジェネリクス → `some` → `any` の順で検討する
- Swift の `any Protocol` は TypeScript の `any` とは全く別物。プロトコルの契約は常に守られる
- `any` キーワードはプロトコルにしか付かない（`Any` 大文字は別の組み込み型）
- Swift 5.7 から `any` の明示が必須になり、存在型であることが可視化された
