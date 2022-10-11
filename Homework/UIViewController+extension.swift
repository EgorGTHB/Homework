import UIKit

extension UIViewController {
  
  func drawLine(start: CGPoint, toPoint end: CGPoint, ofColor lineColor: UIColor, inView view: UIView, shapeWidth: Double) {
    let path = UIBezierPath()
    path.move(to: start)
    path.addLine(to: end)
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    shapeLayer.strokeColor = lineColor.cgColor
    shapeLayer.lineWidth = shapeWidth
    view.layer.addSublayer(shapeLayer)
  }
  
  @objc func endEditing() {
    view.endEditing(true)
  }
}
