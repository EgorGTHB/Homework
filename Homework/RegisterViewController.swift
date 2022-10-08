import UIKit

final class RegisterViewController: UIViewController {
  // MARK: - Private Properties
  private let nameTextField = UITextField()
  private let emailTextField = UITextField()
  private let phoneNumberTextField = UITextField()
  private let passwordTextField = UITextField()
  private let registerButton = UIButton(type: .system)
  private let enterButton = UIButton(type: .system)
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupNavigationController() {
    title = "Регистрация"
    navigationItem.hidesBackButton = true
  }
  
  private func setupNameTextField() {
    nameTextField.frame = CGRect(x: 20, y: 250, width: 374, height: 31)
    nameTextField.borderStyle = .roundedRect
    nameTextField.contentVerticalAlignment = .center
    nameTextField.textAlignment = .left
    nameTextField.placeholder = "Имя"
    nameTextField.delegate = self
    nameTextField.clearButtonMode = .whileEditing
  }
  
  private func setupEmailTextField() {
    emailTextField.frame = CGRect(x: 20, y: 300, width: 374, height: 31)
    emailTextField.borderStyle = .roundedRect
    emailTextField.contentVerticalAlignment = .center
    emailTextField.textAlignment = .left
    emailTextField.placeholder = "Email"
    emailTextField.delegate = self
    emailTextField.clearButtonMode = .whileEditing
    emailTextField.keyboardType = .emailAddress
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
    registerButton.setTitle("Зарегистрироваться", for: .normal)
    registerButton.setTitleColor(UIColor(red: 253/255, green: 181/255, blue: 28/255, alpha: 1), for: .normal)
    registerButton.backgroundColor = .black
    registerButton.frame = CGRect(x: 20, y: 450, width: 374, height: 40)
    registerButton.titleLabel?.font = .systemFont(ofSize: 20)
    registerButton.layer.cornerRadius = 8
  }
  
  private func setupEnterButton() {
    enterButton.setTitle("Уже зарегистрированы?", for: .normal)
    enterButton.setTitleColor(.black, for: .normal)
    enterButton.frame = CGRect(x: 92, y: 500, width: 230, height: 40)
    enterButton.titleLabel?.font = .systemFont(ofSize: 20)
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupNavigationController()
    setupNameTextField()
    setupEmailTextField()
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
    [nameTextField, emailTextField, phoneNumberTextField, passwordTextField, registerButton, enterButton].forEach {
      view.addSubview($0)
    }
  }
  
  private func setupNotificationCenter() {
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { _ in
      self.view.frame.origin.y = -50
    }
    NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { _ in
      self.view.frame.origin.y = 0.0
    }
  }
  
  private func addTarget() {
    enterButton.addTarget(self, action: #selector(toSignInViewController), for: .touchUpInside)
    registerButton.addTarget(self, action: #selector(toLoseWeightViewController), for: .touchUpInside)
  }
  
  @objc private func toSignInViewController() {
    let signInViewController = SignInViewController()
    self.navigationController?.pushViewController(signInViewController, animated: true)
  }
  
  @objc private func toLoseWeightViewController() {
    let loseWeightViewController = LoseWeightViewController()
    self.navigationController?.pushViewController(loseWeightViewController, animated: true)
  }
}

extension RegisterViewController: UITextFieldDelegate {
  
  public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    switch textField {
    case nameTextField:
      emailTextField.becomeFirstResponder()
    case emailTextField:
      phoneNumberTextField.becomeFirstResponder()
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



