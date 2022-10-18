import UIKit

//'http://' or 'https://' 자동 삽입
//함수
func addHTMLAuto(_ url:String) -> String {
    var strUrl = ""
    var flag = false
    
    if strUrl.hasPrefix("http://") || strUrl.hasPrefix("https://") {
        flag = true
    }
    
    if (!flag) {
        strUrl = "http://" + url
    }
    
    return strUrl
}

//extesion
extension String {
    //'http://' 자동 삽입
    func addHTMLAuto() -> String {
        var strUrl = ""
        var flag = false
        if self.hasPrefix("http://") || self.hasPrefix("https://") {
            flag = true
        }
        
        if (!flag) {
            strUrl = "http://" + self
        }
        
        return strUrl
    }
}
