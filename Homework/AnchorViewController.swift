import UIKit

final class AnchorViewController: UIViewController {
  // MARK: - Private Properties
  private let blackRectangle = UIView()
  private let redSquare = UIView()
  private let yellowSquare = UIView()
  private let greenSquare = UIView()
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupBlackRectangle() {
    blackRectangle.translatesAutoresizingMaskIntoConstraints = false
    blackRectangle.backgroundColor = .black
  }
  
  private func setupRedSquare() {
    redSquare.translatesAutoresizingMaskIntoConstraints = false
    redSquare.backgroundColor = .red
  }
  
  private func setupYellowSquare() {
    yellowSquare.translatesAutoresizingMaskIntoConstraints = false
    yellowSquare.backgroundColor = .yellow
  }
  
  private func setupGreenSquare() {
    greenSquare.translatesAutoresizingMaskIntoConstraints = false
    greenSquare.backgroundColor = .green
  }
  
  // MARK: - Constraints
  private func setupBlackRectangleConstraints() {
    blackRectangle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    blackRectangle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    blackRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    blackRectangle.widthAnchor.constraint(equalTo: blackRectangle.heightAnchor, multiplier: 0.342).isActive = true
    blackRectangle.heightAnchor.constraint(equalToConstant: 700).isActive = true
  }
  
  private func setupRedSquareConstraints() {
    redSquare.topAnchor.constraint(equalTo: blackRectangle.topAnchor, constant: 10).isActive = true
    redSquare.leadingAnchor.constraint(equalTo: blackRectangle.leadingAnchor, constant: 10).isActive = true
    redSquare.trailingAnchor.constraint(equalTo: blackRectangle.trailingAnchor, constant: -10).isActive = true
    redSquare.widthAnchor.constraint(equalTo: redSquare.heightAnchor, multiplier: 1).isActive = true
  }
  
  private func setupYellowSquareConstraints() {
    yellowSquare.topAnchor.constraint(equalTo: redSquare.bottomAnchor, constant: 10).isActive = true
    yellowSquare.leadingAnchor.constraint(equalTo: blackRectangle.leadingAnchor, constant: 10).isActive = true
    yellowSquare.trailingAnchor.constraint(equalTo: blackRectangle.trailingAnchor, constant: -10).isActive = true
    yellowSquare.widthAnchor.constraint(equalTo: yellowSquare.heightAnchor, multiplier: 1).isActive = true
  }
  
  private func setupGreenSquareConstraints() {
    greenSquare.topAnchor.constraint(equalTo: yellowSquare.bottomAnchor, constant: 10).isActive = true
    greenSquare.leadingAnchor.constraint(equalTo: blackRectangle.leadingAnchor, constant: 10).isActive = true
    greenSquare.trailingAnchor.constraint(equalTo: blackRectangle.trailingAnchor, constant: -10).isActive = true
    greenSquare.widthAnchor.constraint(equalTo: greenSquare.heightAnchor, multiplier: 1).isActive = true
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupBlackRectangle()
    setupRedSquare()
    setupYellowSquare()
    setupGreenSquare()
    addSubviews()
    setupSelfView()
    setupBlackRectangleConstraints()
    setupRedSquareConstraints()
    setupYellowSquareConstraints()
    setupGreenSquareConstraints()
  }
  
  private func addSubviews() {
    [blackRectangle, redSquare, yellowSquare, greenSquare].forEach {
      view.addSubview($0)
    }
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }
}
