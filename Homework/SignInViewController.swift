import UIKit

final class SignInViewController: UIViewController {
  // MARK: - Private Properties
  private let appNameLabel = UILabel()
  private let signInLabel = UILabel()
  private let emailLabel = UILabel()
  private let emailTextField = UITextField()
  private let passwordLabel = UILabel()
  private let passwordTextField = UITextField()
  private let eyeButton = UIButton()
  private let enterWithFaceIDLabel = UILabel()
  private let switch1 = UISwitch()
  private let enterButton = UIButton(type: .system)
  
  // MARK: - UIViewController()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  private func setupAppNameLabel() {
    appNameLabel.frame = CGRect(x: 112, y: 120, width: 200, height: 30)
    appNameLabel.textAlignment = .center
    appNameLabel.text = "Birthday Reminder"
    appNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
    appNameLabel.textColor = .systemBlue
  }
  
  private func setupLines() {
    let pointOverButton1 = CGPoint(x: 90, y: 90)
    let pointOverButton2 = CGPoint(x: 330, y: 90)
    let pointUnderButton1 = CGPoint(x: 90, y: 180)
    let pointUnderButton2 = CGPoint(x: 330, y: 180)
    let pointLeftButton1 = CGPoint(x: 90, y: 90)
    let pointLeftButton2 = CGPoint(x: 90, y: 180)
    let pointRightButton1 = CGPoint(x: 330, y: 90)
    let pointRightButton2 = CGPoint(x: 330, y: 180)
    drawLine(start: pointOverButton1, toPoint: pointOverButton2, ofColor: .lightGray, inView: self.view)
    drawLine(start: pointUnderButton1, toPoint: pointUnderButton2, ofColor: .lightGray, inView: self.view)
    drawLine(start: pointLeftButton1, toPoint: pointLeftButton2, ofColor: .lightGray, inView: self.view)
    drawLine(start: pointRightButton1, toPoint: pointRightButton2, ofColor: .lightGray, inView: self.view)
  }
  
  private func setupSignInLabel() {
    signInLabel.frame = CGRect(x: 25, y: 250, width: 150, height: 50)
    signInLabel.textAlignment = .center
    signInLabel.text = "Sign In"
    signInLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    signInLabel.textColor = .black
  }
  
  private func setupEmailLabel() {
    emailLabel.frame = CGRect(x: 38, y: 305, width: 80, height: 30)
    emailLabel.textAlignment = .center
    emailLabel.text = "Email"
    emailLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    emailLabel.textColor = .systemBlue
  }
  
  private func setupEmailTextField() {
    emailTextField.frame = CGRect(x: 56, y: 340, width: 300, height: 30)
    emailTextField.contentVerticalAlignment = .center
    emailTextField.textAlignment = .left
    emailTextField.placeholder = "Email"
    emailTextField.layer.addSublayer(bottomLine(textFiled: emailTextField))
    emailTextField.textColor = .black
    emailTextField.delegate = self
  }
  
  private func setupPasswordLabel() {
    passwordLabel.frame = CGRect(x: 35, y: 400, width: 120, height: 30)
    passwordLabel.textAlignment = .center
    passwordLabel.text = "Password"
    passwordLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
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
    enterWithFaceIDLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
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
    enterButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
  }
  
  private func bottomLine(textFiled: UITextField) -> CALayer {
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0, y: textFiled.frame.height + 5, width: textFiled.frame.width, height: 2)
    bottomLine.backgroundColor = UIColor.init(red: 190/255, green: 190/255, blue: 190/255, alpha: 0.3).cgColor
    return bottomLine
  }
  
  // MARK: - Private Methods
  private func setupView() {
    addSubviews()
    addTarget()
    setupSelfView()
    hideKeyboardWhenTappedAround()
    setupAppNameLabel()
    setupLines()
    setupSignInLabel()
    setupEmailLabel()
    setupEmailTextField()
    setupPasswordLabel()
    setupPasswordTextField()
    setupEyeButton()
    setupEnterWithFaceIDLabel()
    setupSwitch1()
    setupEnterButton()
  }
  
  private func addSubviews() {
    view.addSubview(appNameLabel)
    view.addSubview(signInLabel)
    view.addSubview(emailLabel)
    view.addSubview(emailTextField)
    view.addSubview(passwordLabel)
    view.addSubview(passwordTextField)
    view.addSubview(eyeButton)
    view.addSubview(enterWithFaceIDLabel)
    view.addSubview(switch1)
    view.addSubview(enterButton)
  }
  
  private func addTarget() {
    eyeButton.addTarget(self, action: #selector(buttonPasswordVisiblityClicked), for: .touchUpInside)
    enterButton.addTarget(self, action: #selector(toListOfBirthdayViewController), for: .touchUpInside)
  }
  
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
  
  @objc private func toListOfBirthdayViewController() {
    let listOfBirthdaysViewController = ListOfBirthdaysViewController()
    navigationController?.pushViewController(listOfBirthdaysViewController, animated: true)
  }
  
  private func drawLine(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
    let path = UIBezierPath()
    path.move(to: start)
    path.addLine(to: end)
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    shapeLayer.strokeColor = lineColor.cgColor
    shapeLayer.lineWidth = 1.3
    view.layer.addSublayer(shapeLayer)
  }
}

extension SignInViewController {
  private func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignInViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  
  @objc private func dismissKeyboard() {
    view.endEditing(true)
  }
}

extension SignInViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
    return false
  }
}
