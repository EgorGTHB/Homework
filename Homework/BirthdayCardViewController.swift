import UIKit

final class BirthdayCardViewController: UIViewController {
  // MARK: - Private Properties
  private let navigationItemLabel = UILabel()
  private let iconCardImageView = UIImageView()
  private let nameLabel = UILabel()
  private let nameTextField = UITextField()
  private let dateLabel = UILabel()
  private let dateTextField = UITextField()
  private let ageLabel = UILabel()
  private let ageTextField = UITextField()
  private let sexLabel = UILabel()
  private let sexTextField = UITextField()
  private let instagramLabel = UILabel()
  private let instagramTextField = UITextField()
  private let datePicker = UIDatePicker()
  private let agePicker = UIPickerView()
  private let sexPicker = UIPickerView()
  private let changePhotoButton = UIButton(type: .system)
  
  private let icon = UIImage(named: "Iconnn")
  private let sexArray = ["Парень", "Девушка"]
  
  // MARK: - UIViewController()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  private func setupNavigationController() {
    navigationItemLabel.font = UIFont(name: "Menlo-Bold", size: 18)
    navigationItem.titleView = navigationItemLabel
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить", style: .plain, target: self, action: #selector(addCard))
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отмена", style: .plain, target: self, action: #selector(dissmis))
  }
  
  private func setupIconCardImageView() {
    iconCardImageView.image = icon
    iconCardImageView.frame = CGRect(x: 140, y: 100, width: 130, height: 130)
  }
  
  private func setupChangePhotoButton() {
    changePhotoButton.frame = CGRect(x: 130, y: 230, width: 150, height: 40)
    changePhotoButton.setTitle("Изменить фото", for: .normal)
    changePhotoButton.layer.cornerRadius = 10
    changePhotoButton.tintColor = .systemBlue
    changePhotoButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
  }
  
  private func setupNameLabel() {
    nameLabel.frame = CGRect(x: 25, y: 285, width: 80, height: 30)
    nameLabel.textAlignment = .left
    nameLabel.text = "Имя"
    nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    nameLabel.textColor = .systemBlue
  }
  
  private func setupNameTextField() {
    nameTextField.frame = CGRect(x: 25, y: 320, width: 300, height: 30)
    nameTextField.contentVerticalAlignment = .center
    nameTextField.textAlignment = .left
    nameTextField.placeholder = "Введите имя"
    nameTextField.layer.addSublayer(bottomLine(textFiled: nameTextField))
    nameTextField.textColor = .black
    nameTextField.delegate = self
  }
  
  private func setupDateLabel() {
    dateLabel.frame = CGRect(x: 25, y: 355, width: 80, height: 30)
    dateLabel.textAlignment = .left
    dateLabel.text = "Дата"
    dateLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    dateLabel.textColor = .systemBlue
  }
  
  private func setupDateTextFieldWithItsToolbarAndDatePicker() {
    let toolbardateTextField = UIToolbar()
    toolbardateTextField.sizeToFit()
    let flexSpaceDate = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButtonDate = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector (doneActionDate))
    toolbardateTextField.setItems([flexSpaceDate, doneButtonDate], animated: true)
    let currentDate = Date()
    var oneYearTime = TimeInterval()
    oneYearTime = 360 * 24 * 60 * 60
    let oneYearFrom = currentDate.addingTimeInterval(oneYearTime)
    dateTextField.frame = CGRect(x: 25, y: 390, width: 300, height: 30)
    dateTextField.contentVerticalAlignment = .center
    dateTextField.textAlignment = .left
    dateTextField.placeholder = "Выберите дату"
    dateTextField.layer.addSublayer(bottomLine(textFiled: dateTextField))
    dateTextField.inputView = datePicker
    dateTextField.inputAccessoryView = toolbardateTextField
    dateTextField.textColor = .black
    datePicker.preferredDatePickerStyle = .wheels
    datePicker.datePickerMode = .date
    datePicker.minimumDate = currentDate
    datePicker.maximumDate = oneYearFrom
  }
  
  private func setupAgeLabel() {
    ageLabel.frame = CGRect(x: 25, y: 435, width: 80, height: 30)
    ageLabel.textAlignment = .left
    ageLabel.text = "Возраст"
    ageLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    ageLabel.textColor = .systemBlue
  }
  
  private func setupAgeTextFieldWithItsToolbarAndDatePicker() {
    let toolAgeTextField = UIToolbar()
    toolAgeTextField.sizeToFit()
    let flexSpaceAge = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButtonAge = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector (endEditing))
    toolAgeTextField.setItems ([flexSpaceAge,doneButtonAge], animated: true)
    ageTextField.frame = CGRect(x: 25, y: 460, width: 300, height: 30)
    ageTextField.contentVerticalAlignment = .center
    ageTextField.textAlignment = .left
    ageTextField.placeholder = "Выберите возраст"
    ageTextField.inputView = agePicker
    ageTextField.inputAccessoryView = toolAgeTextField
    ageTextField.layer.addSublayer(bottomLine(textFiled: ageTextField))
    ageTextField.textColor = .black
    agePicker.dataSource = self
    agePicker.delegate = self
  }
  
  private func setupSexLabel() {
    sexLabel.frame = CGRect(x: 25, y: 505, width: 80, height: 30)
    sexLabel.textAlignment = .left
    sexLabel.text = "Пол"
    sexLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    sexLabel.textColor = .systemBlue
  }
  
  private func setupSexTextFieldWithItsToolbarAndDatePicker() {
    let toolSexTextField = UIToolbar()
    toolSexTextField.sizeToFit()
    let flexSpaceSex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButtonSex = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector (endEditing))
    toolSexTextField.setItems([flexSpaceSex,doneButtonSex], animated: true)
    sexTextField.frame = CGRect(x: 25, y: 530, width: 300, height: 30)
    sexTextField.contentVerticalAlignment = .center
    sexTextField.textAlignment = .left
    sexTextField.placeholder = "Выберите пол"
    sexTextField.inputView = sexPicker
    sexTextField.inputAccessoryView = toolSexTextField
    sexTextField.layer.addSublayer(bottomLine(textFiled: sexTextField))
    sexTextField.inputView = sexPicker
    sexTextField.textColor = .black
    sexPicker.dataSource = self
    sexPicker.delegate = self
  }
  
  private func setupInstagramLabel() {
    instagramLabel.frame = CGRect(x: 25, y: 575, width: 100, height: 30)
    instagramLabel.textAlignment = .left
    instagramLabel.text = "Instagram"
    instagramLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
    instagramLabel.textColor = .systemBlue
  }
  
  private func setupInstagramTextField() {
    instagramTextField.frame = CGRect(x: 25, y: 600, width: 300, height: 30)
    instagramTextField.delegate = self
    instagramTextField.contentVerticalAlignment = .center
    instagramTextField.textAlignment = .left
    instagramTextField.placeholder = "Добавить Instagram"
    instagramTextField.layer.addSublayer(bottomLine(textFiled: instagramTextField))
    instagramTextField.textColor = .black
  }
  
  // MARK: - Private Methods
  private func setupView() {
    addSubviews()
    addTarget()
    setupSelfView()
    setupNavigationController()
    setupIconCardImageView()
    setupChangePhotoButton()
    setupNameLabel()
    setupNameTextField()
    setupDateLabel()
    setupDateTextFieldWithItsToolbarAndDatePicker()
    setupAgeLabel()
    setupAgeTextFieldWithItsToolbarAndDatePicker()
    setupSexLabel()
    setupSexTextFieldWithItsToolbarAndDatePicker()
    setupInstagramLabel()
    setupInstagramTextField()
    hideKeyboardWhenTappedAround()
  }
  
  private func addSubviews() {
    view.addSubview(iconCardImageView)
    view.addSubview(changePhotoButton)
    view.addSubview(nameLabel)
    view.addSubview(nameTextField)
    view.addSubview(dateLabel)
    view.addSubview(dateTextField)
    view.addSubview(ageLabel)
    view.addSubview(ageTextField)
    view.addSubview(sexLabel)
    view.addSubview(sexTextField)
    view.addSubview(instagramLabel)
    view.addSubview(instagramTextField)
  }
  
  private func addTarget() {
    changePhotoButton.addTarget(self, action: #selector(changePhotoAction), for: .touchUpInside)
    datePicker.addTarget(self, action: #selector(datePickerChange(parameDatePicker:)), for: .valueChanged)
  }
  
  @objc private func dissmis() {
    navigationController?.popViewController(animated: true)
  }
  
  @objc private func addCard() {
    print("Добавление карточки")
  }
  
  @objc private func changePhotoAction() {
    let pickerController = UIImagePickerController()
    pickerController.delegate = self
    pickerController.allowsEditing = true
    pickerController.sourceType = .photoLibrary
    present(pickerController, animated: true)
  }
  
  @objc private func datePickerChange(parameDatePicker: UIDatePicker) {
    getDateFromPicker()
  }
  
  @objc private func doneActionDate() {
    getDateFromPicker()
    endEditing()
  }
  
  private func getDateFromPicker() {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd.MM.yyyy"
    dateTextField.text = formatter.string(from: datePicker.date)
  }
  
  @objc private func endEditing() {
    view.endEditing(true)
  }
  
  private func bottomLine(textFiled: UITextField) -> CALayer {
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0, y: textFiled.frame.height + 5, width: textFiled.frame.width, height: 2)
    bottomLine.backgroundColor = UIColor.init(red: 190/255, green: 190/255, blue: 190/255, alpha: 0.3).cgColor
    return bottomLine
  }
  
  private func alertInstagram() {
    let alert = UIAlertController(title: "Введите username Instagram", message: "", preferredStyle: .alert)
    alert.addTextField { textField in
      textField.placeholder = "Например yashalava2022"
      textField.borderStyle = UITextField.BorderStyle.roundedRect
    }
    
    let actionOfOK = UIAlertAction(title: "OK", style: .default) { action in
      if let text = alert.textFields?.first {
        if let txt = text.text {
          self.instagramTextField.text = txt
        }
      }
    }
    
    let actionOfCancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
    }
    alert.addAction(actionOfOK)
    alert.addAction(actionOfCancel)
    present(alert, animated: true, completion: nil)
    
    
    
    
    if let textFields = alert.textFields {
      for textField in textFields {
        let container = textField.superview
        let effectView = container?.superview?.subviews[0]
        if effectView != nil {
          container?.backgroundColor = UIColor.clear
          effectView?.removeFromSuperview()
        }
      }
    }
  }
}

