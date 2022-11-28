import UIKit

extension UIView {
  
  func gradient(view: UIView) {
    let gradient = CAGradientLayer()
    let shape = CAShapeLayer()
    gradient.frame = CGRect(origin: CGPoint.zero, size: view.frame.size)
    gradient.colors = [UIColor.systemPink.cgColor, UIColor.systemOrange.cgColor, UIColor.systemYellow.cgColor]
    shape.lineWidth = 7
    shape.path = UIBezierPath(rect: view.bounds).cgPath
    shape.strokeColor = UIColor.black.cgColor
    shape.fillColor = UIColor.clear.cgColor
    shape.path = UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius).cgPath
    gradient.mask = shape
    view.layer.addSublayer(gradient)
  }
}
