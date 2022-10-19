import UIKit

final class CardProductViewController: UIViewController {
  // MARK: - Private Properties
  private let imageProductImageView = UIImageView()
  private let descriptionProductLabel = UILabel()
  private let priceProductLabel = UILabel()
  private let miniDescriptionProductLabel = UILabel()
  private let whiteBlackChoiceImageView = UIImageView()
  private let checkMarkImageView = UIImageView()
  private let compatibleLabel = UILabel()
  private let macbookLabel = UILabel()
  private let addToBagButton = UIButton(type: .system)
  private let boxImageView = UIImageView()
  private let orderLabel = UILabel()
  private let dateDeliveryLabel = UILabel()
  private let deliveryOptionsLabel = UILabel()
  private let productImageScrollView = UIScrollView()
  private let imageView1 = UIImageView()
  private let imageView2 = UIImageView()
  private let imageView3 = UIImageView()
  
  // MARK: - Public Properties
  var imageProduct1 = String()
  var imageProduct2 = String()
  var imageProduct3 = String()
  var descriptionProduct = String()
  var priceProduct = String()
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  private func setupImageView1() {
    imageView1.frame = CGRect(x: 0, y: 0, width: 414, height: 250)
    imageView1.image = UIImage(named: imageProduct1)
    imageView1.contentMode = .scaleAspectFit
  }
  
  private func setupImageView2() {
    imageView2.frame = CGRect(x: 415, y: 0, width: 414, height: 250)
    imageView2.image = UIImage(named: imageProduct2)
    imageView2.contentMode = .scaleAspectFit
  }
  
  private func setupImageView3() {
    imageView3.frame = CGRect(x: 827, y: 0, width: 414, height: 250)
    imageView3.image = UIImage(named: imageProduct3)
    imageView3.contentMode = .scaleAspectFit
  }
  
  private func setupProductImageScrollView() {
    productImageScrollView.frame = CGRect(x: 0, y: 190, width: 414, height: 250)
    productImageScrollView.isPagingEnabled = true
    productImageScrollView.contentSize = CGSize(width: view.bounds.size.width * 3, height: productImageScrollView.bounds.height)
    productImageScrollView.indicatorStyle = .white
  }
  
  private func addSubviewProductImageScrollView() {
    [imageView1, imageView2, imageView3].forEach {
      productImageScrollView.addSubview($0)
    }
  }
  
