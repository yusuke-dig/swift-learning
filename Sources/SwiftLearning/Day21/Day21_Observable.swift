// Day21: @Observable / ObservableObject
//
// Swift 5.9 から導入された @Observable マクロと、
// 従来の ObservableObject プロトコルを学ぶ。
//
// ■ ObservableObject (iOS 13〜)
//   class CounterModel: ObservableObject {
//       @Published var count = 0
//   }
//   → SwiftUI が @Published プロパティの変更を検知して再描画する
//
// ■ @Observable (iOS 17〜 / Swift 5.9〜)
//   @Observable
//   class CounterModel {
//       var count = 0    // @Published 不要
//   }
//   → マクロが自動で変更通知の仕組みを追加する
//   → プロパティアクセスが追跡されるので、読まれたプロパティだけ再描画される
//
// ■ 使い分け
//   - iOS 17以上のみ対象: @Observable を使う（シンプル）
//   - iOS 16以前もサポート: ObservableObject + @Published を使う

import Foundation
import Observation  // @Observable に必要

// ─────────────────────────────────────────
// 課題1: CounterModel を実装する
//   @Observable を付けた class を作り、
//   count: Int プロパティと increment() / decrement() メソッドを実装する。
//   count は 0 を下回らないようにする。
// ─────────────────────────────────────────

// ここに実装してください


// ─────────────────────────────────────────
// 課題2: TodoModel を実装する
//   @Observable を付けた class を作り、
//   items: [String] プロパティと addItem(_:) / removeItem(at:) メソッドを実装する。
//   - addItem: 空文字列は無視する
//   - removeItem: インデックスが範囲外なら無視する
// ─────────────────────────────────────────

// ここに実装してください


// ─────────────────────────────────────────
// 課題3: ObservableObject 版の ScoreModel を実装する
//   ObservableObject プロトコルに準拠した class を作り、
//   @Published var scores: [Int] と、
//   addScore(_:) / average() -> Double メソッドを実装する。
//   - addScore: 0〜100 の範囲外の値は無視する
//   - average: scores が空なら 0.0 を返す
// ─────────────────────────────────────────

// ここに実装してください
