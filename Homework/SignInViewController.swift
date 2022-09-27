import UIKit

final class SignInViewController: UIViewController {
  // MARK: - Private Properties
  private let imageView = UIImageView()
  private let phoneNumber = UILabel()
  private let phoneNumberTextField = UITextField()
  private let passwordLabel = UILabel()
  private let passwordTextField = UITextField()
  private let eyeButton = UIButton()
  private let enterWithFaceIDLabel = UILabel()
  private let switch1 = UISwitch()
  private let enterButton = UIButton(type: .system)
  
  private let icon = UIImage(named: "bringo")
  
  // MARK: - UIViewController()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupImageView() {
    imageView.frame = CGRect(x: 117, y: 100, width: 180, height: 180)
    imageView.image = icon
  }
  
  private func setupPhoneNumber() {
    phoneNumber.frame = CGRect(x: 54, y: 305, width: 120, height: 30)
    phoneNumber.textAlignment = .left
    phoneNumber.text = "Phone number"
    phoneNumber.font = .systemFont(ofSize: 17, weight: .bold)
    phoneNumber.textColor = .systemBlue
  }
  
  private func setupPhoneNumberTextField() {
    phoneNumberTextField.frame = CGRect(x: 56, y: 340, width: 300, height: 30)
    phoneNumberTextField.keyboardType = .phonePad
    phoneNumberTextField.contentVerticalAlignment = .center
    phoneNumberTextField.textAlignment = .left
    phoneNumberTextField.placeholder = "Phone number"
    phoneNumberTextField.layer.addSublayer(bottomLine(textFiled: phoneNumberTextField))
    phoneNumberTextField.textColor = .black
    phoneNumberTextField.delegate = self
  }
  
  private func setupPasswordLabel() {
    passwordLabel.frame = CGRect(x: 35, y: 400, width: 120, height: 30)
    passwordLabel.textAlignment = .center
    passwordLabel.text = "Password"
    passwordLabel.font = .systemFont(ofSize: 17, weight: .bold)
    passwordLabel.textColor = .systemBlue
  }
  
  private func setupPasswordTextField() {
    passwordTextField.frame = CGRect(x: 56, y: 430, width: 300, height: 30)
    passwordTextField.contentVerticalAlignment = .center
    passwordTextField.textAlignment = .left
    passwordTextField.placeholder = "Password"
    passwordTextField.isSecureTextEntry = true
    passwordTextField.rightViewMode = .unlessEditing
    passwordTextField.clearsOnBeginEditing = false
    passwordTextField.rightView = eyeButton
    passwordTextField.rightViewMode = .always
    passwordTextField.layer.addSublayer(bottomLine(textFiled: passwordTextField))
    passwordTextField.textColor = .black
    passwordTextField.delegate = self
  }
  
  private func setupEyeButton() {
    eyeButton.frame = CGRect(x: CGFloat(passwordTextField.frame.size.width), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
    eyeButton.setImage(UIImage(named: "eye_closed"), for: .normal)
  }
  
  private func setupEnterWithFaceIDLabel() {
    enterWithFaceIDLabel.frame = CGRect(x: 140, y: 515, width: 160, height: 30)
    enterWithFaceIDLabel.textAlignment = .center
    enterWithFaceIDLabel.text = "Вход по Face ID"
    enterWithFaceIDLabel.font = .systemFont(ofSize: 15, weight: .bold)
    enterWithFaceIDLabel.textColor = .black
  }
  
  private func setupSwitch1() {
    switch1.frame = CGRect.init(x: 300, y: 515, width: 0, height: 0)
  }
  
  private func setupEnterButton() {
    enterButton.frame = CGRect(x: 60, y: 600, width: 295, height: 50)
    enterButton.backgroundColor = .systemBlue
    enterButton.setTitle("Войти", for: .normal)
    enterButton.layer.cornerRadius = 10
    enterButton.tintColor = .white
    enterButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .heavy)
  }
  
  private func bottomLine(textFiled: UITextField) -> CALayer {
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0, y: textFiled.frame.height + 5, width: textFiled.frame.width, height: 2)
    bottomLine.backgroundColor = UIColor.init(red: 190/255, green: 190/255, blue: 190/255, alpha: 0.3).cgColor
    return bottomLine
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupImageView()
    setupPhoneNumber()
    setupPhoneNumberTextField()
    setupPasswordLabel()
    setupPasswordTextField()
    setupEyeButton()
    setupEnterWithFaceIDLabel()
    setupSwitch1()
    setupEnterButton()
    addSubviews()
    addTarget()
    setupSelfView()
    hideKeyboardWhenTappedAround()
  }
  
  private func addSubviews() {
    view.addSubview(imageView)
    view.addSubview(phoneNumber)
    view.addSubview(phoneNumberTextField)
    view.addSubview(passwordLabel)
    view.addSubview(passwordTextField)
    view.addSubview(eyeButton)
    view.addSubview(enterWithFaceIDLabel)
    view.addSubview(switch1)
    view.addSubview(enterButton)
  }
  
  private func addTarget() {
    eyeButton.addTarget(self, action: #selector(buttonPasswordVisiblityClicked), for: .touchUpInside)
    enterButton.addTarget(self, action: #selector(toFoodViewController), for: .touchUpInside)
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  
  @objc private func buttonPasswordVisiblityClicked(_ sender: UIButton) {
    sender.isSelected.toggle()
    if sender.isSelected {
      passwordTextField.isSecureTextEntry = false
      eyeButton.setImage(UIImage(named: "eye_open"), for: .normal)
    } else {
      passwordTextField.isSecureTextEntry = true
      eyeButton.setImage(UIImage(named: "eye_closed"), for: .normal)
    }
  }
  
  @objc private func toFoodViewController() {
    guard let phoneText = phoneNumberTextField.text else { return }
    guard let passwordText = passwordTextField.text else { return }
    if phoneText.isEmpty && passwordText.isEmpty {
      let message = "Введите телефон и пароль"
      alert(alertText: nil, alertMessage: message, alertAction: nil)
    } else if phoneText.isEmpty {
      let message = "Введите телефон"
      alert(alertText: nil, alertMessage: message, alertAction: nil)
    } else if passwordText.isEmpty {
      let message =  "Введите пароль"
      alert(alertText: nil, alertMessage: message, alertAction: nil)
    }
    else {
      let foodViewController = FoodViewController()
      navigationController?.pushViewController(foodViewController, animated: true)
    }
  }
}

extension UIViewController {
  
  func drawLine(start: CGPoint, toPoint end: CGPoint, ofColor lineColor: UIColor, inView view: UIView) {
    let path = UIBezierPath()
    path.move(to: start)
    path.addLine(to: end)
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    shapeLayer.strokeColor = lineColor.cgColor
    shapeLayer.lineWidth = 1.3
    view.layer.addSublayer(shapeLayer)
  }
  
  func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc private func dismissKeyboard() {
    view.endEditing(true)
  }
  
  func hideBackButton() {
    navigationItem.hidesBackButton = true
  }
  
  func showBackButton() {
    navigationItem.hidesBackButton = false
  }
  
  func alert(alertText : String?, alertMessage : String, alertAction: ((UIAlertAction) -> Void)?) {
    let alertController = UIAlertController(title: alertText, message: alertMessage, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .cancel, handler: alertAction)
    alertController.addAction(action)
    present(alertController, animated: true, completion: nil)
  }
}

extension UIViewController: UITextFieldDelegate {
  
  public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
    return false
  }
}






















