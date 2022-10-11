import UIKit

final class ViewController: UIViewController {
  // MARK: - Private Properties
  private let slider = UISlider()
  private let bookTextView = UITextView()
  private let blackButton = UIButton(type: .system)
  private let brownButton = UIButton(type: .system)
  private let greenButton = UIButton(type: .system)
  private let grayButton = UIButton(type: .system)
  private let aButton = UIButton(type: .system)
  private let aBigButton = UIButton(type: .system)
  private let nightModeLabel = UILabel()
  private let nightModeSwitch = UISwitch()
  private let fontTextField = UITextField()
  private let fontPicker = UIPickerView()
  private var activityViewController: UIActivityViewController?
  
  private let fontsArray = ["HelveticaNeue", "Menlo", "BradleyHandITCTT-Bold"]
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupNavigationController() {
    let shareButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(handleShare))
    navigationItem.rightBarButtonItem = shareButton
  }
 
  private func setupLines() {
    Lines(color: .black)
  }
  
  private func setupBlackButton() {
    blackButton.backgroundColor = .black
    blackButton.frame = CGRect(x: 20, y: 150, width: 30, height: 30)
    blackButton.layer.cornerRadius = 15
    blackButton.tintColor = UIColor(red: 64/255, green: 159/255, blue: 88/255, alpha: 1)
    blackButton.layer.borderWidth = 1
    blackButton.layer.borderColor = UIColor.black.cgColor
  }
  
  private func setupBrownButton() {
    brownButton.backgroundColor = .brown
    brownButton.frame = CGRect(x: 55, y: 150, width: 30, height: 30)
    brownButton.layer.cornerRadius = 15
    brownButton.tintColor = UIColor(red: 64/255, green: 159/255, blue: 88/255, alpha: 1)
    brownButton.layer.borderWidth = 1
    brownButton.layer.borderColor = UIColor.brown.cgColor
  }
  
  private func setupGreenButton() {
    greenButton.backgroundColor = .green
    greenButton.frame = CGRect(x: 90, y: 150, width: 30, height: 30)
    greenButton.layer.cornerRadius = 15
    greenButton.tintColor = UIColor(red: 64/255, green: 159/255, blue: 88/255, alpha: 1)
    greenButton.layer.borderWidth = 1
    greenButton.layer.borderColor = UIColor.green.cgColor
  }
  
  private func setupGrayButton() {
    grayButton.backgroundColor = .gray
    grayButton.frame = CGRect(x: 125, y: 150, width: 30, height: 30)
    grayButton.layer.cornerRadius = 15
    grayButton.tintColor = UIColor(red: 64/255, green: 159/255, blue: 88/255, alpha: 1)
    grayButton.layer.borderWidth = 1
    grayButton.layer.borderColor = UIColor.gray.cgColor
  }
  
  private func setupAButton() {
    aButton.frame = CGRect(x: 20, y: 100, width: 67.5, height: 30)
    aButton.layer.borderWidth = 1
    aButton.setTitle("A", for: .normal)
    aButton.tintColor = .black
  }
  
  private func setupABigButton() {
    aBigButton.frame = CGRect(x: 86.5, y: 100, width: 67.5, height: 30)
    aBigButton.layer.borderWidth = 1
    aBigButton.setTitle("A", for: .normal)
    aBigButton.tintColor = .black
    aBigButton.titleLabel?.font = .systemFont(ofSize: 19)
  }
  
  private func setupSlider() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 15, weight: .medium)
    let image = UIImage(systemName: "circle.fill", withConfiguration: configuration)
    
    slider.frame = CGRect(x: 220, y: 103, width: 154, height: 23)
    slider.minimumValue = Float(17)
    slider.maximumValue = Float(23)
    slider.tintColor = .black
    slider.minimumTrackTintColor = .black
    slider.setThumbImage(image, for: .normal)
  }
  
  private func setupSwitchNightModeLabel() {
    nightModeLabel.frame = CGRect(x: 220, y: 155, width: 150, height: 20)
    nightModeLabel.text = "Night Mode"
    nightModeLabel.font = .systemFont(ofSize: 18)
  }
  
  private func setupNightModeSwitch() {
    nightModeSwitch.frame = CGRect(x: 320, y: 150, width: 0, height: 0)
  }
  
  private func setupBookTextView() {
    bookTextView.frame = CGRect(x: 20, y: 240, width: view.bounds.width - 45, height: view.bounds.height - 340)
    bookTextView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    bookTextView.font = .systemFont(ofSize: 17)
    bookTextView.isEditable = false
    bookTextView.textAlignment = .justified
    bookTextView.text = "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure? At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."
  }
  
  private func setupFontTextField() {
    let toolFontTextField = UIToolbar()
    toolFontTextField.sizeToFit()
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector (endEditing))
    toolFontTextField.setItems([flexSpace, doneButton], animated: true)
    
    fontTextField.inputAccessoryView = toolFontTextField
    fontTextField.frame = CGRect(x: 30, y: 190, width: 334, height: 31)
    fontTextField.inputView = fontPicker
    fontTextField.text = "Choose font"
    fontTextField.borderStyle = .roundedRect
    fontTextField.textAlignment = .center
  }
  
  private func setupFontPicker() {
    fontPicker.delegate = self
    fontPicker.dataSource = self
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupNavigationController()
    setupBlackButton()
    setupBrownButton()
    setupGreenButton()
    setupGrayButton()
    setupAButton()
    setupABigButton()
    setupSlider()
    setupSwitchNightModeLabel()
    setupNightModeSwitch()
    setupBookTextView()
    setupLines()
    setupFontTextField()
    setupFontPicker()
    addSubviews()
    addTarget()
    setupSelfView()
  }
  
  private func addSubviews() {
    [blackButton, brownButton, greenButton, grayButton, aButton, aBigButton, slider, nightModeLabel, nightModeSwitch, bookTextView, fontTextField].forEach {
      view.addSubview($0)
    }
  }
  
  private func addTarget() {
    slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
    blackButton.addTarget(self, action: #selector(changeTextColor), for: .touchUpInside)
    brownButton.addTarget(self, action: #selector(changeTextColor), for: .touchUpInside)
    greenButton.addTarget(self, action: #selector(changeTextColor), for: .touchUpInside)
    grayButton.addTarget(self, action: #selector(changeTextColor), for: .touchUpInside)
    aButton.addTarget(self, action: #selector(changeFontWeight), for: .touchUpInside)
    aBigButton.addTarget(self, action: #selector(changeFontWeight), for: .touchUpInside)
    nightModeSwitch.addTarget(self, action: #selector(nightModeAction), for: .valueChanged)
  }
  
  private func nightModeColors(bookTextViewBackgroundColor: UIColor, bookTextViewTextColor: UIColor, sliderTintColor: UIColor, aButtonTintColor: UIColor, aBigButtonTintColor: UIColor, nightModeLabelTextColor: UIColor, blackButtonLayerBorderColor: CGColor, brownButtonLayerBorderColor: CGColor, greenButtonLayerBorderColor: CGColor, grayButtonLayerBorderColor: CGColor, viewBackgroundColor: UIColor,  aButtonLayerBorderColor: CGColor, aBigButtonLayerBorderColor: CGColor, colorLines: UIColor, fontTextFieldBackgroundColor: UIColor, fontTextFieldTextColor: UIColor, sliderMinimumTrackTintColor: UIColor) {
    bookTextView.backgroundColor = bookTextViewBackgroundColor
    bookTextView.textColor = bookTextViewTextColor
    slider.tintColor = sliderTintColor
    aButton.tintColor = aButtonTintColor
    aBigButton.tintColor = aBigButtonTintColor
    nightModeLabel.textColor = nightModeLabelTextColor
    blackButton.layer.borderColor = blackButtonLayerBorderColor
    brownButton.layer.borderColor = brownButtonLayerBorderColor
    greenButton.layer.borderColor = greenButtonLayerBorderColor
    grayButton.layer.borderColor = grayButtonLayerBorderColor
    view.backgroundColor = viewBackgroundColor
    aButton.layer.borderColor = aButtonLayerBorderColor
    aBigButton.layer.borderColor = aBigButtonLayerBorderColor
    fontTextField.backgroundColor = fontTextFieldBackgroundColor
    fontTextField.textColor = fontTextFieldTextColor
    slider.minimumTrackTintColor = sliderMinimumTrackTintColor
    Lines(color: colorLines)
  }

  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  private func Lines(color: UIColor) {
    let point1: CGPoint = CGPoint(x: 0, y: 239.5)
    let point2 = CGPoint(x: 414, y: 239.5)
    let point3 = CGPoint(x: 0, y: 745)
    let point4 = CGPoint(x: 414, y: 745)
    drawLine(start: point1, toPoint: point2, ofColor: color, inView: view, shapeWidth: 0.2)
    drawLine(start: point3, toPoint: point4, ofColor: color, inView: view, shapeWidth: 0.2)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    bookTextView.resignFirstResponder()
    fontTextField.resignFirstResponder()
  }
  
  // MARK: - Actions
  @objc private func handleShare() {
    guard let text = bookTextView.text else { return }
    guard let activity = activityViewController else { return }
    activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
    present(activity, animated: true, completion: nil)
  }
  
  @objc private func nightModeAction(sender: UISwitch) {
    if sender.isOn {
      nightModeColors(bookTextViewBackgroundColor: .black, bookTextViewTextColor: .white, sliderTintColor: .white, aButtonTintColor: .white, aBigButtonTintColor: .white, nightModeLabelTextColor: .white, blackButtonLayerBorderColor: UIColor.white.cgColor, brownButtonLayerBorderColor: UIColor.white.cgColor, greenButtonLayerBorderColor: UIColor.white.cgColor, grayButtonLayerBorderColor: UIColor.white.cgColor, viewBackgroundColor: .black, aButtonLayerBorderColor: UIColor.white.cgColor, aBigButtonLayerBorderColor: UIColor.white.cgColor, colorLines: .white, fontTextFieldBackgroundColor: .black, fontTextFieldTextColor: .white, sliderMinimumTrackTintColor: .white)
    } else {
      nightModeColors(bookTextViewBackgroundColor: .white, bookTextViewTextColor: .black, sliderTintColor: .black, aButtonTintColor: .black, aBigButtonTintColor: .black, nightModeLabelTextColor: .black, blackButtonLayerBorderColor: UIColor.black.cgColor, brownButtonLayerBorderColor: UIColor.brown.cgColor, greenButtonLayerBorderColor: UIColor.green.cgColor, grayButtonLayerBorderColor: UIColor.gray.cgColor, viewBackgroundColor: .white, aButtonLayerBorderColor: UIColor.black.cgColor, aBigButtonLayerBorderColor: UIColor.black.cgColor, colorLines: .black, fontTextFieldBackgroundColor: .white, fontTextFieldTextColor: .black, sliderMinimumTrackTintColor: .black)
    }
  }
  
  @objc private func changeSlider(sender: UISlider) {
    guard sender == slider else { return }
    bookTextView.font = bookTextView.font?.withSize(CGFloat(sender.value))
  }
  
  @objc private func changeTextColor(sender: UIButton) {
    switch sender {
    case blackButton:
      bookTextView.textColor = .black
    case brownButton:
      bookTextView.textColor = .brown
    case greenButton:
      bookTextView.textColor = .green
    case grayButton:
      bookTextView.textColor = .gray
    default:
      bookTextView.textColor = .black
    }
  }
  
  @objc private func changeFontWeight(sender: UIButton) {
    guard let fontSize = bookTextView.font?.pointSize else { return }
    switch sender {
    case aButton:
      bookTextView.font = .systemFont(ofSize: fontSize, weight: .regular)
    case aBigButton:
      bookTextView.font = .systemFont(ofSize: fontSize, weight: .bold)
    default:
      bookTextView.font = .systemFont(ofSize: fontSize, weight: .regular)
    }
  }
}

// MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    guard let fontSize = bookTextView.font?.pointSize else { return }
    fontTextField.text = "\(fontsArray[row])"
    bookTextView.font = UIFont(name: "\(fontsArray[row])", size: fontSize)
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return fontsArray[row]
  }
}

// MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return fontsArray.count
  }
}
