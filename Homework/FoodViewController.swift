import UIKit

final class FoodViewController: UIViewController {
  // MARK: - Private Properties
  private let pizzaButton = UIButton(type: .system)
  private let sushiButton = UIButton(type: .system)
  
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
  
  private func setupPizzaButton() {
    pizzaButton.frame = CGRect(x: 20, y: 150, width: 374, height: 150)
    pizzaButton.setTitle("Пицца", for: .normal)
    pizzaButton.tintColor = .black
  }
  
  private func setupSushiButton() {
    sushiButton.frame = CGRect(x: 20, y: 350, width: 374, height: 150)
    sushiButton.setTitle("Суши", for: .normal)
    sushiButton.tintColor = .black
  }
  
  private func setupLines() {
    let point1 = CGPoint(x: 20, y: 150)
    let point2 = CGPoint(x: 394, y: 150)
    let point3 = CGPoint(x: 20, y: 300)
    let point4 = CGPoint(x: 394, y: 300)
    let point5 = CGPoint(x: 20, y: 150)
    let point6 = CGPoint(x: 20, y: 300)
    let point7 = CGPoint(x: 394, y: 150)
    let point8 = CGPoint(x: 394, y: 300)
    let point9 = CGPoint(x: 20, y: 350)
    let point10 = CGPoint(x: 394, y: 350)
    let point11 = CGPoint(x: 20, y: 500)
    let point12 = CGPoint(x: 394, y: 500)
    let point13 = CGPoint(x: 20, y: 350)
    let point14 = CGPoint(x: 20, y: 500)
    let point15 = CGPoint(x: 394, y: 350)
    let point16 = CGPoint(x: 394, y: 500)
    drawLine(start: point1, toPoint: point2, ofColor: .lightGray, inView: self.view)
    drawLine(start: point3, toPoint: point4, ofColor: .lightGray, inView: self.view)
    drawLine(start: point5, toPoint: point6, ofColor: .lightGray, inView: self.view)
    drawLine(start: point7, toPoint: point8, ofColor: .lightGray, inView: self.view)
    drawLine(start: point9, toPoint: point10, ofColor: .red, inView: self.view)
    drawLine(start: point11, toPoint: point12, ofColor: .red, inView: self.view)
    drawLine(start: point13, toPoint: point14, ofColor: .red, inView: self.view)
    drawLine(start: point15, toPoint: point16, ofColor: .red, inView: self.view)
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupNavigationController()
    hideBackButton()
    setupPizzaButton()
    setupSushiButton()
    setupLines()
    addSubviews()
    setupSelfView()
    addTarget()
  }
  
  private func addSubviews() {
    view.addSubview(pizzaButton)
    view.addSubview(sushiButton)
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
    title = "Food"
  }
  
  private func addTarget() {
    pizzaButton.addTarget(self, action: #selector(toPizzaViewController), for: .touchUpInside)
  }
  
  @objc private func toPizzaViewController() {
    let pizzaViewController = PizzaViewController()
    navigationController?.pushViewController(pizzaViewController, animated: true)
  }
}



