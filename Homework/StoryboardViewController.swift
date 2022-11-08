import UIKit

final class StoryboardViewController: UIViewController {

  // MARK: - Action
  @IBAction func nextVCButton(_ sender: Any) {
    let constraintsViewController = ConstraintsViewController()
    navigationController?.pushViewController(constraintsViewController, animated: true)
  }
}