extension BirthdayCardViewController: UIImagePickerControllerDelegate {
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
}

extension BirthdayCardViewController: UINavigationControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
      iconCardImageView.image = image
    }
    picker.dismiss(animated: true, completion: nil)
  }
}

extension BirthdayCardViewController: UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    var result = 0
    if pickerView.isEqual(agePicker) {
      result = 120
    } else if pickerView.isEqual(sexPicker) {
      result = sexArray.count
    }
    return result
  }
}

extension BirthdayCardViewController: UIPickerViewDelegate {
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    var result = ""
    if pickerView.isEqual(agePicker) {
      result = "\(row)"
    } else if pickerView.isEqual(sexPicker) {
      result = "\(sexArray[row])"
    }
    return result
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    if pickerView.isEqual(agePicker) {
      ageTextField.text = "\(row)"
    } else if pickerView.isEqual(sexPicker) {
      sexTextField.text = "\(sexArray[row])"
    }
  }
}

extension BirthdayCardViewController: UITextFieldDelegate {
  func textFieldDidBeginEditing(_ textField: UITextField) {
    if textField.isEqual(instagramTextField) {
      alertInstagram()
    }
  }
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
    return false
  }
}

extension BirthdayCardViewController {
  private func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BirthdayCardViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false
    view.addGestureRecognizer(tap)
  }
  @objc private func dismissKeyboard() {
    view.endEditing(true)
  }
}

