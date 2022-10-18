# 유틸리티

## Substring
Swift는 **문자열[idx]** 방식으로 문자를 추출할 수가 없으므로 String을 확장해서 보다 쉽게 추출할 수 있도록 했다.

### 사용법
```swift
var someString = "I'm Walter"
print(someString[4])

extension String {
    //Character형태로 반환
    subscript(_ index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
```

## 랜덤함수
조금 지난 버전의 랜덤함수와 현재 사용중인 랜덤함수를 정리했다.

### 사용법
```swift
//Swift 4.2이전
let randomNo_1 = arc4random()
let randomNo_2 = Int(arc4random_uniform(5)) //0~4사이의 난수 생성
let randomNo_3 = drand48() //0.0~1.0까지 난 수생성

//Swift 4.2이후
let ranomNo_4 = Int.random(in: 0..<9)       //0~8까지 난수 생성
let randomNo_5 = Double.random(in: 0.0...10.0)  //0.0~10.0까지 난수 생성
```

## HTTP 체크 및 추가
URL 형태의 String에서 "http://" 가 있는지 체크 후, 자동으로 추가한다.
함수 또는 확장해서 사용할 수 있다.

### 사용법
```swift
let urlWithHttp:String = addHTMLAuto(urlStr)

//'http://' 자동 삽입
func addHTMLAuto(_ url:String) -> String {
    var strUrl = url
    let flag = strUrl.hasPrefix("http://")
    if (!flag) {
        strUrl = "http://" + strUrl
    }
    
    return strUrl
}
```
