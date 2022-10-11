import UIKit

extension UIViewController {
  
  func bottomLine(textFiled: UITextField) -> CALayer {
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0, y: textFiled.frame.height + 5, width: textFiled.frame.width, height: 2)
    bottomLine.backgroundColor = UIColor.init(red: 190/255, green: 190/255, blue: 190/255, alpha: 0.3).cgColor
    return bottomLine
  }
  
  @objc func endEditing() {
    view.endEditing(true)
  }
  
  func alert(title: String, message: String, textLabel: @escaping (String) -> Void) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addTextField { textField in
      textField.borderStyle = UITextField.BorderStyle.roundedRect
    }
    let actionOfOK = UIAlertAction(title: "OK", style: .default) { action in
      guard let text = alert.textFields?.first else { return }
      guard let txt = text.text else { return }
      textLabel(txt)
    }
    let actionOfCancel = UIAlertAction(title: "Cancel", style: .cancel)
    alert.addAction(actionOfOK)
    alert.addAction(actionOfCancel)
    present(alert, animated: true, completion: nil)
    if let textFields = alert.textFields {
      for textField in textFields {
        let container = textField.superview
        let effectView = container?.superview?.subviews[0]
        if effectView != nil {
          container?.backgroundColor = UIColor.clear
          effectView?.removeFromSuperview()
        }
      }
    }
  }
}
