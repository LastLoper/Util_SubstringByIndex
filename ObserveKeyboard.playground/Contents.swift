import UIKit

//키보드 상태를 감지하는 메서드
private func setUpKeyboardObserver() {
    //키보드가 올라오는 것을 감지
    NotificationCenter.default.addObserver(
        self,
        selector: #selector(self.keyboardWillShow),
        name: UIResponder.keyboardWillShowNotification,
        object: nil
    )
    
    //키보드가 내려가는 것을 감지
    NotificationCenter.default.addObserver(
        self,
        selector: #selector(self.keyboardWillHide),
        name: UIResponder.keyboardWillHideNotification,
        object:nil
    )
}

//키보드가 사라졌을 때 처리 메서드
@objc
private func keyboardWillShow(notification: NSNotification) {
    if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        let keyboardH = keyboardHeight - self.view.safeAreaInsets.bottom
        UIView.animate(withDuration: 1) {
            //view 상태 변경
        }
    }
}

//키보드가 사라졌을 때 처리 메서드
@objc
private func keyboardWillHide(notification: NSNotification) {
//        if self.view.window?.frame.origin.y != 0 {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let _ = keyboardRectangle.height
            UIView.animate(withDuration: 1) {
                //뷰 상태 변경
            }
        }
//        }
}
