import UIKit

final class TimerViewController: UIViewController {
  // MARK: - Private Properties
  private let picker = UIPickerView()
  private let startButton = UIButton(type: .system)
  private let cancelButton = UIButton(type: .system)
  private let endActionButton = UIButton()
  private let endLabel = UILabel()
  private let stopLabel = UILabel()
  private let chevronImageView = UIImageView()
  
  var hour: Int = 0
  var minutes: Int = 0
  var seconds: Int = 0
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupPicker() {
    picker.delegate = self
    picker.dataSource = self
    picker.frame = CGRect(x: 50, y: 200, width: 314, height: 160)
    picker.setValue(UIColor.white, forKeyPath: "textColor")
  }
  
  private func setupCancelButton() {
    cancelButton.backgroundColor = UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1)
    cancelButton.setTitle("Отмена", for: .normal)
    cancelButton.titleLabel?.font =  .systemFont(ofSize: 20)
    cancelButton.frame = CGRect(x: 20, y: 450, width: 85, height: 85)
    cancelButton.layer.cornerRadius = 43
    cancelButton.tintColor = UIColor(red: 75/255, green: 75/255, blue: 76/255, alpha: 1)
  }
  
  private func setupStartButton() {
    startButton.backgroundColor = UIColor(red: 11/255, green: 31/255, blue: 14/255, alpha: 1)
    startButton.setTitle("Старт", for: .normal)
    startButton.titleLabel?.font =  .systemFont(ofSize: 20)
    startButton.frame = CGRect(x: 319, y: 450, width: 85, height: 85)
    startButton.layer.cornerRadius = 43
    startButton.tintColor = UIColor(red: 64/255, green: 159/255, blue: 88/255, alpha: 1)
  }
  
  private func setupEndActionButton() {
    endActionButton.backgroundColor = UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1)
    endActionButton.contentHorizontalAlignment = .left
    endActionButton.frame = CGRect(x: 20, y: 650, width: 374, height: 50)
    endActionButton.layer.cornerRadius = 10
    endActionButton.tintColor = UIColor(red: 183/255, green: 183/255, blue: 186/255, alpha: 1)
    endActionButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
  }
  
  private func setupEndLabel() {
    endLabel.frame = CGRect(x: 25, y: 659, width: 150, height: 30)
    endLabel.textAlignment = .center
    endLabel.text = "По окончании"
    endLabel.font = .systemFont(ofSize: 20, weight: .regular)
    endLabel.textColor = .white
  }
  
  private func setupStopLabel() {
    stopLabel.frame = CGRect(x: 225, y: 659, width: 150, height: 30)
    stopLabel.textAlignment = .center
    stopLabel.text = "Остановить"
    stopLabel.font = .systemFont(ofSize: 20, weight: .regular)
    stopLabel.textColor = .gray
  }
  
  private func setupChevronImageView() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 16, weight: .regular)
    
    chevronImageView.frame = CGRect(x: 360, y: 668, width: 13, height: 15)
    chevronImageView.image = UIImage(systemName: "chevron.right", withConfiguration: configuration)
    chevronImageView.tintColor = .gray
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupPicker()
    setupCancelButton()
    setupStartButton()
    setupEndActionButton()
    setupEndLabel()
    setupStopLabel()
    setupChevronImageView()
    addSubviews()
    addTarget()
  }
  
  private func addSubviews() {
    view.addSubview(picker)
    view.addSubview(cancelButton)
    view.addSubview(startButton)
    view.addSubview(endActionButton)
    view.addSubview(endLabel)
    view.addSubview(stopLabel)
    view.addSubview(chevronImageView)
  }
  
  private func addTarget() {
    endActionButton.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
    endActionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    
  }
  
   @objc private func buttonPressed(sender: UIButton) {
    sender.backgroundColor = UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1)
  }
  
  @objc private func buttonTapped(sender: UIButton) {
    sender.backgroundColor = UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1)
  }
}

extension TimerViewController: UIPickerViewDelegate {
  
  func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
    return pickerView.frame.size.width / 3
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    switch component {
    case 0:
      return "\(row) ч"
    case 1:
      return "\(row) мин"
    case 2:
      return "\(row) с"
    default:
      return ""
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    switch component {
    case 0:
      hour = row
    case 1:
      minutes = row
    case 2:
      seconds = row
    default:
      break
    }
  }
}

extension TimerViewController: UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 3
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    switch component {
    case 0:
      return 24
    case 1, 2:
      return 60
    default:
      return 0
    }
  }
}

