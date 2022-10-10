import UIKit

/*
 Swift 4.2이전의 Random함수
 - arc4random()
 - arc4random_uniform(UInt32)
 - drand48()
 */

//0~2^32-1 사이의 난수 발생
//UInt32를 반환
let randomNo_1 = arc4random()

//0~4 사이의 난수 발생 : 0과 입력한 파라미터 ~ UInt32-1 을 반환
let randomNo_2 = Int(arc4random_uniform(5))

//0 ~ 1.0까지의 난수를 발생
//Double형을 반환
let randomNo_3 = drand48()


/*
 Swift 4.2이후의 Random함수
 - random(in: Range<Int, Double>)
 : 범위를 파라미터로 전달해야 하며, range 또는 closedRange를 넘겨야 함
 */

//Int형
let ranomNo_4 = Int.random(in: 0..<9)

//Double형
let randomNo_5 = Double.random(in: 0.0...10.0)


/*
 배열에서 임의의 값을 뽑아낼 수 있는 함수
 */
var numbers = [2, 8, 19, 31, 45, 11]
let number = numbers.randomElement()

//현재의 배열을 임의로 섞기
numbers.shuffle()

//현재 배열을 임의로 섞은 배열을 반환
let copy_numbers = numbers.shuffled()
