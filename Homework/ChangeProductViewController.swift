import UIKit

class ChangeProductViewController: UIViewController {
  // MARK: - Private Properties
  private let navigationItemLabel = UILabel()
  private let brandLabel = UILabel()
  private let modelLabel = UILabel()
  private let imageView = UIImageView()
  private var segmentedControll = UISegmentedControl()
  private var sizeOfSnikersPickerView = UIPickerView()
  private var sizeOfSnikersTextField = UITextField()
  private let addToBagButton = UIButton(type: .system)
  
  private let menuArray = ["черный", "синий", "серый"]
  private let imageArray = ["shopping.jpg",
                            "shopping2.jpg",
                            "shopping3.jpg"]
  private var color = "черный"
  private var size = "36"
  private var image = "shopping.jpg"
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupNavigationController() {
    navigationItemLabel.text = "Карточка товара"
    navigationItemLabel.font = UIFont(name: "Menlo-Bold", size: 20)
    navigationItem.titleView = navigationItemLabel
  }
  
  private func setupBrandLabel() {
    brandLabel.frame = CGRect(x: 107, y: 110, width: 200, height: 40)
    brandLabel.textAlignment = .center
    brandLabel.text = "Adidas"
    brandLabel.font = .systemFont(ofSize: 45, weight: .bold)
  }
  
  private func setupModelLabel() {
    modelLabel.frame = CGRect(x: 107, y: 150, width: 200, height: 40)
    modelLabel.textAlignment = .center
    modelLabel.text = "Spezial"
    modelLabel.font = .systemFont(ofSize: 30, weight: .regular)
  }
  
  private func setupImageView() {
    imageView.frame = CGRect(x: 98, y: 50, width: 500, height: 500)
    imageView.center = view.center
    imageView.image = UIImage(named: "\(imageArray[0])")
  }
  
  private func setupSegmentedControll() {
    segmentedControll = UISegmentedControl(items: menuArray)
    segmentedControll.frame = CGRect(x: 98, y: 650, width: 220, height: 30)
    segmentedControll.selectedSegmentIndex = 0
  }
  
  private func setupSizePickerView() {
    sizeOfSnikersPickerView.frame = CGRect(x: 0, y: 700, width: view.bounds.size.width, height: 123)
    sizeOfSnikersPickerView.delegate = self
    sizeOfSnikersPickerView.dataSource = self
  }
  
  private func setupSizeOfSnikersTextField() {
    let toolbardateTextField = UIToolbar()
    toolbardateTextField.sizeToFit()
    let flexSpaceDate = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButtonDate = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector (hideKeyboard))
    toolbardateTextField.setItems([flexSpaceDate, doneButtonDate], animated: true)
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: 20))
    
    sizeOfSnikersTextField.leftView = paddingView
    sizeOfSnikersTextField.leftViewMode = .always
    sizeOfSnikersTextField.setupRightSideImage()
    sizeOfSnikersTextField.inputAccessoryView = toolbardateTextField
    sizeOfSnikersTextField.frame = CGRect(x: 7, y: 740, width: 400, height: 30)
    sizeOfSnikersTextField.text = "Выберите размер обуви. Выбран 36 размер"
    sizeOfSnikersTextField.textAlignment = .left
    sizeOfSnikersTextField.font = .systemFont(ofSize: 15, weight: .regular)
    sizeOfSnikersTextField.inputView = sizeOfSnikersPickerView
    sizeOfSnikersTextField.layer.borderWidth = 1
    sizeOfSnikersTextField.layer.cornerRadius = 5
  }
  
  private func setupAddToBagButton() {
    addToBagButton.frame = CGRect(x: 59, y: 800, width: 295, height: 50)
    addToBagButton.backgroundColor = .systemBlue
    addToBagButton.tintColor = .white
    addToBagButton.setTitle("Добавить в корзину", for: .normal)
    addToBagButton.layer.cornerRadius = 10
    addToBagButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  // MARK: - Private Methods
  private func setupView() {
    hideKeyboardWhenTappedAround()
    setupBrandLabel()
    setupModelLabel()
    setupImageView()
    setupSegmentedControll()
    setupSizePickerView()
    setupSizeOfSnikersTextField()
    setupNavigationController()
    setupAddToBagButton()
    setupSelfView() 
    addSubviews()
    addTarget()
  }
  
  private func addTarget() {
    segmentedControll.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
    addToBagButton.addTarget(self, action: #selector(goToInfoVC), for: .touchUpInside)
  }
  
  @objc private func goToInfoVC() {
    let infoViewController = InfoViewController()
    infoViewController.image = image
    infoViewController.color = color
    infoViewController.size = size
    navigationController?.pushViewController(infoViewController, animated: true)
  }
  
  private func addSubviews() {
    view.addSubview(brandLabel)
    view.addSubview(modelLabel)
    view.addSubview(imageView)
    view.addSubview(segmentedControll)
    view.addSubview(sizeOfSnikersTextField)
    view.addSubview(addToBagButton)
  }
  
  @objc private func selectedValue(target: UISegmentedControl) {
    guard target == segmentedControll else { return }
    let segmentIndex = target.selectedSegmentIndex
    guard let segmentColor = target.titleForSegment(at: segmentIndex) else { return }
    imageView.image =  UIImage(named: "\(imageArray[segmentIndex])")
    color = segmentColor
    image = imageArray[segmentIndex]
  }
}

extension ChangeProductViewController: UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return 15
  }
}

extension ChangeProductViewController: UIPickerViewDelegate {
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    let result = "\(36 + row)"
    return result
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    guard pickerView.isEqual(sizeOfSnikersPickerView) else { return }
    sizeOfSnikersTextField.text = "Выберите размер обуви. Выбран \(36 + row) размер"
    size = "\(36 + row)"
  }
}

extension UIViewController {
  
  func hideKeyboardWhenTappedAround() {
    let tapGesture = UITapGestureRecognizer(target: self,
                                            action: #selector(hideKeyboard))
    view.addGestureRecognizer(tapGesture)
  }
  
  @objc func hideKeyboard() {
    view.endEditing(true)
  }
}

extension UITextField {
  
  func setupRightSideImage() {
    let imageView = UIImageView(frame: CGRect(x: 10, y: 12, width: 16, height: 16))
    imageView.tintColor = .black
    imageView.image = UIImage(systemName: "chevron.down")
    let imageViewContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    imageViewContainerView.addSubview(imageView)
    rightView = imageViewContainerView
    rightViewMode = .always
  }
}
