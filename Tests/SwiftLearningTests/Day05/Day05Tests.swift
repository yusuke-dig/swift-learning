import Testing
@testable import SwiftLearning

@Suite("Day05: 制御構文")
struct Day05Tests {

    @Test("grade: 各グレード境界")
    func testGrade() {
        #expect(grade(100) == "A")
        #expect(grade(90)  == "A")
        #expect(grade(89)  == "B")
        #expect(grade(70)  == "B")
        #expect(grade(69)  == "C")
        #expect(grade(50)  == "C")
        #expect(grade(49)  == "D")
        #expect(grade(0)   == "D")
    }

    @Test("fizzBuzz: 基本ケース")
    func testFizzBuzzBasic() {
        #expect(fizzBuzz(5) == ["1", "2", "Fizz", "4", "Buzz"])
    }

    @Test("fizzBuzz: FizzBuzz含む")
    func testFizzBuzzFull() {
        let result = fizzBuzz(15)
        #expect(result[2]  == "Fizz")   // 3
        #expect(result[4]  == "Buzz")   // 5
        #expect(result[14] == "FizzBuzz") // 15
        #expect(result[0]  == "1")
    }

    @Test("factorial: 通常値")
    func testFactorialNormal() {
        #expect(factorial(5) == 120)
        #expect(factorial(4) == 24)
        #expect(factorial(1) == 1)
    }

    @Test("factorial: 0は1")
    func testFactorialZero() {
        #expect(factorial(0) == 1)
    }
}
