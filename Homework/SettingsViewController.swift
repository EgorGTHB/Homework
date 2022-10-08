import UIKit
import AVFoundation

final class SettingsViewController: UIViewController {
  // MARK: - Private Properties
  private let personalDataLabel = UILabel()
  private let heightLabel = UILabel()
  private let heightTextfield = UITextField()
  private let heightPickerView = UIPickerView()
  private let weightLabel = UILabel()
  private let weightTextfield = UITextField()
  private let weightPickerView = UIPickerView()
  private let soundsLabel = UILabel()
  private let volumeLabel = UILabel()
  private let volumeSlider = UISlider()
  private let voiceGuidanceLabel = UILabel()
  private let switch1 = UISwitch()
  private let notificationsLabel = UILabel()
  private let timetableLabel = UILabel()
  private let cloudLabel = UILabel()
  private let dataSynchronizationLabel = UILabel()
  private let switch2 = UISwitch()
  private let exitButton = UIButton(type: .system)
 
  private var player = AVAudioPlayer()
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupNavigationController() {
    navigationItem.backBarButtonItem?.tintColor = .black
    title = "Настройки"
  }
  
  private func setupLines() {
    let pointHW1 = CGPoint(x: 20, y: 161)
    let pointHW2 = CGPoint(x: 414, y: 161)
    let point1 = CGPoint(x: 0, y: 212)
    let point2 = CGPoint(x: 414, y: 212)
    let pointVolume1 = CGPoint(x: 20, y: 332)
    let pointVolume2 = CGPoint(x: 414, y: 332)
    let point3 = CGPoint(x: 0, y: 392)
    let point4 = CGPoint(x: 414, y: 392)
    let point5 = CGPoint(x: 0, y: 492)
    let point6 = CGPoint(x: 414, y: 492)
    let point7 = CGPoint(x: 0, y: 592)
    let point8 = CGPoint(x: 414, y: 592)
    drawLine(start: point1, toPoint: point2, ofColor: .black, inView: view, shapeWidth: 1)
    drawLine(start: pointHW1, toPoint: pointHW2, ofColor: .gray, inView: view, shapeWidth: 0.5)
    drawLine(start: pointVolume1, toPoint: pointVolume2, ofColor: .gray, inView: view, shapeWidth: 0.5)
    drawLine(start: point3, toPoint: point4, ofColor: .black, inView: view, shapeWidth: 1)
    drawLine(start: point5, toPoint: point6, ofColor: .black, inView: view, shapeWidth: 1)
    drawLine(start: point7, toPoint: point8, ofColor: .black, inView: view, shapeWidth: 1)
  }
  
  private func setupPersonalDataLabel() {
    personalDataLabel.frame = CGRect(x: 20, y: 100, width: 145, height: 31)
    personalDataLabel.text = "Личные данные"
    personalDataLabel.font = UIFont.boldSystemFont(ofSize: 18)
  }
  
  private func setupHeightLabel() {
    heightLabel.frame = CGRect(x: 25, y: 130, width: 45, height: 31)
    heightLabel.text = "Рост"
  }
  
