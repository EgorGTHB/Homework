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
    blackRectangle.backgroundColor = .black
  }
  
  private func setupRedSquare() {
    redSquare.backgroundColor = .red
  }
  
  private func setupYellowSquare() {
    yellowSquare.backgroundColor = .yellow
  }
  
  private func setupGreenSquare() {
    greenSquare.backgroundColor = .green
  }
  
  // MARK: - Constraints
  private func setupBlackRectangleConstraints() {
    NSLayoutConstraint.activate([
    blackRectangle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
    blackRectangle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    blackRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    blackRectangle.widthAnchor.constraint(equalTo: blackRectangle.heightAnchor, multiplier: 0.342),
    blackRectangle.heightAnchor.constraint(equalToConstant: 700)
    ])
  }
  
  private func setupRedSquareConstraints() {
    NSLayoutConstraint.activate([
    redSquare.topAnchor.constraint(equalTo: blackRectangle.topAnchor, constant: 10),
    redSquare.leadingAnchor.constraint(equalTo: blackRectangle.leadingAnchor, constant: 10),
    redSquare.trailingAnchor.constraint(equalTo: blackRectangle.trailingAnchor, constant: -10),
    redSquare.widthAnchor.constraint(equalTo: redSquare.heightAnchor, multiplier: 1),
    ])
  }
  
  private func setupYellowSquareConstraints() {
    NSLayoutConstraint.activate([
    yellowSquare.topAnchor.constraint(equalTo: redSquare.bottomAnchor, constant: 10),
    yellowSquare.leadingAnchor.constraint(equalTo: blackRectangle.leadingAnchor, constant: 10),
    yellowSquare.trailingAnchor.constraint(equalTo: blackRectangle.trailingAnchor, constant: -10),
    yellowSquare.widthAnchor.constraint(equalTo: yellowSquare.heightAnchor, multiplier: 1)
    ])
  }
  
  private func setupGreenSquareConstraints() {
    NSLayoutConstraint.activate([
    greenSquare.topAnchor.constraint(equalTo: yellowSquare.bottomAnchor, constant: 10),
    greenSquare.leadingAnchor.constraint(equalTo: blackRectangle.leadingAnchor, constant: 10),
    greenSquare.trailingAnchor.constraint(equalTo: blackRectangle.trailingAnchor, constant: -10),
    greenSquare.widthAnchor.constraint(equalTo: greenSquare.heightAnchor, multiplier: 1),
    ])
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
      $0.translatesAutoresizingMaskIntoConstraints = false

    }
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }
}
