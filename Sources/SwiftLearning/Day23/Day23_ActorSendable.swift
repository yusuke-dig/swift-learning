// Day23: Actor / Sendable
//
// ## Actor とは
// `actor` はクラスに似た参照型だが、内部状態へのアクセスを直列化して
// データ競合（data race）を防ぐ。
//
// ```swift
// actor Counter {
//     private var value = 0
//     func increment() { value += 1 }
//     func get() -> Int { value }
// }
// let c = Counter()
// await c.increment()   // actor への呼び出しは await が必要
// ```
//
// ## Sendable とは
// `Sendable` はスレッド境界を越えて安全に渡せる型を表すプロトコル。
// struct / enum / actor は自動的に Sendable になる場合が多い。
// クラスは `@unchecked Sendable` で手動適合もできる（自己責任）。
//
// ## 課題
// 以下の3つの関数・型を実装してください。

import Foundation

// -------------------------------------------------------
// 課題1: SafeCounter
// `actor` を使ったスレッドセーフなカウンターを実装してください。
// - increment(): カウントを1増やす
// - decrement(): カウントを1減らす
// - value: 現在の値を返す
// -------------------------------------------------------
actor SafeCounter {
    private var count: Int = 0

    func increment() {
        // ここに実装してください
    }

    func decrement() {
        // ここに実装してください
    }

    var value: Int {
        // ここに実装してください
        return 0
    }
}

// -------------------------------------------------------
// 課題2: SafeCache<Key, Value>
// `actor` を使ったスレッドセーフなキャッシュを実装してください。
// - store(key:value:): キーと値を保存する
// - fetch(key:): キーに対応する値を返す。なければ nil
// - clear(): キャッシュをすべて削除する
// -------------------------------------------------------
actor SafeCache<Key: Hashable, Value> {
    private var storage: [Key: Value] = [:]

    func store(key: Key, value: Value) {
        // ここに実装してください
    }

    func fetch(key: Key) -> Value? {
        // ここに実装してください
        return nil
    }

    func clear() {
        // ここに実装してください
    }
}

// -------------------------------------------------------
// 課題3: parallelSum
// 2つの整数配列を並行して合計し、その結果を返す関数を実装してください。
// `async let` を使って2つの合計を並行計算し、最後に足し合わせます。
// ヒント: 配列の合計を返す内部関数 sum(_ arr: [Int]) -> Int を使ってください
// -------------------------------------------------------
func parallelSum(a: [Int], b: [Int]) async -> Int {
    // ここに実装してください
    return 0
}
