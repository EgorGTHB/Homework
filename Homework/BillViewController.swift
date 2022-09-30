import UIKit

class BillViewController: UIViewController {
  // MARK: - Private Properties
  private let imageView = UIImageView()
  private let navigationItemLabel = UILabel()
  private let billImageView = UIImageView()
  private let priceLabel = UILabel()
  private let descriptionProductLabel = UILabel()
  private let colorProductNameLabel = UILabel()
  private let charityDescriptionLabel = UILabel()
  private let charityLabel = UILabel()
  private let charitySlider = UISlider()
  private let payButton = UIButton(type: .system)
  
  // MARK: - Public Properties
  var color = String()
  var size = String()
  var image = String()
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupNavigationController() {
    navigationItemLabel.text = "Оплата"
    navigationItemLabel.font = UIFont(name: "Menlo-Bold", size: 20)
    navigationItem.titleView = navigationItemLabel
  }
  
  private func setupImageView() {
    imageView.frame = CGRect(x: 20, y: 230, width: 170, height: 170)
    imageView.image = UIImage(named: image)
  }
  
  private func setupPriceLabel() {
    priceLabel.frame = CGRect(x: 195, y: 250, width: 170, height: 30)
    priceLabel.textAlignment = .center
    priceLabel.text = "Цена: 11990 рублей"
    priceLabel.font = .systemFont(ofSize: 16, weight: .bold)
    priceLabel.textColor = .black
  }
  
  private func setupDescriptionProductLabel() {
    descriptionProductLabel.frame = CGRect(x: 200, y: 290, width: 200, height: 50)
    descriptionProductLabel.textAlignment = .left
    descriptionProductLabel.text = "Кроссовки Adidas Spezial, \(size) размер"
    descriptionProductLabel.lineBreakMode = .byWordWrapping
    descriptionProductLabel.numberOfLines = 0
    descriptionProductLabel.font = .systemFont(ofSize: 16, weight: .bold)
    descriptionProductLabel.textColor = .black
  }
  
  private func setupColorProductNameLabel() {
    colorProductNameLabel.frame = CGRect(x: 180, y: 350, width: 150, height: 30)
    colorProductNameLabel.textAlignment = .center
    colorProductNameLabel.text = "Цвет: \(color)"
    colorProductNameLabel.font = .systemFont(ofSize: 16, weight: .bold)
    colorProductNameLabel.textColor = .gray
  }
  
  private func setupCharityDescriptionLabel() {
    charityDescriptionLabel.frame = CGRect(x: 20, y: 500, width: 374, height: 50)
    charityDescriptionLabel.textAlignment = .center
    charityDescriptionLabel.text = "Если вы хотите, вы можете выбрать сумму, которую хотите пожертвовать в благотворительный фонд"
    charityDescriptionLabel.lineBreakMode = .byWordWrapping
    charityDescriptionLabel.numberOfLines = 0
    charityDescriptionLabel.font = .systemFont(ofSize: 13, weight: .regular)
    charityDescriptionLabel.textColor = .black
  }
  
  private func setupCharityLabel() {
    charityLabel.frame = CGRect(x: 150, y: 540, width: 114, height: 50)
    charityLabel.textAlignment = .center
    charityLabel.text = "0 рублей"
    charityLabel.font = .systemFont(ofSize: 13, weight: .bold)
    charityLabel.textColor = .black
  }
  
  private func setupCharitySlider() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 12, weight: .medium)
    let image = UIImage(systemName: "circle.fill", withConfiguration: configuration)
    
    charitySlider.frame = CGRect(x: 100, y: 580, width: 214, height: 23)
    charitySlider.minimumValue = Float(0)
    charitySlider.maximumValue = Float(1000)
    charitySlider.tintColor = .systemGreen
    charitySlider.minimumTrackTintColor = .systemGreen
    charitySlider.setThumbImage(image, for: .normal)
  }
  
  private func setupPayButton() {
    payButton.frame = CGRect(x: 60, y: 750, width: 295, height: 50)
    payButton.backgroundColor = .systemBlue
    payButton.setTitle("К оплате: \(11990) рублей", for: .normal)
    payButton.layer.cornerRadius = 10
    payButton.tintColor = .white
    payButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupImageView()
    setupPriceLabel()
    setupDescriptionProductLabel()
    setupColorProductNameLabel()
    setupCharityDescriptionLabel()
    setupCharityLabel()
    setupCharitySlider()
    setupPayButton()
    addSubviews()
    setupSelfView()
    addTarget()
    setupNavigationController()
  }
  
  private func addSubviews() {
    view.addSubview(imageView)
    view.addSubview(priceLabel)
    view.addSubview(descriptionProductLabel)
    view.addSubview(colorProductNameLabel)
    view.addSubview(charityDescriptionLabel)
    view.addSubview(charityLabel)
    view.addSubview(charitySlider)
    view.addSubview(payButton)
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  private func addTarget() {
    charitySlider.addTarget(self, action: #selector(changeCharitySlider), for: .valueChanged)
  }
  
  @objc private func changeCharitySlider(sender: UISlider) {
    guard sender == charitySlider else { return }
    payButton.setTitle("К оплате: \(11990 + Int(sender.value)) рублей", for: .normal)
    charityLabel.text = "\(Int(sender.value)) рублей"
  }
}
