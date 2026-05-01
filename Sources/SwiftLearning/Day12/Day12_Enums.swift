// Day12: 列挙型 (enum / associated values)
//
// enum は関連する値の集合を型として表現できる。
// associated values を使うと、case ごとに異なる値を持てる。
//
// 基本構文:
//   enum Direction { case north, south, east, west }
//
// associated values:
//   enum Shape {
//       case circle(radius: Double)
//       case rectangle(width: Double, height: Double)
//   }
//   let s = Shape.circle(radius: 3.0)
//
// switch で取り出す:
//   switch s {
//   case .circle(let r):         print(r)
//   case .rectangle(let w, let h): print(w, h)
//   }

// ── 課題1: Direction ─────────────────────────────────────────
// 東西南北を表す Direction enum の opposite プロパティを実装してください。
// - .north の反対は .south（逆も同様）
// - .east の反対は .west（逆も同様）
// computed property として実装する

enum Direction {
    case north, south, east, west
    
    var opposite: Direction {
        // ここに実装してください
        switch self {
        case .north: return .south
        case .south: return .north
        case .east: return .west
        case .west: return .east
        }
    }
}

// ── 課題2: Coin ──────────────────────────────────────────────
// 硬貨を表す Coin enum の value プロパティを実装してください。
// - .one    → 1
// - .five   → 5
// - .ten    → 10
// - .fifty  → 50
// - .hundred → 100
// - .fiveHundred → 500

enum Coin {
    case one, five, ten, fifty, hundred, fiveHundred
    
    var value: Int {
        // ここに実装してください
        switch self {
        case .one: return 1
        case .five: return 5
        case .ten: return 10
        case .fifty: return 50
        case .hundred: return 100
        case .fiveHundred: return 500
        }
    }
}

// ── 課題3: area ──────────────────────────────────────────────
// associated values を持つ Figure enum の面積を返す関数を実装してください。
// - .circle(radius:)           → Double.pi × r²
// - .rectangle(width:height:)  → width × height
// - .triangle(base:height:)    → base × height / 2

enum Figure {
    case circle(radius: Double)
    case rectangle(width: Double, height: Double)
    case triangle(base: Double, height: Double)
}

func area(of figure: Figure) -> Double {
    // ここに実装してください
    switch figure {
    case .circle(radius: let r): return .pi * r * r
    case .rectangle(width: let w, height: let h): return w * h
    case .triangle(base: let b, height: let h): return b * h / 2
    }
}
