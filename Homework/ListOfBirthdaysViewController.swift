import UIKit

final class ListOfBirthdaysViewController: UIViewController {
  // MARK: - Private Properties
  private let navigationItemLabel = UILabel()
  private let iconJeremyImageView = UIImageView()
  private let jeremyLabel = UILabel()
  private let descriptionOfJeremyBirthdayLabel = UILabel()
  private let jeremyDaysLabel = UILabel()
  private let iconMariaLuiImageView = UIImageView()
  private let mariaLuiLabel = UILabel()
  private let descriptionOfMariaLuiBirthdayLabel = UILabel()
  private let mariaLuiDaysLabel = UILabel()
  private let iconJonyStarkImageView = UIImageView()
  private let jonyStarkLabel = UILabel()
  private let descriptionOfJonyStarkBirthdayLabel = UILabel()
  private let jonyStarkDaysLabel = UILabel()
  
  private let icon = UIImage(named: "Iconnn")
  
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
    navigationItemLabel.text = "Birthday"
    navigationItemLabel.font = UIFont(name: "Menlo-Bold", size: 18)
    navigationItem.titleView = navigationItemLabel
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
  }
  
  private func setupIconJeremyImageView() {
    iconJeremyImageView.image = icon
    iconJeremyImageView.frame = CGRect(x: 5, y: 163, width: 70, height: 70)
  }
  
  private func setupJeremyLabel() {
    jeremyLabel.frame = CGRect(x: 80, y: 170, width: 150, height: 30)
    jeremyLabel.text = "Jeremy"
    jeremyLabel.font = UIFont.systemFont(ofSize: 19, weight: .heavy)
    jeremyLabel.textColor = .black
  }
  
  private func setupDescriptionOfJeremyBirthdayLabel() {
    descriptionOfJeremyBirthdayLabel.frame = CGRect(x: 80, y: 195, width: 400, height: 30)
    descriptionOfJeremyBirthdayLabel.text = "10 марта, в среду исполнится 25 лет"
    descriptionOfJeremyBirthdayLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    descriptionOfJeremyBirthdayLabel.textColor = .gray
  }
  
  private func setupLines() {
    let pointJeremy1 = CGPoint(x: 20, y: 240)
    let pointJeremy2 = CGPoint(x: 415, y: 240)
    let pointMariaLui1 = CGPoint(x: 20, y: 360)
    let pointMariaLui2 = CGPoint(x: 415, y: 360)
    let pointJonyStark1 = CGPoint(x: 20, y: 480)
    let pointJonyStark2 = CGPoint(x: 415, y: 480)
    drawLine(start: pointJeremy1, toPoint: pointJeremy2, ofColor: .lightGray, inView: view)
    drawLine(start: pointMariaLui1, toPoint: pointMariaLui2, ofColor: .lightGray, inView: view)
    drawLine(start: pointJonyStark1, toPoint: pointJonyStark2, ofColor: .lightGray, inView: view)
  }
  
  private func setupJeremyDaysLabel() {
    let diffDateForJeremy = dateDifference(day: 10, month: 3, year: 2022)
    jeremyDaysLabel.frame = CGRect(x: 310, y: 170, width: 130, height: 30)
    jeremyDaysLabel.text = "\(diffDateForJeremy) дней"
    jeremyDaysLabel.font = UIFont.systemFont(ofSize: 19, weight: .medium)
    jeremyDaysLabel.textColor = .gray
  }
  
  private func setupIconMariaLuiImageView() {
    iconMariaLuiImageView.image = icon
    iconMariaLuiImageView.frame = CGRect(x: 5, y: 283, width: 70, height: 70)
  }
  
  private func setupMariaLuiLabel() {
    mariaLuiLabel.frame = CGRect(x: 80, y: 290, width: 200, height: 30)
    mariaLuiLabel.text = "Maria Lui"
    mariaLuiLabel.font = UIFont.systemFont(ofSize: 19, weight: .heavy)
    mariaLuiLabel.textColor = .black
  }
  private func setupDescriptionOfMariaLuiBirthdayLabel() {
    descriptionOfMariaLuiBirthdayLabel.frame = CGRect(x: 80, y: 315, width: 400, height: 30)
    descriptionOfMariaLuiBirthdayLabel.text = "30 марта, в четверг исполниться 20 лет"
    descriptionOfMariaLuiBirthdayLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    descriptionOfMariaLuiBirthdayLabel.textColor = .lightGray
  }
  
  private func setupMariaLuiDaysLabel() {
    let diffDateForMariaLui = dateDifference(day: 30, month: 3, year: 2022)
    mariaLuiDaysLabel.frame = CGRect(x: 320, y: 290, width: 130, height: 30)
    mariaLuiDaysLabel.text = "\(diffDateForMariaLui) дней"
    mariaLuiDaysLabel.font = UIFont.systemFont(ofSize: 19, weight: .medium)
    mariaLuiDaysLabel.textColor = .gray
  }
  
  private func setupIconJonyStarkImageView() {
    iconJonyStarkImageView.image = icon
    iconJonyStarkImageView.frame = CGRect(x: 5, y: 403, width: 70, height: 70)
  }
  
  private func setupJonyStarkLabel() {
    jonyStarkLabel.frame = CGRect(x: 80, y: 410, width: 200, height: 30)
    jonyStarkLabel.text = "Jony Stark"
    jonyStarkLabel.font = UIFont.systemFont(ofSize: 19, weight: .heavy)
    jonyStarkLabel.textColor = .black
  }
  
  private func setupDescriptionOfJonyStarkBirthdayLabel() {
    descriptionOfJonyStarkBirthdayLabel.frame = CGRect(x: 80, y: 435, width: 400, height: 30)
    descriptionOfJonyStarkBirthdayLabel.text = "20 апреля, в четверг исполниться 25 лет"
    descriptionOfJonyStarkBirthdayLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    descriptionOfJonyStarkBirthdayLabel.textColor = .lightGray
  }
  
  private func setupJonyStarkDaysLabel() {
    let diffDateForJonyStark = dateDifference(day: 20, month: 4, year: 2022)
    jonyStarkDaysLabel.frame = CGRect(x: 320, y: 410, width: 130, height: 30)
    jonyStarkDaysLabel.text = "\(diffDateForJonyStark) дней"
    jonyStarkDaysLabel.text = "53 дней"
    jonyStarkDaysLabel.font = UIFont.systemFont(ofSize: 19, weight: .medium)
    jonyStarkDaysLabel.textColor = .gray
  }
  
  // MARK: - Private Methods
  private func setupView() {
    addSubviews()
    setupSelfView()
    setupNavigationController()
    setupIconJeremyImageView()
    setupJeremyLabel()
    setupDescriptionOfJeremyBirthdayLabel()
    setupLines()
    setupJeremyDaysLabel()
    setupIconMariaLuiImageView()
    setupMariaLuiLabel()
    setupDescriptionOfMariaLuiBirthdayLabel()
    setupMariaLuiDaysLabel()
    setupIconJonyStarkImageView()
    setupJonyStarkLabel()
    setupDescriptionOfJonyStarkBirthdayLabel()
    setupJonyStarkDaysLabel()
  }
  
  private func addSubviews() {
    view.addSubview(iconJeremyImageView)
    view.addSubview(jeremyLabel)
    view.addSubview(descriptionOfJeremyBirthdayLabel)
    view.addSubview(jeremyDaysLabel)
    view.addSubview(iconMariaLuiImageView)
    view.addSubview(mariaLuiLabel)
    view.addSubview(descriptionOfMariaLuiBirthdayLabel)
    view.addSubview(mariaLuiDaysLabel)
    view.addSubview(iconJonyStarkImageView)
    view.addSubview(jonyStarkLabel)
    view.addSubview(descriptionOfJonyStarkBirthdayLabel)
    view.addSubview(jonyStarkDaysLabel)
  }
  
  @objc private func addTapped() {
    let birthdayСardViewController = BirthdayCardViewController()
    navigationController?.pushViewController(birthdayСardViewController, animated: true)
  }
  
  private func dateDifference(day: Int, month: Int, year: Int) -> Int {
    var difference = 0
    var birthdayDateComponents = DateComponents()
    birthdayDateComponents.day = day
    birthdayDateComponents.month = month
    birthdayDateComponents.year = year
    let calendar = Calendar.current
    let birthday = calendar.date(from: birthdayDateComponents)
    if let birth = birthday {
      let dateDiff = Calendar.current.dateComponents([.day], from: birth, to: Date()).day
      if let diff = dateDiff {
        difference = diff
      }
    }
    return difference
  }
  
  private func drawLine(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
    let path = UIBezierPath()
    path.move(to: start)
    path.addLine(to: end)
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    shapeLayer.strokeColor = lineColor.cgColor
    shapeLayer.lineWidth = 1.3
    view.layer.addSublayer(shapeLayer)
  }
}
