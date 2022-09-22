import UIKit

final class InfoViewController: UIViewController {
  // MARK: - Private Properties
  private let navigationItemLabel = UILabel()
  private let fullNameLabel = UILabel()
  private let fullNameTextField = UITextField()
  private let adressLabel = UILabel()
  private let adressTextField = UITextField()
  private let deliveryLabel = UILabel()
  private let prepaymentLabel = UILabel()
  private let switch1 = UISwitch()
  private let switch2 = UISwitch()
  private let billButton = UIButton(type: .system)
  
  // MARK: - Public Properties
  var color = String()
  var size = String()
  var image = UIImage()
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupNavigationController() {
    navigationItemLabel.text = "Заполнение данных"
    navigationItemLabel.font = UIFont(name: "Menlo-Bold", size: 20)
    navigationItem.titleView = navigationItemLabel
  }
  
  private func setupFullNameLabel() {
    fullNameLabel.frame = CGRect(x: 35, y: 155, width: 80, height: 30)
    fullNameLabel.textAlignment = .center
    fullNameLabel.text = "ФИО"
    fullNameLabel.font = .systemFont(ofSize: 16, weight: .bold)
    fullNameLabel.textColor = .black
  }
  
  private func setupFullNameTextField() {
    fullNameTextField.frame = CGRect(x: 56, y: 190, width: 300, height: 30)
    fullNameTextField.contentVerticalAlignment = .center
    fullNameTextField.textAlignment = .left
    fullNameTextField.delegate = self
    fullNameTextField.placeholder = "Введите ФИО"
    fullNameTextField.layer.addSublayer(bottomLine(textFiled: fullNameTextField))
  }
  
  private func setupAdressLabel() {
    adressLabel.frame = CGRect(x: 32, y: 255, width: 100, height: 30)
    adressLabel.textAlignment = .center
    adressLabel.text = "Адрес"
    adressLabel.font = .systemFont(ofSize: 16, weight: .bold)
    adressLabel.textColor = .black
  }
  
  private func setupAdressTextField() {
    adressTextField.frame = CGRect(x: 58, y: 290, width: 300, height: 30)
    adressTextField.contentVerticalAlignment = .center
    adressTextField.textAlignment = .left
    adressTextField.delegate = self
    adressTextField.placeholder = "Введите адрес"
    adressTextField.layer.addSublayer(bottomLine(textFiled: adressTextField))
  }
  
  private func setupDeliveryLabel() {
    deliveryLabel.frame = CGRect(x: 60, y: 380, width: 170, height: 30)
    deliveryLabel.textAlignment = .center
    deliveryLabel.text = "Доставка до двери?"
    deliveryLabel.font = .systemFont(ofSize: 16, weight: .bold)
    deliveryLabel.textColor = .black
  }
  
  private func setupPrepaymentLabel() {
    prepaymentLabel.frame = CGRect(x: 45, y: 445, width: 150, height: 30)
    prepaymentLabel.textAlignment = .center
    prepaymentLabel.text = "Предоплата?"
    prepaymentLabel.font = .systemFont(ofSize: 16, weight: .bold)
    prepaymentLabel.textColor = .black
  }
  
  private func setupSwitch1() {
    switch1.frame = CGRect.init(x: 295, y: 383, width: 0, height: 0)
  }
  
  private func setupSwitch2() {
    switch2.frame = CGRect.init(x: 295, y: 445, width: 0, height: 0)
  }
  
  private func setupBillButton() {
    billButton.frame = CGRect(x: 60, y: 750, width: 295, height: 50)
    billButton.backgroundColor = .systemBlue
    billButton.setTitle("Перейти к оплате", for: .normal)
    billButton.layer.cornerRadius = 10
    billButton.tintColor = .white
    billButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
  }
  
  // MARK: - Private Methods
  private func setupView() {
    hideKeyboardWhenTappedAround()
    setupFullNameLabel()
    setupFullNameTextField()
    setupAdressLabel()
    setupAdressTextField()
    setupDeliveryLabel()
    setupPrepaymentLabel()
    setupSwitch1()
    setupSwitch2()
    setupBillButton()
    addSubviews()
    setupSelfView()
    addTarget()
    setupNavigationController()
  }
  
  private func addSubviews() {
    view.addSubview(fullNameLabel)
    view.addSubview(fullNameTextField)
    view.addSubview(adressLabel)
    view.addSubview(adressTextField)
    view.addSubview(deliveryLabel)
    view.addSubview(prepaymentLabel)
    view.addSubview(switch1)
    view.addSubview(switch2)
    view.addSubview(billButton)
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  private func addTarget() {
    billButton.addTarget(self, action: #selector(billAlert), for: .touchUpInside)
  }
  
  @objc private func billAlert() {
    let alertControllerOfBill = UIAlertController(title: "Перейти к оплате", message: "", preferredStyle: .alert)
    let actionOfBill = UIAlertAction(title: "Оплата", style: .default) { action in
      let billViewController = BillViewController()
      billViewController.image = self.image
      billViewController.color = self.color
      billViewController.size = self.size
      self.navigationController?.pushViewController(billViewController, animated: true)
    }
    let actionOfCancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
    }
    alertControllerOfBill.addAction(actionOfBill)
    alertControllerOfBill.addAction(actionOfCancel)
    self.present(alertControllerOfBill, animated: true, completion: nil)
  }
}

extension UIViewController {
  
  func bottomLine(textFiled: UITextField) -> CALayer {
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0, y: textFiled.frame.height + 5, width: textFiled.frame.width, height: 2)
    bottomLine.backgroundColor = UIColor.init(red: 190/255, green: 190/255, blue: 190/255, alpha: 0.3).cgColor
    return bottomLine
  }
}


extension InfoViewController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
    return false
  }
}



