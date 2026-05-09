// Day20: @propertyWrapper
//
// ## @propertyWrapper とは
// プロパティに対して「読み書きのルール」を付与する仕組み。
// `@propertyWrapper` を付けた型を作り、`wrappedValue` を定義するだけで使える。
//
// ## 基本構文
// @propertyWrapper
// struct Clamped {
//     var wrappedValue: Int { ... }
// }
//
// struct Foo {
//     @Clamped(min: 0, max: 100) var score: Int = 0
// }
//
// ## projectedValue ($プレフィックス)
// `projectedValue` を定義すると `$score` でアクセスできる。
// 例えば「クランプされているかどうか」を Bool で返すなど。

// ----------------------------------------------------------------
// 課題1: @Clamped
// 整数値を指定した範囲 [min, max] に収める @propertyWrapper を実装する。
// 範囲外の値を set しようとしたとき、min/max に丸める。
// ----------------------------------------------------------------
@propertyWrapper
struct Clamped {
    private var value: Int
    let min: Int
    let max: Int

    var wrappedValue: Int {
        get { value }
        set {
            // ここに実装してください
        }
    }

    init(wrappedValue: Int, min: Int, max: Int) {
        self.min = min
        self.max = max
        // ここに実装してください
        self.value = 0 // 仮置き（削除して正しく実装する）
    }
}

// ----------------------------------------------------------------
// 課題2: @Trimmed
// 文字列の前後の空白・改行を自動でトリムする @propertyWrapper を実装する。
// ----------------------------------------------------------------
@propertyWrapper
struct Trimmed {
    private var value: String = ""

    var wrappedValue: String {
        get { value }
        set {
            // ここに実装してください
        }
    }

    init(wrappedValue: String) {
        // ここに実装してください
    }
}

// ----------------------------------------------------------------
// 課題3: @Clamped に projectedValue を追加
// クランプが発生した（値が範囲外だった）かどうかを Bool で返す
// projectedValue を Clamped に追加する。
// ※ Clamped の定義を上で修正して対応すること。
//   以下の ClampedWithProjection は projectedValue 付きの完成版として
//   別途実装する。
// ----------------------------------------------------------------
@propertyWrapper
struct ClampedWithProjection {
    private var value: Int
    let min: Int
    let max: Int
    private(set) var projectedValue: Bool = false // クランプされたか

    var wrappedValue: Int {
        get { value }
        set {
            // ここに実装してください
        }
    }

    init(wrappedValue: Int, min: Int, max: Int) {
        self.min = min
        self.max = max
        // ここに実装してください
        self.value = 0 // 仮置き（削除して正しく実装する）
    }
}
