import UIKit

class GameViewController: UIViewController {
  //Переменная для сохранения того, что напишет пользователь
  var word: String = ""
  //Создание лэйбла
  var label = UILabel()
  //Создание кнопки
  var startButton = UIButton()
  
  override func viewDidLoad() {
    //Настройка лэйбла
    label = UILabel(frame: CGRect(x: 120, y: 300, width: 200, height: 50))
    label.textAlignment = .center
    label.text = ""
    label.layer.cornerRadius = 15
    label.layer.borderWidth = 1
    label.textColor = .black
    label.isHidden = true
    view.addSubview(label)
    //Настройка кнопки
    super.viewDidLoad()
    startButton = UIButton(frame: CGRect(x: 120, y: 400, width: 200, height: 50))
    startButton.setTitle("Старт", for: .normal)
    startButton.backgroundColor = .systemOrange
    startButton.layer.cornerRadius = 10
    startButton.setTitleColor(UIColor.link, for: .normal)
    startButton.addTarget(self, action: #selector(enterWord), for: .touchUpInside)
    view.addSubview(startButton)
  }
  
  //Селектор, в котором создается алерт, в который пользователем вводится слово, и в зависимости от того, что пользователь введет, лэйблу присвоится определенное значение
  @objc func enterWord(sender: UIButton!) {
    let alertController = UIAlertController(title: "Введите слово", message: "", preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default) { (action) in
      self.word = (alertController.textFields?.first?.text)!
      let gameResponse = GameResponse(word: self.word)
      self.label.text = gameResponse.wordReturn()
      self.label.isHidden = false
    }
    alertController.addTextField { (textField) in
      textField.placeholder = "leohl"
      textField.borderStyle = UITextField.BorderStyle.roundedRect
    }
    alertController.addAction(action)
    present(alertController, animated: true)
    for textField in alertController.textFields! {
      let container = textField.superview
      let effectView = container?.superview?.subviews[0]
      if (effectView != nil) {
        container?.backgroundColor = UIColor.clear
        effectView?.removeFromSuperview()
      }
    }
  }
}
