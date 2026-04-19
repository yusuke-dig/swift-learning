# Swift Learning Project

## このプロジェクトについて
毎日15分のSwift文法学習プロジェクト。
「今日の分をお願い」と言われたら、次のDayを自動で作成・コミットする。

## 「今日の分をお願い」と言われたときの手順

1. `Sources/SwiftLearning/` の中で最も大きい Day番号を確認する
2. 次の番号のDayを決定する (例: Day01があれば Day02を作る)
3. カリキュラムに従って実装テンプレートとテストを作成する
4. 以下のファイルを作成する:
   - `Sources/SwiftLearning/DayXX/DayXX_{TopicName}.swift` (実装テンプレート)
   - `Tests/SwiftLearningTests/DayXX/DayXXTests.swift` (テスト)
5. git add して適切なメッセージでコミットする

## ファイルの書き方ルール

### 実装テンプレート (Sources側)
- 冒頭に学習内容の解説コメントを書く（日本語、初学者向け）
- var/let の具体例をコメントで示す
- 3つの課題関数を用意する（難易度: 易→中→中）
- 関数本体は `// ここに実装してください` のみ

### テスト (Tests側)
- `import Testing` と `@testable import SwiftLearning` を使う
- `@Suite("DayXX: トピック名")` でスイートを作る
- 各課題に対して `@Test` を1つ、複数の `#expect` でカバー
- 境界値・ネガティブケースも含める

## カリキュラム

| Day | トピック | 関数テーマ例 |
|-----|---------|------------|
| Day01 | 変数と定数 (var/let) | greet, add, isEven |
| Day02 | 基本型と型推論 (Int/String/Bool/Double) | celsiusToFahrenheit, isLongWord, absolute |
| Day03 | オプショナル (Optional/if let/guard let) | safeDivide, firstElement, parseAge |
| Day04 | コレクション (Array/Dictionary) | sum, countOccurrences, mostFrequent |
| Day05 | 制御構文 (if/switch/for-in) | grade, fizzBuzz, factorial |
| Day06 | 関数 (引数ラベル/デフォルト値/inout) | repeat, swap, clamp |
| Day07 | クロージャ | applyTwice, myFilter, myMap |
| Day08 | 構造体 (struct) | Point距離計算, Rectangle面積, Stack |
| Day09 | クラスと継承 | Shape/Circle/Rectangle |
| Day10 | プロトコル | Describable, Comparable実装 |
| Day11 | エラー処理 (throw/try/catch) | parseTemperature, safeSqrt |
| Day12 | 列挙型 (enum/associated values) | Direction, Result風enum |
| Day13 | 高階関数 (map/filter/reduce) | doubleAll, onlyEven, sumAll |
| Day14 | ジェネリクス | Stack<T>, findFirst |
| Day15 | 非同期処理 (async/await) | fetchMessage, parallelFetch |

## コミットメッセージ形式
```
Add Day{XX}: {日本語トピック名}

- {実装テンプレートファイル名}
- {テストファイル名}
```
