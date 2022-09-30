import UIKit

final class IngredientsPizzaViewController: UIViewController {
  // MARK: - Private Properties
  private let pizzaLabel = UILabel()
  private let pizzaImageView = UIImageView()
  private let cheeseLabel = UILabel()
  private let switch1 = UISwitch()
  private let hamLabel = UILabel()
  private let switch2 = UISwitch()
  private let mushroomsLabel = UILabel()
  private let switch3 = UISwitch()
  private let olivesLabel = UILabel()
  private let switch4 = UISwitch()
  private let chooseButton = UIButton(type: .system)
  
  private var swtch1 = "(не добавлено)"
  private var swtch2 = "(не добавлено)"
  private var swtch3 = "(не добавлено)"
  private var swtch4 = "(не добавлено)"
  
  // MARK: - Public Properties
  var label = String()
  var image = UIImage()
  
  // MARK: - UIViewController()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupNavigationController() {
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                       style: .plain,
                                                       target: self,
                                                       action: nil)
    navigationItem.backBarButtonItem?.tintColor = .black
  }
  
  private func setupPizzaLabel() {
    pizzaLabel.text = label
    pizzaLabel.frame = CGRect(x: 75, y: 50, width: 267, height: 50)
    pizzaLabel.textAlignment = .center
    pizzaLabel.font = .systemFont(ofSize: 45, weight: .medium)
  }
  
  private func setupPizzaImageView() {
    pizzaImageView.frame = CGRect(x: 30, y: 130, width: 357, height: 357)
    pizzaImageView.image = image
  }
  
  private func setupCheeseLabel() {
    cheeseLabel.frame = CGRect(x: 60, y: 520, width: 120, height: 50)
    cheeseLabel.textAlignment = .center
    cheeseLabel.text = "Моцарелла"
    cheeseLabel.font = .systemFont(ofSize: 20, weight: .bold)
  }
  
  private func setup1Switch() {
    switch1.frame = CGRect(x: 300, y: 530, width: 0, height: 0)
  }
  
  private func setupHamLabel() {
    hamLabel.frame = CGRect(x: 54, y: 570, width: 100, height: 50)
    hamLabel.textAlignment = .center
    hamLabel.text = "Ветчина"
    hamLabel.font = .systemFont(ofSize: 20, weight: .bold)
  }
  
  private func setup2Switch() {
    switch2.frame = CGRect(x: 300, y: 580, width: 0, height: 0)
    swtch2 = switchChoice(currentSwitch: switch2)
  }
  
  private func setupMushroomsLabel() {
    mushroomsLabel.frame = CGRect(x: 46, y: 620, width: 100, height: 50)
    mushroomsLabel.textAlignment = .center
    mushroomsLabel.text = "Грибы"
    mushroomsLabel.font = .systemFont(ofSize: 20, weight: .bold)
  }
  
  private func setup3Switch() {
    switch3.frame = CGRect(x: 300, y: 630, width: 0, height: 0)
    swtch3 = switchChoice(currentSwitch: switch3)
    
  }
  
  private func setupOlivesLabel() {
    olivesLabel.frame = CGRect(x: 60, y: 670, width: 100, height: 50)
    olivesLabel.textAlignment = .center
    olivesLabel.text = "Маслины"
    olivesLabel.font = .systemFont(ofSize: 20, weight: .bold)
  }
  
  private func setup4Switch() {
    switch4.frame = CGRect(x: 300, y: 680, width: 0, height: 0)
    swtch4 = switchChoice(currentSwitch: switch4)
  }
  
  private func setupChooseButton() {
    chooseButton.frame = CGRect(x: 60, y: 750, width: 300, height: 50)
    chooseButton.backgroundColor = .orange
    chooseButton.setTitle("Выбрать", for: .normal)
    chooseButton.layer.cornerRadius = 10
    chooseButton.tintColor = .white
    chooseButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .heavy)
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupNavigationController()
    showBackButton()
    setupPizzaLabel()
    setupPizzaImageView()
    setupCheeseLabel()
    setup1Switch()
    setupHamLabel()
    setup2Switch()
    setupMushroomsLabel()
    setup3Switch()
    setupOlivesLabel()
    setup4Switch()
    setupChooseButton()
    addSubviews()
    setupSelfView()
    addTarget()
  }
  
  private func addSubviews() {
    view.addSubview(pizzaLabel)
    view.addSubview(pizzaImageView)
    view.addSubview(cheeseLabel)
    view.addSubview(switch1)
    view.addSubview(hamLabel)
    view.addSubview(switch2)
    view.addSubview(mushroomsLabel)
    view.addSubview(switch3)
    view.addSubview(olivesLabel)
    view.addSubview(switch4)
    view.addSubview(chooseButton)
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  private func addTarget() {
    chooseButton.addTarget(self, action: #selector(toPayViewController), for: .touchUpInside)
    switch1.addTarget(self, action: #selector(swtch1Action), for: .touchUpInside)
    switch2.addTarget(self, action: #selector(swtch2Action), for: .touchUpInside)
    switch3.addTarget(self, action: #selector(swtch3Action), for: .touchUpInside)
    switch4.addTarget(self, action: #selector(swtch4Action), for: .touchUpInside)
  }
  
  @objc private func swtch1Action() {
    swtch1 = switchChoice(currentSwitch: switch1)
  }
  @objc private func swtch2Action() {
    swtch2 = switchChoice(currentSwitch: switch2)
  }
  @objc private func swtch3Action() {
    swtch3 = switchChoice(currentSwitch: switch3)
  }
  @objc private func swtch4Action() {
    swtch4 = switchChoice(currentSwitch: switch4)
  }
  
  private func switchChoice(currentSwitch: UISwitch) -> String {
    let choice = currentSwitch.isOn ? "(добавлено)" : "(не добавлено)"
    return choice
  }
  
  @objc private func toPayViewController() {
    let payView = PayViewController()
    payView.pizza = label
    payView.cheese = swtch1
    payView.ham = swtch2
    payView.mashrooms = swtch3
    payView.olives = swtch4
    navigationController?.pushViewController(payView, animated: true)
  }
}

