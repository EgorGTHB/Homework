import UIKit

final class ShopTabBarController: UITabBarController {
  private let buyViewController = UINavigationController(rootViewController: BuyViewController())
  private let forYouViewController = UINavigationController(rootViewController: ForYouViewController())
  private let navigationViewController3 = UINavigationController(rootViewController: SearchViewController())
  private let bagViewController = UINavigationController(rootViewController: BagViewController())
 
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
  
  private func generateTabBar() {
    viewControllers = [generateVC(viewController: buyViewController, title: "Купить", image: UIImage(systemName: "laptopcomputer.and.iphone")), generateVC(viewController: forYouViewController, title: "Для вас", image: UIImage(systemName: "person.circle")), generateVC(viewController: navigationViewController3, title: "Поиск", image: UIImage(systemName: "magnifyingglass")), generateVC(viewController: bagViewController, title: "Корзина", image: UIImage(systemName: "bag"))]
  }
  
  private func setupSelfView() {
    tabBar.tintColor = .blue
    tabBar.unselectedItemTintColor = .gray
    tabBar.backgroundColor = UIColor(red: 21/255, green: 21/255, blue: 23/255, alpha: 1)
  }
  
  private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
    viewController.tabBarItem.title = title
    viewController.tabBarItem.image = image
    return viewController
  }
}