  private func setupHeightTextfield() {
    let toolHeightTextfield = UIToolbar()
    toolHeightTextfield.sizeToFit()
    let flexSpaceSex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButtonSex = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector (endEditing))
    toolHeightTextfield.setItems([flexSpaceSex,doneButtonSex], animated: true)
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: heightTextfield.frame.height))
    heightTextfield.inputAccessoryView = toolHeightTextfield
    heightTextfield.rightView = paddingView
    heightTextfield.rightViewMode = .always
    heightTextfield.frame = CGRect(x: 70, y: 130, width: 324, height: 31)
    heightTextfield.textAlignment = .right
    heightTextfield.text = "60 см"
    heightTextfield.inputView = heightPickerView
    heightTextfield.textColor = .black
  }
  
  private func setupHeightPickerView() {
    heightPickerView.tag = 0
    heightPickerView.delegate = self
    heightPickerView.dataSource = self
  }
  
  private func setupWeightLabel() {
    weightLabel.frame = CGRect(x: 25, y: 162, width: 45, height: 31)
    weightLabel.text = "Вес"
  }
  
  private func setupWeightTextfield() {
    let toolWeightTextfield = UIToolbar()
    toolWeightTextfield.sizeToFit()
    let flexSpaceSex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButtonSex = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector (endEditing))
    toolWeightTextfield.setItems([flexSpaceSex, doneButtonSex], animated: true)
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: heightTextfield.frame.height))
    weightTextfield.inputAccessoryView = toolWeightTextfield
    weightTextfield.rightView = paddingView
    weightTextfield.rightViewMode = .always
    weightTextfield.frame = CGRect(x: 70, y: 162, width: 324, height: 31)
    weightTextfield.textAlignment = .right
    weightTextfield.text = "40 кг"
    weightTextfield.inputView = weightPickerView
    weightTextfield.textColor = .black
  }
  
  private func setupWeightPickerView() {
    weightPickerView.tag = 1
    weightPickerView.delegate = self
    weightPickerView.dataSource = self
  }
  
  private func setupSoundsLabel() {
    soundsLabel.frame = CGRect(x: 20, y: 222, width: 60, height: 31)
    soundsLabel.text = "Звуки"
    soundsLabel.font = .boldSystemFont(ofSize: 18)
  }
  
  private func setupVolumeLabel() {
    volumeLabel.frame = CGRect(x: 25, y: 262, width: 200, height: 31)
    volumeLabel.text = "Громкость сигнала"
  }
  
  private func setupSlider() {
    volumeSlider.frame = CGRect(x: 20, y: 292, width: 374, height: 23)
    volumeSlider.value = 0.5
    volumeSlider.tintColor = .black
  }
  
  private func setupVoiceGuidanceLabel() {
    voiceGuidanceLabel.frame = CGRect(x: 25, y: 342, width: 250, height: 31)
    voiceGuidanceLabel.text = "Голосовое сопровождение"
  }
  
  private func setup1Switch() {
    switch1.frame = CGRect(x: 350, y: 342, width: 0, height: 0)
    switch1.onTintColor = .black
  }
  
  private func setupNotificationsLabel() {
    notificationsLabel.frame = CGRect(x: 20, y: 402, width: 150, height: 31)
    notificationsLabel.text = "Уведомления"
    notificationsLabel.font = .boldSystemFont(ofSize: 18)
  }
  
  private func setupTimetableLabel() {
    timetableLabel.frame = CGRect(x: 25, y: 442, width: 250, height: 31)
    timetableLabel.text = "Расписание"
  }
  
  private func setupCloudLabel() {
    cloudLabel.frame = CGRect(x: 20, y: 502, width: 150, height: 31)
    cloudLabel.text = "Облако"
    cloudLabel.font = .boldSystemFont(ofSize: 18)
  }
  
  private func setupDataSynchronizationLabel() {
    dataSynchronizationLabel.frame = CGRect(x: 25, y: 542, width: 250, height: 31)
    dataSynchronizationLabel.text = "Синхронизировать данные"
  }
  
  private func setup2Switch() {
    switch2.frame = CGRect(x: 350, y: 542, width: 0, height: 0)
    switch2.onTintColor = .black
  }
  
  private func setupExitButton() {
    exitButton.setTitle("Выйти", for: .normal)
    exitButton.setTitleColor(UIColor(ciColor: .red), for: .normal)
    exitButton.frame = CGRect(x: 157, y: 700, width: 100, height: 40)
    exitButton.titleLabel?.font = .systemFont(ofSize: 20)
    exitButton.layer.cornerRadius = 8
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupNavigationController()
    setupLines()
    setupPlayer()
    setupPersonalDataLabel()
    setupHeightLabel()
    setupHeightTextfield()
    setupHeightPickerView()
    setupWeightLabel()
    setupWeightTextfield()
    setupWeightPickerView()
    setupSoundsLabel()
    setupVolumeLabel()
    setupSlider()
    setupVoiceGuidanceLabel()
    setup1Switch()
    setupNotificationsLabel()
    setupTimetableLabel()
    setupCloudLabel()
    setupDataSynchronizationLabel()
    setup2Switch()
    setupExitButton()
    addSubviews()
    addTarget()
    setupSelfView()
  }
  
  private func addSubviews() {
    [personalDataLabel, heightLabel, heightTextfield, weightLabel, weightTextfield, soundsLabel, volumeLabel, volumeSlider, voiceGuidanceLabel, switch1, notificationsLabel, timetableLabel, cloudLabel, dataSynchronizationLabel, switch2, exitButton].forEach {
      view.addSubview($0)
    }
  }
  
  private func addTarget() {
    volumeSlider.addTarget(self, action: #selector(changeSliderVolume), for: .touchUpInside)
    exitButton.addTarget(self, action: #selector(toSignInViewController), for: .touchUpInside)
  }
  
  @objc private func toSignInViewController() {
    let signInViewController = SignInViewController()
    self.navigationController?.pushViewController(signInViewController, animated: true)
  }
  
  private func setupPlayer() {
    do{
      guard let audioPath = Bundle.main.path(forResource: "звук", ofType: "mp3") else { return }
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
    } catch {
      print("Error")
    }
    player.volume = 0.5
  }
  
  @objc private func changeSliderVolume(sender: UISlider) {
    guard sender == volumeSlider else { return }
    player.play()
    player.volume = sender.value
  }
}

extension SettingsViewController: UIPickerViewDelegate {
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    switch pickerView.tag {
    case 0:
      return "\(row + 60) см"
    case 1:
      return "\(row + 40) кг"
    default:
      return "Ошибка"
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    switch pickerView.tag {
    case 0:
      heightTextfield.text = "\(row + 60) см"
    case 1:
      weightTextfield.text = "\(row + 40) кг"
    default:
      return
    }
  }
}

extension SettingsViewController: UIPickerViewDataSource {
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    switch pickerView.tag {
    case 0:
      return 199
    case 1:
      return 179
    default:
      return 0
    }
  }
}

