import UIKit

extension UIViewController {
  
  func drawLine(start: CGPoint, toPoint end: CGPoint, ofColor lineColor: UIColor, inView view: UIView) {
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
