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

## PrefetchingDataSource In TableView
네트워크 통신으로 페이징 단위 데이터를 받아오는 경우, 스크롤 마지막 부분에서 다음 페이지 데이터를 요청하는 방법이다.

### 사용법
```swift
var currentPage = 1

override func viewDidLoad() {
    ...
    tableView.prefetchDataSource = self
}

extension VC: UITableViewDataSourcePrefetching {
        func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard self.currentPage != 1 else { return }
        
        indexPaths.forEach({
            if ($0.row + 1)/<한 페이지 데이터 개수> + 1 == self.currentPage {
                self.fetchData(of: self.currentPage)
            }
        })
    }
}
```

## 키패드 상태 감지
NotificationCenter를 이용한, 키패드가 올라온 상태인지 아닌지 감지하고 각 이벤트를 처리할 수 있다.
```swift
//키패드가 올라온 것을 감지
NotificationCenter.default.addObserver(
    self,
    selector: #selector(self.keyboardWillShow),
    name: UIResponder.keyboardWillShowNotification,
    object: nil
)
    
//키보드가 내려간 것을 감지
NotificationCenter.default.addObserver(
    self,
    selector: #selector(self.keyboardWillHide),
    name: UIResponder.keyboardWillHideNotification,
    object:nil
)
```

## 한글이 깨지지 않고 서버로 전달될 수 있도록 해주는 메서드
```swift
addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
```

## View, ImageView, Label등에 부분적 외곽선 그리기
```swift
//Usage
self.label.layer.drawLineAt(
    edges: [.bottom],
    color: UIColor.black,
    width: 5.0
)

extension CALayer {
    func drawLineAt(edges:[UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in edges {
            let border = CALayer()
            
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(
                    x: 0,
                    y: 0,
                    width: bounds.width,
                    height: width
                )
            case UIRectEdge.bottom:
                border.frame = CGRect.init(
                    x: 0,
                    y: frame.height-width,
                    width: bounds.width,
                    height: width
                )
            case UIRectEdge.left:
                border.frame = CGRect.init(
                    x: 0,
                    y: 0,
                    width: width,
                    height: bounds.height
                )
            case UIRectEdge.right:
                border.frame = CGRect.init(
                    x: frame.width-width,
                    y: 0,
                    width: width,
                    height: bounds.height
                )
            default:
                break
            }
            
            border.backgroundColor = color.cgColor
            self.addSublayer(border)
        }
    }
}
```