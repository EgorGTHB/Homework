import UIKit


final class ViewController: UIViewController {
  //Создание кнопки сложения
  private let additionButton = UIButton()
  //Создание кнопки угадывания числа
  private let numberGuessingButton = UIButton()
  //Создание лэйбла, в котором будет отображаться ФИО пользователя
  private let labelFullName = UILabel()

  override func viewDidLoad() {
    super.viewDidLoad()
    //Настройка кнопки сложения
    additionButton.frame = CGRect(x: 50, y: 400, width: 150, height: 50)
    additionButton.backgroundColor = .black
    additionButton.setTitle("Сложение", for: .normal)
    additionButton.layer.cornerRadius = 10
    additionButton.isHidden = true
    additionButton.addTarget(self, action: #selector(addition), for: .touchUpInside)
    view.addSubview(additionButton)
    //Настройка кнопки угадывания числа
    numberGuessingButton.frame = CGRect(x: 220, y: 400, width: 150, height: 50)
    numberGuessingButton.backgroundColor = .black
    numberGuessingButton.setTitle("Угадай число", for: .normal)
    numberGuessingButton.layer.cornerRadius = 10
    numberGuessingButton.isHidden = true
    numberGuessingButton.addTarget(self, action: #selector(numberGuessing), for: .touchUpInside)
    view.addSubview(numberGuessingButton)
    //Настройка лэйбла
    labelFullName.frame = CGRect(x: 50, y: 300, width: 320, height: 50)
    labelFullName.textAlignment = .center
    labelFullName.text = ""
    labelFullName.font = labelFullName.font.withSize(25)
    labelFullName.backgroundColor = .gray
    labelFullName.isHidden = true
    labelFullName.textColor = .black
    view.addSubview(labelFullName)

    //Создание алерта авторизации
    DispatchQueue.main.async {
      let alertControllerOfAuthorizathion = UIAlertController(title: "Давайте знакомиться", message: "Введите свое имя", preferredStyle: .alert)
      alertControllerOfAuthorizathion.addTextField { (textField) in
        textField.placeholder = "Ваше имя"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
      }
      let actionOfAuthorizathion = UIAlertAction(title: "OK", style: .default) { (action) in
        self.additionButton.isHidden = false
        self.numberGuessingButton.isHidden = false
        if let text = alertControllerOfAuthorizathion.textFields?.first {
           if let txt = text.text {
        self.labelFullName.text = "Привет, \(txt) :)"
           }
        }
        self.labelFullName.isHidden = false
      }
      alertControllerOfAuthorizathion.addAction(actionOfAuthorizathion)
      self.present(alertControllerOfAuthorizathion, animated: true, completion: nil)
      //Внешний вид textFields
      if let textFilds = alertControllerOfAuthorizathion.textFields {
      for textField in textFilds {
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

  //Алерт сложения
  @objc private func addition(sender: UIButton) {
    additionButton.isHidden = true
    numberGuessingButton.isHidden = true
    labelFullName.isHidden = true
    var result: Int = 0
    let alertControllerOfAddition = UIAlertController(title: "Сложение чисел", message: "Введите два числа, которые вы хотите сложить", preferredStyle: .alert)
    let actionOfAddition = UIAlertAction(title: "Сложить", style: .default) { (action) in
      if let text1 = alertControllerOfAddition.textFields![0].text, let text2 = alertControllerOfAddition.textFields![1].text {
        if let firstNumber = Int(text1), let secondNumber = Int(text2) {
           result = firstNumber + secondNumber
        }
    }
      let alertControllerOfResult = UIAlertController(title: "Результат", message: "Ответ равен: \(result)", preferredStyle: .alert)
      let actionOfResult = UIAlertAction(title: "Выйти", style: .cancel) { (action) in
        self.additionButton.isHidden = false
        self.numberGuessingButton.isHidden = false
        self.labelFullName.isHidden = false
      }
      alertControllerOfResult.addAction(actionOfResult)
      self.present(alertControllerOfResult, animated: true, completion: nil)
    }
    //Добавление текстового поля в alertControllerOfAddition
    alertControllerOfAddition.addTextField { (textField) in
      textField.placeholder = "Первое число"
      textField.borderStyle = UITextField.BorderStyle.roundedRect
      textField.keyboardType = UIKeyboardType.numberPad
    }
    //Добавление текстового поля в alertControllerOfAddition
    alertControllerOfAddition.addTextField { (textField) in
      textField.placeholder = "Второе число"
      textField.borderStyle = UITextField.BorderStyle.roundedRect
      textField.keyboardType = UIKeyboardType.numberPad
    }
     //Внешний вид textFields
    if let txtfields = alertControllerOfAddition.textFields {
      for textField in txtfields {
        let container = textField.superview
        let effectView = container?.superview?.subviews[0]
        if effectView != nil {
          container?.backgroundColor = UIColor.clear
          effectView?.removeFromSuperview()
        }
      }
    }
    //Добавление actionOfAddition в alertControllerOfAddition
    alertControllerOfAddition.addAction(actionOfAddition)
    present(alertControllerOfAddition, animated: true, completion: nil)
  }

  //Алерт угадывания числа
  @objc private func numberGuessing(sender: UIButton) {
    additionButton.isHidden = true
    numberGuessingButton.isHidden = true
    labelFullName.isHidden = true
    let randomInt = Int.random(in: 0...10)
    let alertControllerOfNumberGuessing = UIAlertController(title: "Компьютер загадал число", message: "Попробуйте его угадать. Введите число от 0 до 10", preferredStyle: .alert)
    let actionOfNumberGuessing = UIAlertAction(title: "Сравнить числа", style: .default) { (action) in
      var answer: String = ""
      if let txt = alertControllerOfNumberGuessing.textFields?[0].text {
        if randomInt == Int(txt) {
          answer = " угадали!"
        } else {
          answer = " не угадали :( Попробуйте еще раз"
        }
      }
      let alertControllerOfGuessedOrNot = UIAlertController(title: "Барабанная дробь...", message: "Вы\(answer)", preferredStyle: .alert)
      let actionOfResult = UIAlertAction(title: "Выйти", style: .cancel) { (action) in
        self.additionButton.isHidden = false
        self.numberGuessingButton.isHidden = false
        self.labelFullName.isHidden = false
      }
      alertControllerOfGuessedOrNot.addAction(actionOfResult)
      self.present(alertControllerOfGuessedOrNot, animated: true, completion: nil)
    }
    alertControllerOfNumberGuessing.addTextField { (textField) in
      textField.placeholder = "Первое число"
      textField.borderStyle = UITextField.BorderStyle.roundedRect
      textField.keyboardType = UIKeyboardType.numberPad
    }
    alertControllerOfNumberGuessing.addAction(actionOfNumberGuessing)
    present(alertControllerOfNumberGuessing, animated: true, completion: nil)
    //Внешний вид textFields
    if let txtfields = alertControllerOfNumberGuessing.textFields {
      for textField in txtfields  {
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







 
