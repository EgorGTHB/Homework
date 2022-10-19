import UIKit

final class SearchViewController: UIViewController {
  // MARK: - Private Properties
  private let searchTextField = UITextField()
  private let recentlyWatchedLabel = UITextField()
  private let clearButton = UIButton(type: .system)
  private let imageScrollView = UIScrollView()
  private let incaseFlateLabel = UILabel()
  private let incaseFlateImageView = UIImageView()
  private let incaseFlateTextLabel = UILabel()
  private let strapLabel = UILabel()
  private let strapImageView = UIImageView()
  private let strapTextLabel = UILabel()
  private let leatherCaseLabel = UILabel()
  private let leatherCaseImageView = UIImageView()
  private let leatherCaseTextLabel = UILabel()
  private let queryOptionsLabel = UILabel()
  private let airPodsLabel = UILabel()
  private let appleCareLabel = UILabel()
  private let beatsLabel = UILabel()
  private let modelComparisonLabel = UILabel()
  private let magnifyingglassImageView1 = UIImageView()
  private let magnifyingglassImageView2 = UIImageView()
  private let magnifyingglassImageView3 = UIImageView()
  private let magnifyingglassImageView4 = UIImageView()
  
  private let magnifyingglassImage = UIImage(systemName: "magnifyingglass")
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupNavigationController() {
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    title = "Поиск"
  }
  
  private func setupSearchTextField() {
    let leftImageView = UIImageView()
    let searchImage = magnifyingglassImage
    let contentView = UIView()
    let tap = UITapGestureRecognizer(target: self, action: #selector(endEditing))
    leftImageView.tintColor = .gray
    leftImageView.image = searchImage
    contentView.addSubview(leftImageView)
    contentView.frame = CGRect(x: 0, y: 0, width: 37, height: 20)
    leftImageView.frame = CGRect(x: 10, y: 0, width: 22, height: 20)
    view.addGestureRecognizer(tap)
    searchTextField.leftView = contentView
    searchTextField.clearsOnBeginEditing = true
    searchTextField.leftViewMode = .always
    searchTextField.frame = CGRect(x: 20, y: 150, width: 374, height: 40)
    searchTextField.layer.cornerRadius = 12
    searchTextField.contentVerticalAlignment = .center
    searchTextField.textAlignment = .left
    searchTextField.textColor = .white
    searchTextField.backgroundColor = UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1)
    searchTextField.delegate = self
    searchTextField.attributedPlaceholder = NSAttributedString(
      string: "Поиск по продуктам и магазинам",
      attributes: [.foregroundColor: UIColor.gray])
  }
  
  private func setupRecentlyWatchedLabel() {
    recentlyWatchedLabel.frame = CGRect(x: 20, y: 230, width: 290, height: 40)
    recentlyWatchedLabel.textColor = .white
    recentlyWatchedLabel.isHighlighted = false
    recentlyWatchedLabel.font = .systemFont(ofSize: 23, weight: .bold)
    recentlyWatchedLabel.text = "Недавно просмотренные"
  }
  
  private func setupClearButton() {
    clearButton.frame = CGRect(x: 315, y: 232, width: 80, height: 40)
    clearButton.setTitle("Очистить", for: .normal)
    clearButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
  }
  
  private func setupImageScrollView() {
    imageScrollView.frame = CGRect(x: 0, y: 290, width: 414, height: 200)
    imageScrollView.isPagingEnabled = true
    imageScrollView.contentSize = CGSize(width: view.bounds.size.width + 70, height: 200)
  }
  
  private func addSubviewImageScrollView() {
    [incaseFlateLabel, incaseFlateImageView, incaseFlateTextLabel, strapLabel, strapImageView, strapTextLabel, leatherCaseLabel, leatherCaseImageView, leatherCaseTextLabel].forEach {
      imageScrollView.addSubview($0)
    }
  }
  
