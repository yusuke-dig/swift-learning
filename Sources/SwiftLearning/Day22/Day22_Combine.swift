import Combine

// Day22: Combine 入門
//
// Combine は Apple 製の非同期イベント処理フレームワーク。
// 「値を流す側 (Publisher)」と「値を受け取る側 (Subscriber)」で構成される。
//
// 主要な型:
//   Publisher   — 時間軸に沿って値やエラーを流すストリーム
//   Subscriber  — Publisher に購読 (subscribe) して値を受け取る
//   AnyCancellable — 購読の解除ハンドル。保持しないと即解除される
//
// よく使う Publisher:
//   Just(value)               — 1つの値を流してすぐ完了する
//   PassthroughSubject<V, E>  — 手動で値を送出できる Subject
//   CurrentValueSubject<V, E> — 現在値を保持する Subject
//
// 購読:
//   publisher.sink(
//     receiveCompletion: { completion in ... },   // .finished or .failure(error)
//     receiveValue: { value in ... }
//   )
//
// 例:
//   let cancellable = Just(42)
//       .sink(receiveCompletion: { _ in },
//             receiveValue: { print($0) })  // 42

// ----------------------------------------
// 課題1（易）: Just を使って値を収集する
// ----------------------------------------
// Just で整数の配列 [1, 2, 3] を1件ずつ流し、
// sink で受け取った値を results 配列に追加して返す。
// ヒント: Just は1つの値しか流せないので、Publishers.Sequence を使う。
//   Publishers.Sequence(sequence: [1, 2, 3])
func collectFromSequence() -> [Int] {
    var results: [Int] = []
    // ここに実装してください
    let cancellable = Publishers.Sequence(sequence: [1, 2, 3])
        .sink { value in
            results.append(value)
        }
    
    _ = cancellable
    
    return results
}

// ----------------------------------------
// 課題2（中）: PassthroughSubject で値を送出する
// ----------------------------------------
// PassthroughSubject<String, Never> を使って
// "Hello", "Combine", "World" を順に send し、
// sink で受け取った値を配列で返す。
// AnyCancellable を保持しないと購読が即解除されるので注意。
func sendWithSubject() -> [String] {
    var results: [String] = []
    // ここに実装してください
    let subject = PassthroughSubject<String, Never>()
    
    let cancellable = subject
        .sink(receiveValue: { value in
            results.append(value)
        })
    
    subject.send("Hello")
    subject.send("Combine")
    subject.send("World")
    
    _ = cancellable
    
    return results
}

// ----------------------------------------
// 課題3（中）: map + filter オペレータ
// ----------------------------------------
// Publishers.Sequence(sequence: 1...10) に対して
//   1. map で各値を2倍にする
//   2. filter で10より大きい値だけ残す
// sink で受け取った値を配列で返す。
func mapAndFilter() -> [Int] {
    var results: [Int] = []
    // ここに実装してください
    
    let cancellable = Publishers.Sequence(sequence: 1...10)
        .map { $0 * 2 }
        .filter { $0 > 10 }
        .sink(receiveValue: { value in
            results.append(value)
        })
    
    _ = cancellable
    
    return results
}
