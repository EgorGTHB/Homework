import UIKit

final class InfoViewController: UIViewController {
  //Создание UILabel navigationItemLabel
  private let navigationItemLabel = UILabel()
  //Создание UILabel fullNameLabel
  private let fullNameLabel = UILabel()
  //Создание UITextField fullNameTextField
  private let fullNameTextField = UITextField()
  //Создание UILabel numberOfGuestsLabel
  private let numberOfGuestsLabel = UILabel()
  //Создание UITextField numberOfGuestsTextField
  private let numberOfGuestsTextField = UITextField()
  //Создание UILabel tableNumberLabel
  private let tableNumberLabel = UILabel()
  //Создание UITextField tableNumberTextField
  private let tableNumberTextField = UITextField()
  //Создание UILabel tableReservationLabel
  private let tableReservationLabel = UILabel()
  //Создание UILabel prepayment
  private let prepaymentLabel = UILabel()
  //Создание UILabel vipRoom
  private let vipRoomLabel = UILabel()
  //Создание UIButton billButton
  private let billButton = UIButton(type: .system)
  //Создание UISwitch switch1
  private let switch1 = UISwitch()
  //Создание UISwitch switch2
  private let switch2 = UISwitch()
  //Создание UISwitch switch3
  private let witch3 = UISwitch()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //Установка цвета фона view
    view.backgroundColor = .white
    //Настрокйка NavigationController
    navigationItemLabel.text = "Cafe Mario"
    navigationItemLabel.font = UIFont(name: "Menlo-Bold", size: 30)
    navigationItem.titleView = navigationItemLabel
    //Настройка лэйбла email
    fullNameLabel.frame = CGRect(x: 35, y: 155, width: 80, height: 30)
    fullNameLabel.textAlignment = .center
    fullNameLabel.text = "ФИО"
    fullNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    fullNameLabel.textColor = .systemPink
    view.addSubview(fullNameLabel)
    //Настройка textField email
    fullNameTextField.frame = CGRect(x: 56, y: 190, width: 300, height: 30)
    fullNameTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    fullNameTextField.textAlignment = .left
    fullNameTextField.placeholder = "Введите ФИО"
    fullNameTextField.layer.addSublayer(bottomLine(textFiled: fullNameTextField))
    view.addSubview(fullNameTextField)
    //Настройка лэйбла numberOfGuestsLabel
    numberOfGuestsLabel.frame = CGRect(x: 32, y: 255, width: 200, height: 30)
    numberOfGuestsLabel.textAlignment = .center
    numberOfGuestsLabel.text = "Количество гостей"
    numberOfGuestsLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    numberOfGuestsLabel.textColor = .systemPink
    view.addSubview(numberOfGuestsLabel)
    //Настройка textField numberOfGuestsTextField
    numberOfGuestsTextField.frame = CGRect(x: 58, y: 290, width: 300, height: 30)
    numberOfGuestsTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    numberOfGuestsTextField.textAlignment = .left
    numberOfGuestsTextField.placeholder = "Введите количество гостей"
    numberOfGuestsTextField.layer.addSublayer(bottomLine(textFiled: numberOfGuestsTextField))
    numberOfGuestsTextField.keyboardType = UIKeyboardType.numberPad
    view.addSubview(numberOfGuestsTextField)
    //Настройка лэйбла tableNumberLabel
    tableNumberLabel.frame = CGRect(x: 35, y: 355, width: 150, height: 30)
    tableNumberLabel.textAlignment = .center
    tableNumberLabel.text = "Номер стола"
    tableNumberLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    tableNumberLabel.textColor = .systemPink
    view.addSubview(tableNumberLabel)
    //Настройка textField tableNumberTextField
    tableNumberTextField.frame = CGRect(x: 58, y: 390, width: 300, height: 30)
    tableNumberTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
    tableNumberTextField.textAlignment = .left
    tableNumberTextField.placeholder = "Введите номер стора"
    tableNumberTextField.layer.addSublayer(bottomLine(textFiled: tableNumberTextField))
    tableNumberTextField.keyboardType = UIKeyboardType.numberPad
    view.addSubview(tableNumberTextField)
    //Настройка лэйбла tableReservationLabel
    tableReservationLabel.frame = CGRect(x: 60, y: 480, width: 170, height: 30)
    tableReservationLabel.textAlignment = .center
    tableReservationLabel.text = "Бронировали стол?"
    tableReservationLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    tableReservationLabel.textColor = .systemPink
    view.addSubview(tableReservationLabel)
    //Настройка лэйбла prepaymentLabel
    prepaymentLabel.frame = CGRect(x: 45, y: 545, width: 150, height: 30)
    prepaymentLabel.textAlignment = .center
    prepaymentLabel.text = "Предоплата?"
    prepaymentLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    prepaymentLabel.textColor = .systemPink
    view.addSubview(prepaymentLabel)
    //Настройка лэйбла vipRoomLabel
    vipRoomLabel.frame = CGRect(x: 45, y: 610, width: 150, height: 30)
    vipRoomLabel.textAlignment = .center
    vipRoomLabel.text = "VIP комната?"
    vipRoomLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    vipRoomLabel.textColor = .systemPink
    view.addSubview(vipRoomLabel)
    //Настройка свитча mySwitch1
    switch1.frame = CGRect.init(x: 295, y: 483, width: 0, height: 0)
    view.addSubview(switch1)
    //Настройка свитча mySwitch2
    switch2.frame = CGRect.init(x: 295, y: 545, width: 0, height: 0)
    view.addSubview(switch2)
    //Настройка свитча mySwitch3
    witch3.frame = CGRect.init(x: 295, y: 607, width: 0, height: 0)
    view.addSubview(witch3)
    //Настройка кнопки billButton
    billButton.frame = CGRect(x: 60, y: 750, width: 295, height: 50)
    billButton.backgroundColor = .systemPink
    billButton.setTitle("Выставить счет", for: .normal)
    billButton.layer.cornerRadius = 10
    billButton.tintColor = .white
    billButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
    billButton.addTarget(self, action: #selector(billAlert), for: .touchUpInside)
    view.addSubview(billButton)
  }
  //Функция отрисовки линии под UITextField
  private func bottomLine(textFiled: UITextField) -> CALayer {
    let bottomLine = CALayer()
    bottomLine.frame = CGRect(x: 0, y: textFiled.frame.height + 5, width: textFiled.frame.width, height: 2)
    bottomLine.backgroundColor = UIColor.init(red: 190/255, green: 190/255, blue: 190/255, alpha: 0.3).cgColor
    return bottomLine
  }
  //Алерт выставления счета
  @objc private func billAlert() {
    let alertControllerOfBill = UIAlertController(title: "Выставить чек?", message: "", preferredStyle: .alert)
    let actionOfBill = UIAlertAction(title: "Чек", style: .default) { (action) in
      let billViewController = BillViewController()
      self.navigationController?.pushViewController(billViewController, animated: true)
    }
    let actionOfCancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
    }
    alertControllerOfBill.addAction(actionOfBill)
    alertControllerOfBill.addAction(actionOfCancel)
    self.present(alertControllerOfBill, animated: true, completion: nil)
  }
}