  private func setupIncaseFlatLabel() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
    incaseFlateLabel.addGestureRecognizer(tap)
    incaseFlateLabel.isUserInteractionEnabled = true
    incaseFlateLabel.frame = CGRect(x: 20, y: 0, width: 140, height: 200)
    incaseFlateLabel.backgroundColor = UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1)
    incaseFlateLabel.layer.cornerRadius = 20
    incaseFlateLabel.layer.masksToBounds = true
  }
  
  private func setupIncaseFlatImageView() {
    incaseFlateImageView.image = UIImage(named: "case1")
    incaseFlateImageView.frame = CGRect(x: 18, y: 10, width: 150, height: 140)
  }
  
  private func setupIncaseFlatTextLabel() {
    incaseFlateTextLabel.text = "Чехол Incase Flat для Macbook Pro 16 дюймов"
    incaseFlateTextLabel.frame = CGRect(x: 30, y: 110, width: 120, height: 95)
    incaseFlateTextLabel.numberOfLines = 3
    incaseFlateTextLabel.textColor = .white
    incaseFlateTextLabel.font = .systemFont(ofSize: 12, weight: .bold)
  }
  
  private func setupStrapLabel() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
    strapLabel.addGestureRecognizer(tap)
    strapLabel.isUserInteractionEnabled = true
    strapLabel.frame = CGRect(x: 170, y: 0, width: 140, height: 200)
    strapLabel.backgroundColor = UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1)
    strapLabel.layer.cornerRadius = 20
    strapLabel.layer.masksToBounds = true
  }
  
  private func setupStrapImageView() {
    strapImageView.image = UIImage(named: "strap3")
    strapImageView.frame = CGRect(x: 222, y: 20, width: 35, height: 100)
  }
  
  private func setupStrapTextLabel() {
    strapTextLabel.text = "Спортивный ремешок Black Unity"
    strapTextLabel.frame = CGRect(x: 180, y: 110, width: 120, height: 95)
    strapTextLabel.numberOfLines = 3
    strapTextLabel.textColor = .white
    strapTextLabel.font = .systemFont(ofSize: 12, weight: .bold)
  }
  
  private func setupLeatherCaseLabel() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
    leatherCaseLabel.addGestureRecognizer(tap)
    leatherCaseLabel.isUserInteractionEnabled = true
    leatherCaseLabel.frame = CGRect(x: 320, y: 0, width: 140, height: 200)
    leatherCaseLabel.backgroundColor = UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1)
    leatherCaseLabel.layer.cornerRadius = 20
    leatherCaseLabel.layer.masksToBounds = true
  }
  
  private func setupLeatherCaseImageView() {
    leatherCaseImageView.image = UIImage(named: "leather1")
    leatherCaseImageView.frame = CGRect(x: 331, y: 10, width: 120, height: 120)
  }
  
  private func setupLeatherCaseTextLabel() {
    leatherCaseTextLabel.text = "Кожаный чехол для Macbook Pro 16 дюймов, золотой"
    leatherCaseTextLabel.frame = CGRect(x: 330, y: 110, width: 120, height: 95)
    leatherCaseTextLabel.numberOfLines = 3
    leatherCaseTextLabel.textColor = .white
    leatherCaseTextLabel.font = .systemFont(ofSize: 12, weight: .bold)
  }
  
  private func setupQueryOptionsLabel() {
    queryOptionsLabel.frame = CGRect(x: 20, y: 500, width: 290, height: 40)
    queryOptionsLabel.textColor = .white
    queryOptionsLabel.isHighlighted = false
    queryOptionsLabel.font = .systemFont(ofSize: 23, weight: .bold)
    queryOptionsLabel.text = "Варианты запросов"
  }
  
  private func setupAirPodsLabel() {
    airPodsLabel.frame = CGRect(x: 50, y: 550, width: 290, height: 40)
    airPodsLabel.textColor = .white
    airPodsLabel.isHighlighted = false
    airPodsLabel.font = .systemFont(ofSize: 20)
    airPodsLabel.text = "AirPods"
  }
  
  private func setupAppleCareLabel() {
    appleCareLabel.frame = CGRect(x: 50, y: 600, width: 290, height: 40)
    appleCareLabel.textColor = .white
    appleCareLabel.isHighlighted = false
    appleCareLabel.font = .systemFont(ofSize: 20)
    appleCareLabel.text = "AppleCare"
  }
  
  private func setupBeatsLabel() {
    beatsLabel.frame = CGRect(x: 50, y: 650, width: 290, height: 40)
    beatsLabel.textColor = .white
    beatsLabel.isHighlighted = false
    beatsLabel.font = .systemFont(ofSize: 20)
    beatsLabel.text = "Beats"
  }
  
  private func setupModelComparisonLabel() {
    modelComparisonLabel.frame = CGRect(x: 50, y: 700, width: 290, height: 40)
    modelComparisonLabel.textColor = .white
    modelComparisonLabel.isHighlighted = false
    modelComparisonLabel.font = .systemFont(ofSize: 20)
    modelComparisonLabel.text = "Сравните модели IPhone"
  }
  
  private func setupMagnifyingglassImageView1() {
    magnifyingglassImageView1.image = magnifyingglassImage
    magnifyingglassImageView1.frame = CGRect(x: 20, y: 561, width: 18, height: 17)
    magnifyingglassImageView1.tintColor = .gray
  }
  
  private func setupMagnifyingglassImageView2() {
    magnifyingglassImageView2.image = magnifyingglassImage
    magnifyingglassImageView2.frame = CGRect(x: 20, y: 611, width: 18, height: 17)
    magnifyingglassImageView2.tintColor = .gray
  }
  
  private func setupMagnifyingglassImageView3() {
    magnifyingglassImageView3.image = magnifyingglassImage
    magnifyingglassImageView3.frame = CGRect(x: 20, y: 661, width: 18, height: 17)
    magnifyingglassImageView3.tintColor = .gray
  }
  
  private func setupMagnifyingglassImageView4() {
    magnifyingglassImageView4.image = magnifyingglassImage
    magnifyingglassImageView4.frame = CGRect(x: 20, y: 711, width: 18, height: 17)
    magnifyingglassImageView4.tintColor = .gray
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupNavigationController()
    setupSearchTextField()
    setupRecentlyWatchedLabel()
    setupClearButton()
    setupImageScrollView()
    addSubviewImageScrollView()
    setupIncaseFlatLabel()
    setupIncaseFlatImageView()
    setupIncaseFlatTextLabel()
    setupStrapLabel()
    setupStrapImageView()
    setupStrapTextLabel()
    setupLeatherCaseLabel()
    setupLeatherCaseImageView()
    setupLeatherCaseTextLabel()
    setupQueryOptionsLabel()
    setupAirPodsLabel()
    setupAppleCareLabel()
    setupBeatsLabel()
    setupModelComparisonLabel()
    setupMagnifyingglassImageView1()
    setupMagnifyingglassImageView2()
    setupMagnifyingglassImageView3()
    setupMagnifyingglassImageView4()
    setupLines()
    addSubviews()
    setupSelfView()
  }
  
  private func addSubviews() {
    [searchTextField, recentlyWatchedLabel, clearButton, imageScrollView, queryOptionsLabel, airPodsLabel, appleCareLabel, beatsLabel, modelComparisonLabel, magnifyingglassImageView1, magnifyingglassImageView2, magnifyingglassImageView3, magnifyingglassImageView4].forEach {
      view.addSubview($0)
    }
  }
  
  private func setupSelfView() {
    view.backgroundColor = .black
  }
  
  private func setupLines() {
    let point1: CGPoint = CGPoint(x: 20, y: 595)
    let point2 = CGPoint(x: 394, y: 595)
    let point3 = CGPoint(x: 20, y: 645)
    let point4 = CGPoint(x: 394, y: 645)
    let point5 = CGPoint(x: 20, y: 695)
    let point6 = CGPoint(x: 394, y: 695)
    let point7 = CGPoint(x: 20, y: 745)
    let point8 = CGPoint(x: 394, y: 745)
    drawLine(start: point1, toPoint: point2, ofColor: .gray, inView: view, shapeWidth: 1)
    drawLine(start: point3, toPoint: point4, ofColor: .gray, inView: view, shapeWidth: 1)
    drawLine(start: point5, toPoint: point6, ofColor: .gray, inView: view, shapeWidth: 1)
    drawLine(start: point7, toPoint: point8, ofColor: .gray, inView: view, shapeWidth: 1)
  }
  
  private func goToCardProduct(descriptionProduct: String, priceProduct: String, imageProduct1: String, imageProduct2: String, imageProduct3: String) {
    let cardProductViewController = CardProductViewController()
    cardProductViewController.descriptionProduct = descriptionProduct
    cardProductViewController.priceProduct = priceProduct
    cardProductViewController.imageProduct1 = imageProduct1
    cardProductViewController.imageProduct2 = imageProduct2
    cardProductViewController.imageProduct3 = imageProduct3
    navigationController?.pushViewController(cardProductViewController, animated: true)
  }
  
  // MARK: - Actions
  @objc private func tapFunction(sender: UITapGestureRecognizer) {
    switch sender.view {
    case incaseFlateLabel:
      goToCardProduct(descriptionProduct: "Чехол Incase Flat для Macbook Pro 16 дюймов", priceProduct: "3 990.00 руб.", imageProduct1: "case1", imageProduct2: "case2", imageProduct3: "case3")
    case strapLabel:
      goToCardProduct(descriptionProduct: "Спортивный ремешок Black Unity", priceProduct: "1 990.00 руб.", imageProduct1: "strap1", imageProduct2: "strap2", imageProduct3: "strap3")
    case leatherCaseLabel:
      goToCardProduct(descriptionProduct: "Кожаный чехол для Macbook Pro 16 дюймов, золотой", priceProduct: "7 990.00 руб.", imageProduct1: "leather1", imageProduct2: "leather2", imageProduct3: "leather3")
    default:
      return
    }
  }
}

// MARK: - UITextFieldDelegate
extension SearchViewController: UITextFieldDelegate {
  
  public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard textField == searchTextField else { return true }
    searchTextField.resignFirstResponder()
    return true
  }
}

