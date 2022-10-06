import UIKit

final class HomeViewController: UIViewController {
  // MARK: - Private Properties
  private let label = UILabel()
  private let textColorTextfield = UITextField()
  private let textColorPicker = UIPickerView()
  private let numberOfLinesTextfield = UITextField()
  private let numberOfLinesPicker = UIPickerView()
  private let slider = UISlider()
  
  private let colorsArray = ["красный", "зеленый", "синий", "черный", "оранжевый"]
  private let lines = ["1", "2", "3", "4", "5"]
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupNavigationController() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAlert))
    navigationItem.rightBarButtonItem?.tintColor = .black
  }
  
  private func setupTextColorTextfield() {
    let toolTextColorTextfield = UIToolbar()
    toolTextColorTextfield.sizeToFit()
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector (endEditing))
    toolTextColorTextfield.setItems([flexSpace, doneButton], animated: true)
    
    textColorTextfield.inputAccessoryView = toolTextColorTextfield
    textColorTextfield.frame = CGRect(x: 40, y: 200, width: 334, height: 20)
    textColorTextfield.contentVerticalAlignment = .center
    textColorTextfield.textAlignment = .center
    textColorTextfield.placeholder = "Выберите цвет текста"
    textColorTextfield.layer.addSublayer(bottomLine(textFiled: textColorTextfield))
    textColorTextfield.textColor = .black
    textColorTextfield.inputView = textColorPicker
  }
  
  private func setupTextColorPicker() {
    textColorPicker.delegate = self
    textColorPicker.dataSource = self
    textColorPicker.tag = 1
  }
  
  private func setupNumberOfLinesTextfield() {
    let toolNumberOfLinesTextField = UIToolbar()
    toolNumberOfLinesTextField.sizeToFit()
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector (endEditing))
    toolNumberOfLinesTextField.setItems([flexSpace, doneButton], animated: true)
    
    numberOfLinesTextfield.inputAccessoryView = toolNumberOfLinesTextField
    numberOfLinesTextfield.frame = CGRect(x: 40, y: 300, width: 334, height: 20)
    numberOfLinesTextfield.contentVerticalAlignment = .center
    numberOfLinesTextfield.textAlignment = .center
    numberOfLinesTextfield.placeholder = "Выберите количество строк"
    numberOfLinesTextfield.layer.addSublayer(bottomLine(textFiled: numberOfLinesTextfield))
    numberOfLinesTextfield.textColor = .black
    numberOfLinesTextfield.inputView = numberOfLinesPicker
  }
  
  private func setupNumberOfLinesPicker() {
    numberOfLinesPicker.delegate = self
    numberOfLinesPicker.dataSource = self
    numberOfLinesPicker.tag = 2
  }
  
  private func setupLabel() {
    label.frame = CGRect(x: 0, y: 0, width: 350, height: 150)
    label.textAlignment = .center
    label.center = view.center
    label.text = "Чтобы изменить текст, нажмите крестик сверху справа"
    label.numberOfLines = 1
    label.lineBreakMode = .byWordWrapping
    label.font = .systemFont(ofSize: 15, weight: .regular)
    label.shadowColor = .lightGray
    label.shadowOffset = CGSize(width: 2, height: 1)
  }
  
  private func setupSlider() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 12, weight: .medium)
    let image = UIImage(systemName: "circle.fill", withConfiguration: configuration)
    
    slider.frame = CGRect(x: 100, y: 580, width: 214, height: 23)
    slider.minimumValue = Float(15)
    slider.maximumValue = Float(23)
    slider.tintColor = .black
    slider.minimumTrackTintColor = .black
    slider.setThumbImage(image, for: .normal)
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupNavigationController()
    setupTextColorTextfield()
    setupTextColorPicker()
    setupNumberOfLinesTextfield()
    setupNumberOfLinesPicker()
    setupLabel()
    setupSlider()
    addSubviews()
    addTarget()
    setupSelfView()
  }
  
  private func addSubviews() {
    [textColorTextfield, numberOfLinesTextfield, label, slider].forEach {
      view.addSubview($0)
    }
  }
  
  private func addTarget() {
    slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  @objc private func addAlert() {
    alert(title: "Введите текст", message: "") { textLabel in
      self.label.text = textLabel 
    }
  }
  
  @objc private func changeSlider(sender: UISlider) {
    guard sender == slider else { return }
    label.font = label.font.withSize(CGFloat(sender.value))
  }
}

extension HomeViewController: UIPickerViewDelegate {
  
  public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    switch pickerView.tag {
    case 1:
      return colorsArray[row]
    case 2:
      return lines[row]
    default:
      return "Данные не найдены"
    }
  }
}

extension HomeViewController: UIPickerViewDataSource {
  
  public func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    switch pickerView.tag {
    case 1:
      return colorsArray.count
    case 2:
      return lines.count
    default:
      return 1
    }
  }
  
  public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    switch pickerView.tag {
    case 1:
      let textColorText = colorsArray[row]
      switch textColorText {
      case "красный":
        label.textColor = .red
        textColorTextfield.text = "Красный"
      case "зеленый":
        label.textColor = .green
        textColorTextfield.text = "Зеленый"
      case "синий":
        label.textColor = .blue
        textColorTextfield.text = "Синий"
      case "черный":
        label.textColor = .black
        textColorTextfield.text = "Черный"
      case "оранжевый":
        label.textColor = .orange
        textColorTextfield.text = "Оранжевый"
      default:
        label.textColor = .black
      }
    case 2:
      let numberOfLinesText = lines[row]
      switch numberOfLinesText {
      case "1":
        label.numberOfLines = 1
        numberOfLinesTextfield.text = "1"
      case "2":
        label.numberOfLines = 2
        numberOfLinesTextfield.text = "2"
      case "3":
        label.numberOfLines = 3
        numberOfLinesTextfield.text = "3"
      case "4":
        label.numberOfLines = 4
        numberOfLinesTextfield.text = "4"
      case "5":
        label.numberOfLines = 5
        numberOfLinesTextfield.text = "5"
      default:
        label.numberOfLines = 1
      }
    default:
      return
    }
  }
}
