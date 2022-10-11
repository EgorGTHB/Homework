import UIKit

final class TabBarController: UITabBarController {
  private let navigationViewController = UINavigationController(rootViewController: HomeViewController())
  
  // MARK: - UITabBarController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Private Methods
  private func setupView() {
    generateTabBar()
    setupSelfView()
  }
  
  private func setupSelfView() {
    tabBar.tintColor = .black
    tabBar.unselectedItemTintColor = .gray
  }
  
  private func generateTabBar() {
    viewControllers = [generateVC(viewController: navigationViewController, title: "Home", image: UIImage(systemName: "house.fill"))]
  }
  
  private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
    viewController.tabBarItem.title = title
    viewController.tabBarItem.image = image
    return viewController
  }
}
