import UIKit

final class SharingPickerViewController: UIViewController {
  // MARK: - Private Properties
  private let textfield = UITextField()
  private let choicePicker = UIPickerView()
  private var activityViewController: UIActivityViewController? 
  
  private let array = ["Нравится", "Не нравится", "Поделиться"]
  
  // MARK: - UIViewController()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func createPicker() {
    choicePicker.frame = CGRect(x: 107, y: 500, width: 200, height: 100)
    choicePicker.delegate = self
    choicePicker.dataSource = self
  }
  
  private func createTextfield() {
    textfield.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
    textfield.center = view.center
    textfield.delegate = self
    textfield.borderStyle = .roundedRect
    textfield.text = "Хотя бы что-то"
  }
  
  // MARK: - Private Methods
  private func setupView() {
    hideKeyboardWhenTappedAround()
    createPicker()
    createTextfield()
    addSubviews()
    setupSelfView()
  }
  
  private func addSubviews() {
    view.addSubview(textfield)
    view.addSubview(choicePicker)
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  @objc func handleShare(paramSender: Any) {
    guard let text = textfield.text else { return }
    if text.isEmpty {
      let message = "Сначало введите текст, потом нажмите кнопку"
      let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
      let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
      alertController.addAction(action)
      present(alertController, animated: true, completion: nil)
    }
  }
}

extension SharingPickerViewController: UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return array.count
  }
}

extension SharingPickerViewController: UIPickerViewDelegate {
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    let result = array[row]
    return result
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    guard array[row] == "Поделиться" else { return }
    activityViewController = UIActivityViewController(activityItems: [textfield.text ?? "nil"], applicationActivities: nil)
    guard let ac = activityViewController else { return }
    present(ac, animated: true, completion: nil)
  }
}