  // MARK: - Visual Components
  private func setupNavigationController() {
    let like = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: nil)
    let share = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: nil)
    navigationItem.rightBarButtonItems = [like, share]
  }
  
  private func setupDescriptionProductLabel() {
    descriptionProductLabel.text = descriptionProduct
    descriptionProductLabel.frame = CGRect(x: 20, y: 100, width: 394, height: 70)
    descriptionProductLabel.textColor = .white
    descriptionProductLabel.font = .systemFont(ofSize: 17, weight: .bold)
    descriptionProductLabel.textAlignment = .center
    descriptionProductLabel.numberOfLines = 3
  }
  
  private func setupPriceProductLabel() {
    priceProductLabel.text = priceProduct
    priceProductLabel.frame = CGRect(x: 20, y: 130, width: 394, height: 70)
    priceProductLabel.textColor = .gray
    priceProductLabel.font = .systemFont(ofSize: 16, weight: .regular)
    priceProductLabel.textAlignment = .center
  }
  
  private func setupMiniDescriptionProductLabel() {
    miniDescriptionProductLabel.text = descriptionProduct
    miniDescriptionProductLabel.frame = CGRect(x: 20, y: 450, width: 394, height: 70)
    miniDescriptionProductLabel.textColor = .gray
    miniDescriptionProductLabel.font = .systemFont(ofSize: 13, weight: .regular)
    miniDescriptionProductLabel.textAlignment = .center
  }
  
  private func setupWhiteBlackChoiceImageView() {
    whiteBlackChoiceImageView.frame = CGRect(x: 157, y: 510, width: 100, height: 55)
    whiteBlackChoiceImageView.image = UIImage(named: "whiteBlackChoice")
    whiteBlackChoiceImageView.tintColor = .green
  }
  
  private func setupCheckMarkImageView() {
    checkMarkImageView.frame = CGRect(x: 95, y: 605, width: 21, height: 20)
    checkMarkImageView.image = UIImage(systemName: "checkmark.circle.fill")
    checkMarkImageView.tintColor = .green
  }
  private func setupCompatibleLabel() {
    compatibleLabel.text = "Совместимо с"
    compatibleLabel.frame = CGRect(x: 120, y: 580, width: 95, height: 70)
    compatibleLabel.textColor = .gray
    compatibleLabel.font = .systemFont(ofSize: 13, weight: .regular)
    compatibleLabel.textAlignment = .center
  }
  
  private func setupMacbookLabel() {
    macbookLabel.text = "Macbook Pro - User"
    macbookLabel.frame = CGRect(x: 203, y: 580, width: 150, height: 70)
    macbookLabel.textColor = .blue
    macbookLabel.font = .systemFont(ofSize: 13, weight: .regular)
    macbookLabel.textAlignment = .center
  }
  
  private func setupAddToBagButton() {
    addToBagButton.setTitle("Добавить в корзину", for: .normal)
    addToBagButton.frame = CGRect(x: 20, y: 650, width: 374, height: 40)
    addToBagButton.backgroundColor = .blue
    addToBagButton.tintColor = .white
    addToBagButton.layer.cornerRadius = 8
  }
  
  private func setupBoxImageView() {
    boxImageView.frame = CGRect(x: 20, y: 719, width: 19, height: 18)
    boxImageView.image = UIImage(systemName: "shippingbox")
    boxImageView.tintColor = .white
  }
  
  private func setupOrderLabel() {
    orderLabel.text = "Заказ сегодня в течении дня, доставка:"
    orderLabel.frame = CGRect(x: 50, y: 715, width: 270, height: 20)
    orderLabel.textAlignment = .left
    orderLabel.textColor = .blue
    orderLabel.font = .systemFont(ofSize: 13, weight: .bold)
    orderLabel.textAlignment = .center
  }
  
  private func setupDateDeliveryLabel() {
    dateDeliveryLabel.text = "Чт 25 Фев - Бесплатно"
    dateDeliveryLabel.frame = CGRect(x: 50, y: 735, width: 150, height: 20)
    dateDeliveryLabel.textAlignment = .left
    dateDeliveryLabel.textColor = .gray
    dateDeliveryLabel.font = .systemFont(ofSize: 13, weight: .regular)
    dateDeliveryLabel.textAlignment = .center
  }
  
  private func setupDeliveryOptionsLabel() {
    deliveryOptionsLabel.text = "Варианты доставки для меcтоположения: 115533"
    deliveryOptionsLabel.textAlignment = .left
    deliveryOptionsLabel.frame = CGRect(x: 50, y: 755, width: 320, height: 20)
    deliveryOptionsLabel.textColor = .gray
    deliveryOptionsLabel.font = .systemFont(ofSize: 13, weight: .regular)
    deliveryOptionsLabel.textAlignment = .center
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupNavigationController()
    setupDescriptionProductLabel()
    setupPriceProductLabel()
    setupImageView1()
    setupImageView2()
    setupImageView3()
    setupMiniDescriptionProductLabel()
    setupWhiteBlackChoiceImageView()
    setupCheckMarkImageView()
    setupCompatibleLabel()
    setupMacbookLabel()
    setupAddToBagButton()
    setupBoxImageView()
    setupOrderLabel()
    setupDateDeliveryLabel()
    setupDeliveryOptionsLabel()
    addSubviews()
    setupSelfView()
    setupProductImageScrollView()
    addSubviewProductImageScrollView()
  }
  
  private func addSubviews() {
    [descriptionProductLabel, priceProductLabel, miniDescriptionProductLabel, whiteBlackChoiceImageView, checkMarkImageView, compatibleLabel, macbookLabel, addToBagButton, boxImageView, orderLabel, dateDeliveryLabel, deliveryOptionsLabel, productImageScrollView].forEach {
      view.addSubview($0)
    }
  }
  
  private func setupSelfView() {
    view.backgroundColor = .black
  }
}







