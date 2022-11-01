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
  
  func isActivityIndicator(isAnimated: Bool, indicator: UIActivityIndicatorView) {
    if isAnimated {
      indicator.startAnimating()
    } else {
      indicator.stopAnimating()
    }
  }
  
  func setupShadow(_ view: UIView) {
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOpacity = 0.4
    view.layer.shadowOffset = .zero
    view.layer.shadowRadius = 10
    view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
    view.layer.shouldRasterize = true
  }
  
   func saveImageInUserDefaults(img: UIImage, key: String) {
    UserDefaults.standard.set(img.pngData(), forKey: key)
  }
  
   func getImageFromUserDefaults(key: String) -> UIImage? {
    let imageData = UserDefaults.standard.object(forKey: key) as? Data
    var image: UIImage? 
    if let imageData = imageData {
      image = UIImage(data: imageData)
    }
    return image
  }
}
