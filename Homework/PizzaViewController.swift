import UIKit

final class PizzaViewController: UIViewController {
  // MARK: - Private Properties
  private let margaritaImageView = UIImageView()
  private let pepperoniImageView = UIImageView()
  private let margaritaLabel = UILabel()
  private let pepperoniLabel = UILabel()
  private let margaritaButton = UIButton(type: .system)
  private let pepperoniButton = UIButton(type: .system)
  
  private let margaritaImage = UIImage(named: "margarita")
  private let pepperoniImage = UIImage(named: "pepperoni")
  
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
  
  private func setupMargaritaImageView() {
    margaritaImageView.frame = CGRect(x: 30, y: 190, width: 110, height: 110)
    margaritaImageView.image = margaritaImage
  }
  
  private func setupMargaritaLabel() {
    margaritaLabel.frame = CGRect(x: 150, y: 230, width: 150, height: 30)
    margaritaLabel.textAlignment = .center
    margaritaLabel.text = "Маргарита"
    margaritaLabel.font = .systemFont(ofSize: 25, weight: .bold)
  }
  
  private func setupMargaritaButton() {
    margaritaButton.frame = CGRect(x: 325, y: 222, width: 50, height: 50)
    margaritaButton.backgroundColor = .orange
    margaritaButton.setTitle("+", for: .normal)
    margaritaButton.layer.cornerRadius = 10
    margaritaButton.tintColor = .white
    margaritaButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .heavy)
  }
  
  private func setupPepperoniImageView() {
    pepperoniImageView.frame = CGRect(x: 30, y: 360, width: 120, height: 120)
    pepperoniImageView.image = pepperoniImage
  }
  
  private func setupPepperoniLabel() {
    pepperoniLabel.frame = CGRect(x: 155, y: 400, width: 150, height: 30)
    pepperoniLabel.textAlignment = .center
    pepperoniLabel.text = "Пепперони"
    pepperoniLabel.font = .systemFont(ofSize: 25, weight: .bold)
  }
  
  private func setupPepperoniButton() {
    pepperoniButton.frame = CGRect(x: 325, y: 392, width: 50, height: 50)
    pepperoniButton.backgroundColor = .orange
    pepperoniButton.setTitle("+", for: .normal)
    pepperoniButton.layer.cornerRadius = 10
    pepperoniButton.tintColor = .white
    pepperoniButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .heavy)
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupNavigationController()
    setupMargaritaImageView()
    setupMargaritaLabel()
    setupMargaritaButton()
    setupPepperoniImageView()
    setupPepperoniLabel()
    setupPepperoniButton()
    showBackButton()
    addSubviews()
    setupSelfView()
    addTarget()
  }
  
  private func addSubviews() {
    view.addSubview(margaritaImageView)
    view.addSubview(margaritaLabel)
    view.addSubview(margaritaButton)
    view.addSubview(pepperoniImageView)
    view.addSubview(pepperoniLabel)
    view.addSubview(pepperoniButton)
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
    title = "Pizza"
  }
  
  private func addTarget() {
    margaritaButton.addTarget(self, action: #selector(sendMargarita), for: .touchUpInside)
    pepperoniButton.addTarget(self, action: #selector(sendPepperoni), for: .touchUpInside)
  }
  
  @objc private func goBack() {
    navigationController?.popViewController(animated: true)
  }
  
  @objc private func sendMargarita() {
    guard let label = margaritaLabel.text else { return }
    guard let image = margaritaImage else { return }
    toIngredientsPizzaViewController(label: label, image: image)
  }
  
  @objc private func sendPepperoni() {
    guard let label = pepperoniLabel.text else { return }
    guard let image = pepperoniImage else { return }
    toIngredientsPizzaViewController(label: label, image: image)
  }
  
  private func toIngredientsPizzaViewController(label: String, image: UIImage) {
    let ingredientsPizzaViewController = IngredientsPizzaViewController()
    ingredientsPizzaViewController.label = label
    ingredientsPizzaViewController.image = image
    navigationController?.pushViewController(ingredientsPizzaViewController, animated: true)
  }
}


