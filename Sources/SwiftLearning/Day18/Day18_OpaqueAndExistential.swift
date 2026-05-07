// Day18: some / any（不透明型・存在型）
//
// ■ some（不透明型）
//   戻り値の「具体的な型」をコンパイラが知っており、呼び出し側には隠す。
//   → 型の同一性が保証され、パフォーマンスが良い。
//
//   protocol D18Shape { func area() -> Double }
//   struct D18Circle: D18Shape { ... }
//
//   func makeCircle() -> some D18Shape { D18Circle(radius: 1) }  // ✅ 毎回同じ型
//
// ■ any（存在型）
//   「このプロトコルを実装した何らかの型」を格納するボックス。
//   → 型が実行時まで不明。異なる型を1つの配列に入れられる。
//
//   func describeAll(_ shapes: [any D18Shape]) { ... }
//
// ■ 使い分け
//   - 型が1種類で固定 → some（速い、型安全）
//   - 異なる型を混在させたい → any（柔軟だがオーバーヘッドあり）

import Foundation

// --- プロトコル定義（変更しない） ---

protocol D18Shape {
    func area() -> Double
    func name() -> String
}

struct D18Circle: D18Shape {
    let radius: Double
    func area() -> Double { Double.pi * radius * radius }
    func name() -> String { "Circle(r=\(radius))" }
}

struct D18Rectangle: D18Shape {
    let width: Double
    let height: Double
    func area() -> Double { width * height }
    func name() -> String { "Rectangle(\(width)x\(height))" }
}

struct D18Triangle: D18Shape {
    let base: Double
    let height: Double
    func area() -> Double { base * height / 2 }
    func name() -> String { "Triangle(b=\(base),h=\(height))" }
}

// -----------------------------------------------------------
// 課題1（易）: some を使って D18Circle を返す関数
// -----------------------------------------------------------
// `some D18Shape` を戻り値型にして、指定した半径の D18Circle を返してください。

func makeCircle(radius: Double) -> some D18Shape {
    // ここに実装してください
    D18Circle(radius: radius)
}

// -----------------------------------------------------------
// 課題2（中）: any を使って面積の大きい順に並べる関数
// -----------------------------------------------------------
// `[any D18Shape]` を受け取り、面積の降順で並べた配列を返してください。

func sortedByArea(_ shapes: [any D18Shape]) -> [any D18Shape] {
    // ここに実装してください
    shapes.sorted { $0.area() > $1.area() }
}

// -----------------------------------------------------------
// 課題3（中）: any を使って名前一覧を返す関数
// -----------------------------------------------------------
// `[any D18Shape]` を受け取り、各要素の `name()` を連結した文字列の配列を返してください。

func shapeNames(_ shapes: [any D18Shape]) -> [String] {
    // ここに実装してください
    shapes.map { $0.name() }
}
