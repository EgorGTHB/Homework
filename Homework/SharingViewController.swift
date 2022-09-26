import UIKit

final class SharingViewController: UIViewController {
  // MARK: - Private Properties
  private var shareButton = UIButton(type: .system)
  private var nextVCButton = UIButton(type: .system)
  private var textfield = UITextField()
  private var activityViewController: UIActivityViewController? = nil
  
  // MARK: - UIViewController()
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  func createTextfield() {
    textfield.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
    textfield.center = view.center
    textfield.delegate = self
    textfield.borderStyle = .roundedRect
    textfield.placeholder = "Enter text to share"
  }
  
  func createButton() {
    shareButton.frame = CGRect(x: 157, y: 500, width: 100, height: 44)
    shareButton.setTitle("Расшарить", for: .normal)
    shareButton.backgroundColor = .black
  }
  
  func createNextVCButton() {
    nextVCButton.frame = CGRect(x: 157, y: 700, width: 100, height: 44)
    nextVCButton.setTitle("NextVC", for: .normal)
    nextVCButton.backgroundColor = .black
  }
  
  // MARK: - Private Methods
  private func setupView() {
    hideKeyboardWhenTappedAround()
    createTextfield()
    createButton()
    createNextVCButton()
    addSubviews()
    setupSelfView()
    addTarget()
  }
  
  private func addSubviews() {
    view.addSubview(textfield)
    view.addSubview(shareButton)
    view.addSubview(nextVCButton)
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  private func addTarget() {
    shareButton.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
    nextVCButton.addTarget(self, action: #selector(toSharingPickerViewController), for: .touchUpInside)
  }
  
  @objc func handleShare(paramSender: Any) {
    let text = textfield.text
    if text?.count == 0 {
      let message = "Сначало введите текст, потом нажмите кнопку"
      let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
      let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
      alertController.addAction(action)
      present(alertController, animated: true, completion: nil)
    }
    guard let image = UIImage(named: "facebook") else { return }
    guard let textOfTextfield = textfield.text else { return }
    activityViewController = UIActivityViewController(activityItems: [textOfTextfield, image], applicationActivities: nil)
    present(activityViewController!, animated: true, completion: nil)
  }
  
  @objc private func toSharingPickerViewController() {
    let sharingPickerViewController = SharingPickerViewController()
    navigationController?.pushViewController(sharingPickerViewController, animated: true)
  }
}

extension UIViewController: UITextFieldDelegate {
  public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
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
