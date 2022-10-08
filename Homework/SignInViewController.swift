import UIKit

final class SignInViewController: UIViewController {
  // MARK: - Private Properties
  private let phoneNumberTextField = UITextField()
  private let passwordTextField = UITextField()
  private let registerButton = UIButton(type: .system)
  private let signInButton = UIButton(type: .system)
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupNavigationController() {
    title = "Вход в аккаунт"
    navigationItem.hidesBackButton = true
  }
  
  private func setupPhoneNumberTextField() {
    phoneNumberTextField.frame = CGRect(x: 20, y: 350, width: 374, height: 31)
    phoneNumberTextField.borderStyle = .roundedRect
    phoneNumberTextField.contentVerticalAlignment = .center
    phoneNumberTextField.textAlignment = .left
    phoneNumberTextField.placeholder = "Номер телефона"
    phoneNumberTextField.delegate = self
    phoneNumberTextField.clearButtonMode = .whileEditing
  }
  
  private func setupPasswordTextField() {
    passwordTextField.frame = CGRect(x: 20, y: 400, width: 374, height: 31)
    passwordTextField.borderStyle = .roundedRect
    passwordTextField.contentVerticalAlignment = .center
    passwordTextField.textAlignment = .left
    passwordTextField.placeholder = "Пароль"
    passwordTextField.delegate = self
    passwordTextField.clearButtonMode = .whileEditing
    passwordTextField.isSecureTextEntry = true
  }
  
  private func setupRegisterButton() {
    signInButton.setTitle("Войти", for: .normal)
    signInButton.setTitleColor(UIColor(red: 253/255, green: 181/255, blue: 28/255, alpha: 1), for: .normal)
    signInButton.backgroundColor = .black
    signInButton.frame = CGRect(x: 20, y: 450, width: 374, height: 40)
    signInButton.titleLabel?.font = .systemFont(ofSize: 20)
    signInButton.layer.cornerRadius = 8
  }
  
  private func setupEnterButton() {
    registerButton.setTitle("Еще не зарегистрированы?", for: .normal)
    registerButton.setTitleColor(.black, for: .normal)
    registerButton.frame = CGRect(x: 72, y: 500, width: 270, height: 40)
    registerButton.titleLabel?.font = .systemFont(ofSize: 20)
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupNavigationController()
    setupPhoneNumberTextField()
    setupPasswordTextField()
    setupRegisterButton()
    setupEnterButton()
    setupNotificationCenter()
    addSubviews()
    addTarget()
    setupSelfView()
  }
  
  private func addSubviews() {
    [phoneNumberTextField, passwordTextField, signInButton, registerButton].forEach {
      view.addSubview($0)
    }
  }
  
  private func setupNotificationCenter() {
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
      self.view.frame.origin.y = -50
    }
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
      self.view.frame.origin.y = 0.0
    }
  }
  
  private func addTarget() {
    registerButton.addTarget(self, action: #selector(toRegisterInViewController), for: .touchUpInside)
    signInButton.addTarget(self, action: #selector(toLoseWeightViewController), for: .touchUpInside)
  }
  
  @objc private func toRegisterInViewController() {
    let registerViewController = RegisterViewController()
    self.navigationController?.pushViewController(registerViewController, animated: true)
  }
  
  @objc private func toLoseWeightViewController() {
    let loseWeightViewController = LoseWeightViewController()
    self.navigationController?.pushViewController(loseWeightViewController, animated: true)
  }

}

extension SignInViewController: UITextFieldDelegate {
  
  public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    switch textField {
    case phoneNumberTextField:
      passwordTextField.becomeFirstResponder()
    case passwordTextField:
      passwordTextField.resignFirstResponder()
    default:
      textField.resignFirstResponder()
    }
    return true
  }
}



