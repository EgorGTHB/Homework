import UIKit

final class CustomActivity: UIActivity {
  
  private let title: String
  private let image: UIImage?
  private let action:([Any]) -> Void
  private var items: [Any] = [Any]()
  
  
  init(title: String, image: UIImage?, action: @escaping ([Any]) -> Void) {
    self.title = title
    self.image = image
    self.action = action
    super.init()
  }
  
  override var activityTitle: String? {
    return title
  }
  
  override var activityImage: UIImage? {
    return image
  }
  
  override var activityType: UIActivity.ActivityType? {
    return UIActivity.ActivityType("myactivity")
  }
  
  override class var activityCategory: UIActivity.Category {
    return .share
  }
  
  override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
    return true
  }
  
  override func prepare(withActivityItems activityItems: [Any]) {
    items = activityItems
  }
  
  override func perform() {
    action(items)
    activityDidFinish(true)
  }
}
