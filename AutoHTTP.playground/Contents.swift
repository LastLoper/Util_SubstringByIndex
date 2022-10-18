import UIKit

//'http://' 자동 삽입
func addHTMLAuto(_ url:String) -> String {
    var strUrl = url
    let flag = strUrl.hasPrefix("http://")
    if (!flag) {
        strUrl = "http://" + strUrl
    }
    
    return strUrl
}
