// Day08: 構造体 (struct)
//
// struct は値型。代入するとコピーされる。
//
//   struct Point {
//       var x: Double
//       var y: Double
//   }
//   let p = Point(x: 3, y: 4)
//
// プロパティ・メソッド・イニシャライザを持てる。
// mutating func は self を変更するメソッドに付ける。

import Foundation

// ----------------------------------------
// 課題1: Point の距離計算
// ----------------------------------------
// 2点間のユークリッド距離を返す
// 例: distance(from: Point(x:0,y:0), to: Point(x:3,y:4)) → 5.0

struct Point {
    var x: Double
    var y: Double
}

func distance(from a: Point, to b: Point) -> Double {
    // ここに実装してください
    let dx = b.x - a.x
    let dy = b.y - a.y
    return sqrt(dx * dx + dy * dy)
}

// ----------------------------------------
// 課題2: Rectangle の面積と周囲長
// ----------------------------------------
// width・height を持つ Rectangle を定義し、
// area() と perimeter() を返すメソッドを実装する

struct Rectangle {
    var width: Double
    var height: Double

    func area() -> Double {
        // ここに実装してください
        width * height
    }

    func perimeter() -> Double {
        // ここに実装してください
        2 * (width + height)
    }
}

// ----------------------------------------
// 課題3: Stack<Int> (push / pop / isEmpty)
// ----------------------------------------
// Int を積み重ねるスタックを struct で実装する
// push(_ value:) で追加、pop() で取り出し（空なら nil）、
// isEmpty で空かどうかを返す

struct Stack {
    private var storage: [Int] = []

    var isEmpty: Bool {
        // ここに実装してください
        storage.isEmpty
    }

    mutating func push(_ value: Int) {
        // ここに実装してください
        storage.append(value)
    }

    mutating func pop() -> Int? {
        // ここに実装してください
        storage.popLast()
    }
}
