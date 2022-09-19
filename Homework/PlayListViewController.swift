import UIKit

final class PlayListViewController: UIViewController {
  // MARK: - Private Properties
  private let navigationItemLabel = UILabel()
  private let september3ImageView = UIImageView()
  private let september3Label = UILabel()
  private let september3DurationLabel = UILabel()
  private let september3Button = UIButton()
  private let minutes4ImageView = UIImageView()
  private let minutes4Label = UILabel()
  private let minutes4DurationLabel = UILabel()
  private let minutes4Button = UIButton()
  
  private let september3Image = UIImage(named: "3 сентября")
  private let minutes4Image = UIImage(named: "4 Minutes")

  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupNavigationController() {
    navigationItemLabel.text = "Playlist"
    navigationItemLabel.font = UIFont(name: "AppleSymbols", size: 32)
    navigationItem.titleView = navigationItemLabel
   }
  
  private func setupSeptember3ImageView() {
    september3ImageView.image = september3Image
    september3ImageView.frame = CGRect(x: 5, y: 163, width: 70, height: 70)
  }
  
  private func setup3SeptemberLabel() {
    september3Label.frame = CGRect(x: 80, y: 185, width: 150, height: 30)
    september3Label.text = "3 сентября"
    september3Label.font = UIFont.systemFont(ofSize: 19, weight: .heavy)
    september3Label.textColor = .black
  }
  
  private func setup3SeptemberDurationLabel() {
    september3DurationLabel.frame = CGRect(x: 350, y: 185, width: 130, height: 30)
    september3DurationLabel.text = "6:21"
    september3DurationLabel.font = UIFont.systemFont(ofSize: 19, weight: .medium)
    september3DurationLabel.textColor = .gray
  }
 
  private func setup3SeptemberButton() {
    september3Button.frame = CGRect(x: 0, y: 163, width: 414, height: 77)
  }
 
  private func setupLines() {
    let pointSeptember31 = CGPoint(x: 10, y: 240)
    let pointSeptember32 = CGPoint(x: 405, y: 240)
    drawLine(start: pointSeptember31, toPoint: pointSeptember32, ofColor: .lightGray, inView: view)
    let pointMinutes41 = CGPoint(x: 10, y: 360)
    let pointMinutes42 = CGPoint(x: 405, y: 360)
    drawLine(start: pointMinutes41, toPoint: pointMinutes42, ofColor: .lightGray, inView: view)
  }
  
  private func setup4minutesImageView() {
    minutes4ImageView.image = minutes4Image
    minutes4ImageView.frame = CGRect(x: 5, y: 283, width: 70, height: 70)
  }
  
  private func setup4minutesLabel() {
    minutes4Label.frame = CGRect(x: 80, y: 305, width: 200, height: 30)
    minutes4Label.text = "4 minutes"
    minutes4Label.font = UIFont.systemFont(ofSize: 19, weight: .heavy)
    minutes4Label.textColor = .black
  }
  
  private func setup4minutesDurationLabel() {
    minutes4DurationLabel.frame = CGRect(x: 350, y: 305, width: 130, height: 30)
    minutes4DurationLabel.text = "3:10"
    minutes4DurationLabel.font = UIFont.systemFont(ofSize: 19, weight: .medium)
    minutes4DurationLabel.textColor = .gray
  }
  
  private func setup4minutesButton() {
    minutes4Button.frame = CGRect(x: 0, y: 283, width: 414, height: 77)
  }
  
  // MARK: - Private Methods
  private func setupView() {
    addSubviews()
    setupSelfView()
    addTarget()
    setupNavigationController()
    setupSeptember3ImageView()
    setup3SeptemberLabel()
    setup3SeptemberDurationLabel()
    setup3SeptemberButton()
    setupLines()
    setup4minutesImageView()
    setup4minutesLabel()
    setup4minutesDurationLabel()
    setup4minutesButton()
  }
  
  private func addSubviews() {
    view.addSubview(september3ImageView)
    view.addSubview(september3Label)
    view.addSubview(september3DurationLabel)
    view.addSubview(september3Button)
    view.addSubview(minutes4ImageView)
    view.addSubview(minutes4Label)
    view.addSubview(minutes4DurationLabel)
    view.addSubview(minutes4Button)
  }
  
  private func addTarget() {
    september3Button.addTarget(self, action: #selector(toSongViewControllerWithMihail), for: .touchUpInside)
    minutes4Button.addTarget(self, action: #selector(toSongViewControllerWithMadonna), for: .touchUpInside)
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  @objc private func toSongViewControllerWithMihail() {
    let songViewController = SongViewController()
    if let img = september3Image {
    songViewController.iconAlbum = img
    }
    if let nm = september3Label.text {
    songViewController.topName = nm
    songViewController.bottomName = nm
    }
    songViewController.rightSlider = "06:21"
    songViewController.singer = "Михаил Шуфутинский"
    songViewController.track = "mihail"
    present(songViewController, animated: true, completion: nil)
  }
 
  @objc private func toSongViewControllerWithMadonna() {
    let songViewController = SongViewController()
    if let img = minutes4Image {
    songViewController.iconAlbum = img
    }
    if let nm = minutes4Label.text {
    songViewController.topName = nm
    songViewController.bottomName = nm
    }
    songViewController.rightSlider = "03:10"
    songViewController.singer = "Madonna"
    songViewController.track = "madonna"
    present(songViewController, animated: true, completion: nil)
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








