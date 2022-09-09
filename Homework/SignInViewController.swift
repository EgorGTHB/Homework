import UIKit

final class SignInViewController: UIViewController {
  //Создание UIImageView cloudImageView
  private let cloudImageView = UIImageView()
  //Создание Image cloudImage
  private let cloudImage = UIImage(named: "cloudApple")
  //Создание лэйбла signInLabel
  private let signInLabel = UILabel()
  //Создание лэйбла emailLabel
  private let emailLabel = UILabel()
  //Создание текстового поля emailTextField
  private let emailTextField = UITextField()
  //Создание лэйбла passwordLabel
  private let passwordLabel = UILabel()
  //Создание текстового поля password
  private let passwordTextField = UITextField()
  //Создание кнопки eyeButton
  private let eyeButton = UIButton()
  //Создание кнопки enterButton
  private let enterButton = UIButton(type: .system)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    //Настройка UIImageView cloudImageView
    cloudImageView.image = cloudImage
    cloudImageView.frame = CGRect(x: 73, y: 50, width: 270, height: 216)
    view.addSubview(cloudImageView)
    //Настройка лэйбла signIn
    signInLabel.frame = CGRect(x: 25, y: 250, width: 150, height: 50)
    signInLabel.textAlignment = .center
    signInLabel.text = "Sign In"
    signInLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    signInLabel.textColor = .black
    view.addSubview(signInLabel)
    //Настройка лэйбла email
    emailLabel.frame = CGRect(x: 38, y: 305, width: 80, height: 30)
    emailLabel.textAlignment = .center
    emailLabel.text = "Email"
    emailLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    emailLabel.textColor = .systemPink
    view.addSubview(emailLabel)
    //Настройка textField email
    emailTextField.frame = CGRect(x: 56, y: 340, width: 300, height: 30)
    emailTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    emailTextField.textAlignment = .left
    emailTextField.placeholder = "Email"
    emailTextField.layer.addSublayer(bottomLine(textFiled: emailTextField))
    view.addSubview(emailTextField)
    //Настройка лэйбла пароля
    passwordLabel.frame = CGRect(x: 35, y: 400, width: 120, height: 30)
    passwordLabel.textAlignment = .center
    passwordLabel.text = "Password"
    passwordLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    passwordLabel.textColor = .systemPink
    view.addSubview(passwordLabel)
    //Настройка textField пароля
    passwordTextField.frame = CGRect(x: 56, y: 430, width: 300, height: 30)
    passwordTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    passwordTextField.textAlignment = .left
    passwordTextField.placeholder = "Password"
    passwordTextField.isSecureTextEntry = true
    passwordTextField.rightViewMode = .unlessEditing
    passwordTextField.clearsOnBeginEditing = false
    passwordTextField.rightView = eyeButton
    passwordTextField.rightViewMode = .always
    passwordTextField.layer.addSublayer(bottomLine(textFiled: passwordTextField))
    view.addSubview(passwordTextField)
    //Наcтройка кнопки глаза(безопасного текстового ввода)
    eyeButton.frame = CGRect(x: CGFloat(passwordTextField.frame.size.width), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
    eyeButton.setImage(UIImage(named: "eye_closed"), for: .normal)
    eyeButton.addTarget(self, action: #selector(buttonPasswordVisiblityClicked), for: .touchUpInside)
    view.addSubview(eyeButton)
    //Настройка кнопки входа
    enterButton.frame = CGRect(x: 60, y: 550, width: 295, height: 50)
    enterButton.backgroundColor = .systemPink
    enterButton.setTitle("Войти", for: .normal)
    enterButton.layer.cornerRadius = 10
    enterButton.tintColor = .white
    enterButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
    enterButton.addTarget(self, action: #selector(segueToInfoViewController), for: .touchUpInside)
    view.addSubview(enterButton)
  }
  
  //Функция отрисовки линии под лэйблом
  private func bottomLine(textFiled: UITextField) -> CALayer {
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0, y: textFiled.frame.height + 5, width: textFiled.frame.width, height: 2)
    bottomLine.backgroundColor = UIColor.init(red: 190/255, green: 190/255, blue: 190/255, alpha: 0.3).cgColor
    return bottomLine
  }
  
  //Функция, которая включает и выключает безопасный ввод текста пароля
  @objc private func buttonPasswordVisiblityClicked(_ sender: UIButton) {
    sender.isSelected = !sender.isSelected
    if sender.isSelected {
      passwordTextField.isSecureTextEntry = false
      eyeButton.setImage(UIImage(named: "eye_open"), for: .normal)
    } else {
      passwordTextField.isSecureTextEntry = true
      eyeButton.setImage(UIImage(named: "eye_closed"), for: .normal)
    }
  }
  
  //Создание перехода на InfoViewController
  @objc private func segueToInfoViewController() {
    let infoViewController = InfoViewController()
    navigationController?.pushViewController(infoViewController, animated: true)
  }
}



