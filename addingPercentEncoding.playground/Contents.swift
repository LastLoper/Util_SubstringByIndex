import UIKit

/*
 한글을 파라미터로 전송할 때,
 서버까지 깨지지 않고 전달되로고 해주는 옵션
 addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) -> String?
 
 */
var greeting = "안녕하세요, Hello"
print(greeting.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")

