/*
 문자열을 [<숫자>] 형태로 Element에 접근할 수 있도록 String을 확장하는 코드
 */
import UIKit
import Foundation

var someString = "I'm Walter"
print(someString[4])

extension String {
    //Character형태로 반환
    subscript(_ index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
