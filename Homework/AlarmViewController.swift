import UIKit

final class AlarmViewController: UIViewController {
  // MARK: - Private Properties
  private let editButton = UIButton(type: .system)
  private let addButton = UIButton(type: .system)
  private let alarmLabel = UILabel()
  private let bedImageView = UIImageView()
  private let sleepLabel = UILabel()
  private let wakeUpLabel = UILabel()
  private let withoutAlarmLabel = UILabel()
  private let settingButton = UIButton(type: .system)
  private let othersLabel = UILabel()
  private let alarm10Label = UILabel()
  private let alarm1Label = UILabel()
  private let switch1 = UISwitch()
  private let alarm1015Label = UILabel()
  private let alarm2Label = UILabel()
  private let switch2 = UISwitch()
  private let alarm1800Label = UILabel()
  private let alarm3Label = UILabel()
  private let switch3 = UISwitch()
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupLines() {
    let point1 = CGPoint(x: 108, y: 181)
    let point2 = CGPoint(x: 108, y: 201)
    let point3 = CGPoint(x: 20, y: 215)
    let point4 = CGPoint(x: 480, y: 215)
    let point5 = CGPoint(x: 20, y: 215)
    let point6 = CGPoint(x: 414, y: 215)
    let point7 = CGPoint(x: 20, y: 275)
    let point8 = CGPoint(x: 414, y: 275)
    let point9 = CGPoint(x: 20, y: 335)
    let point10 = CGPoint(x: 414, y: 335)
    let point11 = CGPoint(x: 20, y: 450)
    let point12 = CGPoint(x: 414, y: 450)
    let point13 = CGPoint(x: 20, y: 570)
    let point14 = CGPoint(x: 414, y: 570)
    let point15 = CGPoint(x: 20, y: 690)
    let point16 = CGPoint(x: 414, y: 690)
    drawLine(start: point1, toPoint: point2, ofColor: .white, inView: self.view)
    drawLine(start: point3, toPoint: point4, ofColor: UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1), inView: self.view)
    drawLine(start: point5, toPoint: point6, ofColor: UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1), inView: self.view)
    drawLine(start: point7, toPoint: point8, ofColor: UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1), inView: self.view)
    drawLine(start: point9, toPoint: point10, ofColor: UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1), inView: self.view)
    drawLine(start: point11, toPoint: point12, ofColor: UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1), inView: self.view)
    drawLine(start: point13, toPoint: point14, ofColor: UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1), inView: self.view)
    drawLine(start: point15, toPoint: point16, ofColor: UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1), inView: self.view)
  }
  
  private func setupEditButton() {
    editButton.tintColor = .orange
    editButton.setTitle("Править", for: .normal)
    editButton.titleLabel?.font = .systemFont(ofSize: 19)
    editButton.frame = CGRect(x: 20, y: 50, width: 75, height: 85)
  }
  
  private func setupAddButton() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
    let image = UIImage(systemName: "plus", withConfiguration: configuration)
    addButton.tintColor = .orange
    addButton.imageView?.image = UIImage(systemName: "plus")
    addButton.frame = CGRect(x: 355, y: 65, width: 50, height: 50)
    addButton.setImage(image, for: .normal)
    addButton.tintColor = .orange
  }
  
  private func setupAlarmLabel() {
    alarmLabel.frame = CGRect(x: 20, y: 120, width: 163, height: 35)
    alarmLabel.textAlignment = .center
    alarmLabel.text = "Будильник"
    alarmLabel.font = .systemFont(ofSize: 30, weight: .bold)
    alarmLabel.textColor = .white
  }
  
  private func setupChevronImageView() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 16, weight: .regular)
    bedImageView.frame = CGRect(x: 20, y: 180, width: 30, height: 20)
    bedImageView.image = UIImage(systemName: "bed.double.fill", withConfiguration: configuration)
    bedImageView.tintColor = .white
  }
  
  private func setupSleepLabel() {
    sleepLabel.frame = CGRect(x: 53, y: 180, width: 50, height: 20)
    sleepLabel.textAlignment = .center
    sleepLabel.text = "Сон"
    sleepLabel.font = .systemFont(ofSize: 23, weight: .bold)
    sleepLabel.textColor = .white
  }
  
  private func setupWakeUpLabel() {
    wakeUpLabel.frame = CGRect(x: 110, y: 178, width: 170, height: 25)
    wakeUpLabel.textAlignment = .center
    wakeUpLabel.text = "Пробуждение"
    wakeUpLabel.font = .systemFont(ofSize: 23, weight: .bold)
    wakeUpLabel.textColor = .white
  }
  
  private func setupWithoutAlarmLabel() {
    withoutAlarmLabel.frame = CGRect(x: 20, y: 225, width: 155, height: 35)
    withoutAlarmLabel.textAlignment = .center
    withoutAlarmLabel.text = "Нет будильника"
    withoutAlarmLabel.font = .systemFont(ofSize: 20, weight: .regular)
    withoutAlarmLabel.textColor = .gray
  }
  
  private func setupSettingButton() {
    settingButton.frame = CGRect(x: 260, y: 227, width: 140, height: 35)
    settingButton.backgroundColor = UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1)
    settingButton.setTitle("НАСТРОИТЬ", for: .normal)
    settingButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
    settingButton.layer.cornerRadius = 20
    settingButton.tintColor = .orange
  }
  
  private func setupOthersLabel() {
    othersLabel.frame = CGRect(x: 20, y: 300, width: 100, height: 25)
    othersLabel.textAlignment = .center
    othersLabel.text = "Другие"
    othersLabel.font = .systemFont(ofSize: 23, weight: .bold)
    othersLabel.textColor = .white
  }
  
  private func setupAlarm10Label() {
    alarm10Label.frame = CGRect(x: 20, y: 350, width: 170, height: 55)
    alarm10Label.textAlignment = .center
    alarm10Label.text = "10:00"
    alarm10Label.textColor = .gray
    alarm10Label.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 65)
  }
  
  private func setupAlarm1Label() {
    alarm1Label.frame = CGRect(x: 20, y: 410, width: 100, height: 25)
    alarm1Label.textAlignment = .center
    alarm1Label.text = "Будильник"
    alarm1Label.font = .systemFont(ofSize: 18, weight: .regular)
    alarm1Label.textColor = .gray
  }
  
  private func setup1Switch() {
    switch1.frame = CGRect(x: 350, y: 375, width: 0, height: 0)
  }
  
  private func setupAlarm1015Label() {
    alarm1015Label.frame = CGRect(x: 20, y: 470, width: 150, height: 55)
    alarm1015Label.textAlignment = .center
    alarm1015Label.text = "10:15"
    alarm1015Label.textColor = .gray
    alarm1015Label.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 65)
  }
  
  private func setupAlarm2Label() {
    alarm2Label.frame = CGRect(x: 20, y: 530, width: 100, height: 25)
    alarm2Label.textAlignment = .center
    alarm2Label.text = "Будильник"
    alarm2Label.font = .systemFont(ofSize: 18, weight: .regular)
    alarm2Label.textColor = .gray
  }
  
  private func setup2Switch() {
    switch2.frame = CGRect(x: 350, y: 495, width: 0, height: 0)
  }
  
  private func setupAlarm1800Label() {
    alarm1800Label.frame = CGRect(x: 20, y: 590, width: 170, height: 55)
    alarm1800Label.textAlignment = .center
    alarm1800Label.text = "18:00"
    alarm1800Label.textColor = .gray
    alarm1800Label.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 65)
  }
  
  private func setupAlarm3Label() {
    alarm3Label.frame = CGRect(x: 20, y: 650, width: 100, height: 25)
    alarm3Label.textAlignment = .center
    alarm3Label.text = "Будильник"
    alarm3Label.font = .systemFont(ofSize: 18, weight: .regular)
    alarm3Label.textColor = .gray
  }
  
  private func setup3Switch() {
    switch3.frame = CGRect(x: 350, y: 615, width: 0, height: 0)
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupLines()
    setupEditButton()
    setupAddButton()
    setupAlarmLabel()
    setupChevronImageView()
    setupSleepLabel()
    setupWakeUpLabel()
    setupWithoutAlarmLabel()
    setupSettingButton()
    setupWakeUpLabel()
    setupOthersLabel()
    setupAlarm10Label()
    setupAlarm1Label()
    setup1Switch()
    setupAlarm1015Label()
    setupAlarm2Label()
    setup2Switch()
    setupAlarm1800Label()
    setupAlarm3Label()
    setup3Switch()
    addSubviews()
    setupSelfView()
  }
  
  private func addSubviews() {
    [editButton, addButton, alarmLabel, bedImageView,
     sleepLabel, wakeUpLabel, withoutAlarmLabel,
     settingButton, othersLabel, alarm10Label, alarm1Label,
     switch1, alarm1015Label, alarm2Label, switch2,
     alarm1800Label, alarm3Label, switch3].forEach {
      view.addSubview($0)
    }
  }
 
  private func setupSelfView() {
    view.backgroundColor = .black
  }
}

 
