import UIKit

final class ShopTabBarController: UITabBarController {
  // MARK: - Private Properties
  private let buyViewController = UINavigationController(rootViewController: BuyViewController())
  private let forYouViewController = UINavigationController(rootViewController: ForYouViewController())
  private let navigationViewController = UINavigationController(rootViewController: SearchViewController())
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
    viewControllers = [generateVC(viewController: buyViewController, title: "Купить", image: UIImage(systemName: "laptopcomputer.and.iphone"), tabBarTintColor: .blue, tabBarUnselectedItemTintColor: .gray),
                       generateVC(viewController: forYouViewController, title: "Для вас", image: UIImage(systemName: "person.circle"), tabBarTintColor: .blue, tabBarUnselectedItemTintColor: .gray),
                       generateVC(viewController: navigationViewController, title: "Поиск", image: UIImage(systemName: "magnifyingglass"),tabBarTintColor: .blue, tabBarUnselectedItemTintColor: .gray),
                       generateVC(viewController: bagViewController, title: "Корзина", image: UIImage(systemName: "bag"),tabBarTintColor: .blue, tabBarUnselectedItemTintColor: .gray)]
  }
  
  private func setupSelfView() {
    selectedViewController = forYouViewController
  }
  
  private func generateVC(viewController: UIViewController, title: String, image: UIImage?, tabBarTintColor: UIColor,  tabBarUnselectedItemTintColor: UIColor) -> UIViewController {
    viewController.tabBarItem.title = title
    viewController.tabBarItem.image = image
    tabBar.tintColor = tabBarTintColor
    tabBar.unselectedItemTintColor = tabBarUnselectedItemTintColor
    return viewController
  }
}
