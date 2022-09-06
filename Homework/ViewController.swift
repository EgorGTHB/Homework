import UIKit

class ViewController: UIViewController {
    
    //Создание кнопки сложения
    var additionButton = UIButton()
    //Создание кнопки угадывания числа
    var numberGuessingButton = UIButton()
    //Создание лэйбла, в котором будет отображаться ФИО пользователя
    var labelFullName = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Настройка лэйбла
        labelFullName = UILabel(frame: CGRect(x: 50, y: 300, width: 320, height: 50))
        labelFullName.textAlignment = .center
        labelFullName.text = "Привет, "
        labelFullName.font = labelFullName.font.withSize(25)
        labelFullName.backgroundColor = .gray
        labelFullName.isHidden = true
        labelFullName.textColor = .black
        self.view.addSubview(labelFullName)
        
        //Настройка кнопки сложения
        additionButton = UIButton(frame: CGRect(x: 50, y: 400, width: 150, height: 50))
        additionButton.backgroundColor = .black
        additionButton.setTitle("Сложение", for: .normal)
        additionButton.layer.cornerRadius = 10
        additionButton.isHidden = true
        additionButton.addTarget(self, action: #selector(addition), for: .touchUpInside)
        self.view.addSubview(additionButton)
        
        //Настройка кнопки угадывания числа
        numberGuessingButton = UIButton(frame: CGRect(x: 220, y: 400, width: 150, height: 50))
        numberGuessingButton.backgroundColor = .black
        numberGuessingButton.setTitle("Угадай число", for: .normal)
        numberGuessingButton.layer.cornerRadius = 10
        numberGuessingButton.isHidden = true
        numberGuessingButton.addTarget(self, action: #selector(numberGuessing), for: .touchUpInside)
        self.view.addSubview(numberGuessingButton)
        
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
                let text = alertControllerOfAuthorizathion.textFields?.first
                self.labelFullName.text! += "\((text?.text!)!) :)"
                self.labelFullName.isHidden = false
            }
            
            alertControllerOfAuthorizathion.addAction(actionOfAuthorizathion)
            self.present(alertControllerOfAuthorizathion, animated: true, completion: nil)
   
            for textField in alertControllerOfAuthorizathion.textFields! {
                let container = textField.superview
                let effectView = container?.superview?.subviews[0]
                if (effectView != nil) {
                    container?.backgroundColor = UIColor.clear
                    effectView?.removeFromSuperview()
                }
            }
        }
    }
    
    //Алерт сложения
    @objc func addition(sender: UIButton!) {
        
        self.additionButton.isHidden = true
        self.numberGuessingButton.isHidden = true
        self.labelFullName.isHidden = true
        
        let alertControllerOfAddition = UIAlertController(title: "Сложение чисел", message: "Введите два числа, которые вы хотите сложить", preferredStyle: .alert)
        let actionOfAddition = UIAlertAction(title: "Сложить", style: .default) { (action) in
 
            let result = Int(alertControllerOfAddition.textFields![0].text!)! + Int(alertControllerOfAddition.textFields![1].text!)!
            
            let alertControllerOfResult = UIAlertController(title: "Результат", message: "Ответ равен: \(result)", preferredStyle: .alert)
            let actionOfResult = UIAlertAction(title: "Выйти", style: .cancel) { (action) in
            
                
                self.additionButton.isHidden = false
                self.numberGuessingButton.isHidden = false
                self.labelFullName.isHidden = false
                
            }
            
            alertControllerOfResult.addAction(actionOfResult)
            self.present(alertControllerOfResult, animated: true, completion: nil)
            
        }
        
        alertControllerOfAddition.addTextField { (textField) in
            textField.placeholder = "Первое число"
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.keyboardType = UIKeyboardType.numberPad
            
        }
        
        alertControllerOfAddition.addTextField { (textField) in
            textField.placeholder = "Второе число"
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.keyboardType = UIKeyboardType.numberPad
        }
        
        for textField in alertControllerOfAddition.textFields! {
            let container = textField.superview
            let effectView = container?.superview?.subviews[0]
            if (effectView != nil) {
                container?.backgroundColor = UIColor.clear
                effectView?.removeFromSuperview()
            }
        }
        
        alertControllerOfAddition.addAction(actionOfAddition)
        self.present(alertControllerOfAddition, animated: true, completion: nil)
        
    }
    
    //Алерт угадывания числа
    @objc func numberGuessing(sender: UIButton!) {
   
        self.additionButton.isHidden = true
        self.numberGuessingButton.isHidden = true
        self.labelFullName.isHidden = true

        let randomInt = Int.random(in: 0...10)

        let alertControllerOfNumberGuessing = UIAlertController(title: "Компьютер загадал число", message: "Попробуйте его угадать. Введите число от 0 до 10", preferredStyle: .alert)

        let actionOfNumberGuessing = UIAlertAction(title: "Сравнить числа", style: .default) { (action) in
            
            var answer: String = ""
            
            if randomInt == Int(alertControllerOfNumberGuessing.textFields![0].text!) {
                answer = " угадали!"
            } else {
                answer = " не угадали :( Попробуйте еще раз"

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
        self.present(alertControllerOfNumberGuessing, animated: true, completion: nil)
        
        
        for textField in alertControllerOfNumberGuessing.textFields! {
            let container = textField.superview
            let effectView = container?.superview?.subviews[0]
            if (effectView != nil) {
                container?.backgroundColor = UIColor.clear
                effectView?.removeFromSuperview()
            }
        }
    }
}




