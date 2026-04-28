// Day09: クラスと継承 (class/inheritance)
//
// クラスは struct と似ているが「参照型」。継承ができる。
//
// 基本構文:
//   class Animal {
//       var name: String
//       init(name: String) { self.name = name }
//       func speak() -> String { return "..." }
//   }
//   class Dog: Animal {
//       override func speak() -> String { return "Woof" }
//   }
//
// ポイント:
//   - `override` キーワードでメソッドを上書きする
//   - `super.init(...)` で親の初期化を呼び出す
//   - 同じモジュール内で名前が重複できないため、Day08の Rectangle と区別して Rect を使う

import Foundation

// ── 基底クラス ──────────────────────────────────────────────
class Shape {
    var color: String

    init(color: String) {
        self.color = color
    }

    // 面積を返す（サブクラスでオーバーライドする）
    func area() -> Double {
        return 0.0
    }

    // 説明文を返す
    func describe() -> String {
        return "\(color) shape with area \(area())"
    }
}

// ── 課題1: Circle ────────────────────────────────────────────
// Shape を継承した Circle クラスを完成させてください。
// - プロパティ: radius: Double
// - init(color:radius:) で初期化（super.init を呼ぶこと）
// - area() をオーバーライドして π × r² を返す
//   (Double.pi を使う)

class Circle: Shape {
    var radius: Double

    init(color: String, radius: Double) {
        // ここに実装してください
    }

    override func area() -> Double {
        // ここに実装してください
    }
}

// ── 課題2: Rect ───────────────────────────────────────────────
// Shape を継承した Rect クラスを完成させてください。
// - プロパティ: width: Double, height: Double
// - init(color:width:height:) で初期化
// - area() をオーバーライドして width × height を返す

class Rect: Shape {
    var width: Double
    var height: Double

    init(color: String, width: Double, height: Double) {
        // ここに実装してください
    }

    override func area() -> Double {
        // ここに実装してください
    }
}

// ── 課題3: isLarger ──────────────────────────────────────────
// 2つの Shape を受け取り、面積が大きい方を返す関数を実装してください。
// 面積が同じ場合は a を返す。
// 戻り値の型は Shape（継承があるので両方受け取れる）

func isLarger(_ a: Shape, _ b: Shape) -> Shape {
    // ここに実装してください
}
