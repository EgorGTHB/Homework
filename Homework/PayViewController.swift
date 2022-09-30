import UIKit

final class PayViewController: UIViewController {
  // MARK: - Private Properties
  private let yourOrderLabel = UILabel()
  private let extra1Label = UILabel()
  private let extra2Label = UILabel()
  private let extra3Label = UILabel()
  private let extra4Label = UILabel()
  private let extra5Label = UILabel()
  private let cardLabel = UILabel()
  private let switch1 = UISwitch()
  private let cashLabel = UILabel()
  private let switch2 = UISwitch()
  private let payButton = UIButton(type: .system)
  
  // MARK: - Public Properties
  var pizza = String()
  var cheese = String()
  var ham = String()
  var mashrooms = String()
  var olives = String()
  
  // MARK: - UIViewController()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupNavigationController() {
    hideBackButton()
    title = "Оплата"
  }
  
  private func setupYourOrderLabel() {
    yourOrderLabel.frame = CGRect(x: 20, y: 100, width: 130, height: 50)
    yourOrderLabel.textAlignment = .center
    yourOrderLabel.text = "Ваш заказ:"
    yourOrderLabel.font = .systemFont(ofSize: 25, weight: .medium)
  }
  
  private func setupExtra1Label() {
    extra1Label.frame = CGRect(x: 20, y: 150, width: 150, height: 50)
    extra1Label.textAlignment = .left
    extra1Label.text = "1. \(pizza)"
    extra1Label.font = .systemFont(ofSize: 23, weight: .medium)
  }
  
  private func setupExtra2Label() {
    extra2Label.frame = CGRect(x: 20, y: 200, width: 300, height: 50)
    extra2Label.textAlignment = .left
    extra2Label.text = "2. Ветчина \(ham)"
    extra2Label.font = .systemFont(ofSize: 23, weight: .medium)
  }
  
  private func setupExtra3Label() {
    extra3Label.frame = CGRect(x: 20, y: 250, width: 320, height: 50)
    extra3Label.textAlignment = .left
    extra3Label.text = "3. Моцарелла \(cheese)"
    extra3Label.font = .systemFont(ofSize: 23, weight: .medium)
  }
  
  private func setupExtra4Label() {
    extra4Label.frame = CGRect(x: 20, y: 300, width: 270, height: 50)
    extra4Label.textAlignment = .left
    extra4Label.text = "4. Грибы \(mashrooms)"
    extra4Label.font = .systemFont(ofSize: 23, weight: .medium)
  }
  
  private func setupExtra5Label() {
    extra5Label.frame = CGRect(x: 20, y: 350, width: 300, height: 50)
    extra5Label.textAlignment = .left
    extra5Label.text = "5. Маслины \(olives)"
    extra5Label.font = .systemFont(ofSize: 23, weight: .medium)
  }
  
  private func setupCardLabel() {
    cardLabel.frame = CGRect(x: 60, y: 590, width: 200, height: 50)
    cardLabel.textAlignment = .center
    cardLabel.text = "Оплата картой"
    cardLabel.font = .systemFont(ofSize: 27, weight: .medium)
    cardLabel.textColor = .darkGray
  }
  
  private func setup1Switch() {
    switch1.frame = CGRect(x: 300, y: 600, width: 0, height: 0)
    switch1.isOn = true
  }
  
  private func setupCashLabel() {
    cashLabel.frame = CGRect(x: 60, y: 650, width: 170, height: 50)
    cashLabel.textAlignment = .center
    cashLabel.text = "Наличными"
    cashLabel.font = .systemFont(ofSize: 27, weight: .medium)
    cashLabel.textColor = .darkGray
  }
  
  private func setup2Switch() {
    switch2.frame = CGRect(x: 300, y: 660, width: 0, height: 0)
  }
  
  private func setupPayButton() {
    payButton.frame = CGRect(x: 60, y: 750, width: 300, height: 55)
    payButton.backgroundColor = .black
    payButton.setTitle("Pay", for: .normal)
    payButton.layer.cornerRadius = 7
    payButton.tintColor = .white
    payButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupNavigationController()
    setupYourOrderLabel()
    setupExtra1Label()
    setupExtra2Label()
    setupExtra3Label()
    setupExtra4Label()
    setupExtra5Label()
    setupCardLabel()
    setup1Switch()
    setupCashLabel()
    setup2Switch()
    setupPayButton()
    addSubviews()
    setupSelfView()
    addTarget()
  }
  
  private func addSubviews() {
    view.addSubview(yourOrderLabel)
    view.addSubview(extra1Label)
    view.addSubview(extra2Label)
    view.addSubview(extra3Label)
    view.addSubview(extra4Label)
    view.addSubview(extra5Label)
    view.addSubview(cardLabel)
    view.addSubview(switch1)
    view.addSubview(cashLabel)
    view.addSubview(switch2)
    view.addSubview(payButton)
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  private func addTarget() {
    payButton.addTarget(self, action: #selector(applePay), for: .touchUpInside)
    switch1.addTarget(self, action: #selector(switch1Method), for: .touchUpInside)
    switch2.addTarget(self, action: #selector(switch2Method), for: .touchUpInside)
  }
  
  @objc private func switch1Method() {
    if switch1.isOn {
      switch2.isOn = false
    }
  }
  
  @objc private func switch2Method() {
    if switch2.isOn {
      switch1.isOn = false
    }
  }
  
  @objc private func applePay() {
    alert(alertText: "Заказ оплачен!", alertMessage: "Ваш заказ доставят в течении 15 минут! Приятного аппетита") { _ in
      let foodViewController = FoodViewController()
      self.navigationController?.pushViewController(foodViewController, animated: true)
    }
  }
}

