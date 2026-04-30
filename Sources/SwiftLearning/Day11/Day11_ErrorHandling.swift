// Day11: エラー処理 (throw/try/catch)
//
// エラーを表す型は Error プロトコルを採択した enum で定義する。
// エラーを投げる関数には throws を付け、呼ぶ側は try を付ける。
//
// 基本構文:
//   enum MyError: Error { case invalid }
//
//   func parse(_ s: String) throws -> Int {
//       guard let n = Int(s) else { throw MyError.invalid }
//       return n
//   }
//
//   do {
//       let n = try parse("abc")  // エラーが起きる
//   } catch MyError.invalid {
//       print("無効な値")
//   }
//
// ポイント:
//   - エラーにならないと分かっている場合は try! も使えるが、
//     失敗すると即クラッシュするので慎重に
//   - Result<T, E> 型でエラーを戻り値として扱う方法もある

import Foundation

// ── エラー型 ────────────────────────────────────────────────
enum TemperatureError: Error {
    case tooCold    // -273.15℃ 未満（絶対零度以下）
    case tooHot     // 1000℃ 超
}

enum MathError: Error {
    case negativeInput  // 負の値
    case divisionByZero
}

// ── 課題1: parseTemperature ──────────────────────────────────
// Double を受け取り、有効な温度なら返す関数を実装してください。
// - -273.15 未満なら TemperatureError.tooCold を throw
// - 1000.0 超なら TemperatureError.tooHot を throw
// - それ以外はそのまま返す

func parseTemperature(_ value: Double) throws -> Double {
    // ここに実装してください
}

// ── 課題2: safeSqrt ──────────────────────────────────────────
// Double を受け取り、平方根を返す関数を実装してください。
// - 負の値なら MathError.negativeInput を throw
// - 0 以上なら sqrt(value) を返す（Foundation の sqrt を使う）

func safeSqrt(_ value: Double) throws -> Double {
    // ここに実装してください
}

// ── 課題3: describeTemperature ───────────────────────────────
// parseTemperature を呼び出し、結果を文字列で返す関数を実装してください。
// - 成功: "\(value)℃ は有効です"
// - TemperatureError.tooCold: "低すぎます"
// - TemperatureError.tooHot:  "高すぎます"
// do-catch を使って実装すること

func describeTemperature(_ value: Double) -> String {
    // ここに実装してください
}
