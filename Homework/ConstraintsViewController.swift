import UIKit

final class ConstraintsViewController: UIViewController {
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
  private func setupNavigationController() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextTapped))
  }
  
  private func setupBlackRectangle() {
    blackRectangle.translatesAutoresizingMaskIntoConstraints = false
    blackRectangle.frame = CGRect(x: 0, y: 0, width: 241, height: 700)
    blackRectangle.backgroundColor = .black
  }
  
  private func setupRedSquare() {
    redSquare.translatesAutoresizingMaskIntoConstraints = false
    redSquare.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
    redSquare.backgroundColor = .red
  }
  
  private func setupYellowSquare() {
    yellowSquare.translatesAutoresizingMaskIntoConstraints = false
    yellowSquare.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
    yellowSquare.backgroundColor = .yellow
  }
  
  private func setupGreenSquare() {
    greenSquare.translatesAutoresizingMaskIntoConstraints = false
    greenSquare.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
    greenSquare.backgroundColor = .green
  }
  
  // MARK: - Constraints
  private func setupBlackRectangleConstraints() {
    NSLayoutConstraint(item: blackRectangle,
                       attribute: .centerX,
                       relatedBy: .equal,
                       toItem: view,
                       attribute: .centerX,
                       multiplier: 1,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: blackRectangle,
                       attribute: .height,
                       relatedBy: .equal,
                       toItem: blackRectangle,
                       attribute: .width,
                       multiplier: blackRectangle.frame.size.height / blackRectangle.frame.size.width,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: blackRectangle,
                       attribute: .top,
                       relatedBy: .equal,
                       toItem: view,
                       attribute: .topMargin,
                       multiplier: 1,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: blackRectangle,
                       attribute: .bottom,
                       relatedBy: .equal,
                       toItem: view,
                       attribute: .bottomMargin,
                       multiplier: 1,
                       constant: 0).isActive = true
  }
  
  private func setupRedSquareConstraints() {
    NSLayoutConstraint(item: redSquare,
                       attribute: .top,
                       relatedBy: .equal,
                       toItem: blackRectangle,
                       attribute: .top,
                       multiplier: 1,
                       constant: 10).isActive = true
    
    NSLayoutConstraint(item: redSquare,
                       attribute: .height,
                       relatedBy: .equal,
                       toItem: redSquare,
                       attribute: .width,
                       multiplier: redSquare.frame.size.height / redSquare.frame.size.width,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: redSquare,
                       attribute: .leading,
                       relatedBy: .equal,
                       toItem: blackRectangle,
                       attribute: .leading,
                       multiplier: 1,
                       constant: 10).isActive = true
    
    NSLayoutConstraint(item: redSquare,
                       attribute: .trailing,
                       relatedBy: .equal,
                       toItem: blackRectangle,
                       attribute: .trailing,
                       multiplier: 1,
                       constant: -10).isActive = true
  }
  
  private func setupYellowSquareConstraints() {
    NSLayoutConstraint(item: yellowSquare,
                       attribute: .top,
                       relatedBy: .equal,
                       toItem: redSquare,
                       attribute: .bottom,
                       multiplier: 1,
                       constant: 10).isActive = true
    
    NSLayoutConstraint(item: yellowSquare,
                       attribute: .height,
                       relatedBy: .equal,
                       toItem: yellowSquare,
                       attribute: .width,
                       multiplier: yellowSquare.frame.size.height / yellowSquare.frame.size.width,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: yellowSquare,
                       attribute: .leading,
                       relatedBy: .equal,
                       toItem: blackRectangle,
                       attribute: .leading,
                       multiplier: 1,
                       constant: 10).isActive = true
    
    NSLayoutConstraint(item: yellowSquare,
                       attribute: .trailing,
                       relatedBy: .equal,
                       toItem: blackRectangle,
                       attribute: .trailing,
                       multiplier: 1,
                       constant: -10).isActive = true
  }
  
  private func setupGreenSquareConstraints() {
    NSLayoutConstraint(item: greenSquare,
                       attribute: .top,
                       relatedBy: .equal,
                       toItem: yellowSquare,
                       attribute: .bottom,
                       multiplier: 1,
                       constant: 10).isActive = true
    
    NSLayoutConstraint(item: greenSquare,
                       attribute: .height,
                       relatedBy: .equal,
                       toItem: greenSquare,
                       attribute: .width,
                       multiplier: greenSquare.frame.size.height / greenSquare.frame.size.width,
                       constant: 0).isActive = true
    
    NSLayoutConstraint(item: greenSquare,
                       attribute: .leading,
                       relatedBy: .equal,
                       toItem: blackRectangle,
                       attribute: .leading,
                       multiplier: 1,
                       constant: 10).isActive = true
    
    NSLayoutConstraint(item: greenSquare,
                       attribute: .trailing,
                       relatedBy: .equal,
                       toItem: blackRectangle,
                       attribute: .trailing,
                       multiplier: 1,
                       constant: -10).isActive = true
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupNavigationController()
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
  
  // MARK: - Actions
  @objc private func nextTapped() {
    let anchorViewController = AnchorViewController()
    navigationController?.pushViewController(anchorViewController, animated: true)
  }
}
