import UIKit

final class BillViewController: UIViewController {
  //Создание UILabel navigationItemLabel
  private let navigationItemLabel = UILabel()
  //Создание UIButton resultButton
  private let resultButton = UIButton(type: .system)
  //Создание UILabel caesarSaladLabel
  private let caesarSaladLabel = UILabel()
  //Создание UILabel recipeCaesarSaladLabel
  private let recipeCaesarSaladLabel = UILabel()
  //Создание UILabel priceCaesarSaladLabel
  private let priceCaesarSaladLabel = UILabel()
  //Создание UIImageView rightArrowImageView1
  private let rightArrowImageView1 = UIImageView()
  //Создание UILabel greekSaladLabel
  private let greekSaladLabel = UILabel()
  //Создание UILabel recipeGreekSaladLabel
  private let recipeGreekSaladLabel = UILabel()
  //Создание UILabel priceGreekSaladLabel
  private let priceGreekSaladLabel = UILabel()
  //Создание UIImageView rightArrowImageView2
  private let rightArrowImageView2 = UIImageView()
  //Создание UIImage rightArrowImage
  private let rightArrowImage = UIImage(named: "rightArrowImage")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //Установка цвета фона view
    view.backgroundColor = .white
    //Настрокйка NavigationController
    navigationItemLabel.text = "Чек"
    navigationItemLabel.font = UIFont(name: "Menlo-Bold", size: 30)
    navigationItem.titleView = navigationItemLabel
    //Настройка лэйбла caesarSaladLabel
    caesarSaladLabel.frame = CGRect(x: 15, y: 170, width: 150, height: 30)
    caesarSaladLabel.text = "Салат Цезарь"
    caesarSaladLabel.font = UIFont.systemFont(ofSize: 19, weight: .heavy)
    caesarSaladLabel.textColor = .black
    view.addSubview(caesarSaladLabel)
    //Настройка лэйбла recipeCaesarSaladLabel
    recipeCaesarSaladLabel.frame = CGRect(x: 15, y: 195, width: 400, height: 30)
    recipeCaesarSaladLabel.text = "Помидор, салат айсберг, сухарики, курица"
    recipeCaesarSaladLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    recipeCaesarSaladLabel.textColor = .gray
    view.addSubview(recipeCaesarSaladLabel)
    //Настройка линии под салатом Цезарь
    let pointСaesarSalad1 = CGPoint(x: 20, y: 240)
    let pointСaesarSalad2 = CGPoint(x: 415, y: 240)
    drawLine(start: pointСaesarSalad1, toPoint: pointСaesarSalad2, ofColor: .lightGray, inView: self.view)
    //Настройка лэйбла priceCaesarSaladLabel
    priceCaesarSaladLabel.frame = CGRect(x: 320, y: 170, width: 70, height: 30)
    priceCaesarSaladLabel.text = "300 р"
    priceCaesarSaladLabel.font = UIFont.systemFont(ofSize: 19, weight: .medium)
    priceCaesarSaladLabel.textColor = .gray
    view.addSubview(priceCaesarSaladLabel)
    //Настройка стрелки вправо напротив салата Цезаря
    rightArrowImageView1.image = rightArrowImage
    rightArrowImageView1.frame = CGRect(x: 380, y: 174, width: 17, height: 17)
    view.addSubview(rightArrowImageView1)
    //Настройка лэйбла greekSaladLabel
    greekSaladLabel.frame = CGRect(x: 15, y: 290, width: 200, height: 30)
    greekSaladLabel.text = "Салат Греческий"
    greekSaladLabel.font = UIFont.systemFont(ofSize: 19, weight: .heavy)
    greekSaladLabel.textColor = .black
    view.addSubview(greekSaladLabel)
    //Настройка лэйбла recipeGreekSaladLabel
    recipeGreekSaladLabel.frame = CGRect(x: 15, y: 315, width: 400, height: 30)
    recipeGreekSaladLabel.text = "Помидор, салат айсберг, сухарики, курица"
    recipeGreekSaladLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    recipeGreekSaladLabel.textColor = .lightGray
    view.addSubview(recipeGreekSaladLabel)
    //Настройка линии под греческим салатом
    let pointGreekSalad1 = CGPoint(x: 20, y: 360)
    let pointGreekSalad2 = CGPoint(x: 415, y: 360)
    drawLine(start: pointGreekSalad1, toPoint: pointGreekSalad2, ofColor: .lightGray, inView: self.view)
    //Настройка линии в центре
    let pointCenter1 = CGPoint(x: 40, y: 410)
    let pointCenter2 = CGPoint(x: 370, y: 410)
    drawLine(start: pointCenter1, toPoint: pointCenter2, ofColor: .lightGray, inView: self.view)
    //Настройка лэйбла priceGreekSaladLabel
    priceGreekSaladLabel.frame = CGRect(x: 320, y: 290, width: 70, height: 30)
    priceGreekSaladLabel.text = "300 р"
    priceGreekSaladLabel.font = UIFont.systemFont(ofSize: 19, weight: .medium)
    priceGreekSaladLabel.textColor = .gray
    view.addSubview(priceGreekSaladLabel)
    //Настройка стрелки вправо напротив греческого салата
    rightArrowImageView2.image = rightArrowImage
    rightArrowImageView2.frame = CGRect(x: 380, y: 295, width: 17, height: 17)
    view.addSubview(rightArrowImageView2)
    //Настройка кнопки resultButton
    resultButton.frame = CGRect(x: 170, y: 700, width: 200, height: 50)
    resultButton.backgroundColor = .systemGreen
    resultButton.setTitle("итого: 700 рублей", for: .normal)
    resultButton.layer.cornerRadius = 10
    resultButton.tintColor = .white
    resultButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
    view.addSubview(resultButton)
    //Настройка линии под кнопкой
    let pointUnderButton1 = CGPoint(x: 40, y: 800)
    let pointUnderButton2 = CGPoint(x: 370, y: 800)
    drawLine(start: pointUnderButton1, toPoint: pointUnderButton2, ofColor: .lightGray, inView: self.view)
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
