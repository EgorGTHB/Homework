import UIKit

final class InstaTabBarViewController: UITabBarController {
  // MARK: - Private Properties
  private let homeViewController = UINavigationController(rootViewController: HomeViewController())
  private let searchViewController = UINavigationController(rootViewController: SearchViewController())
  private let addViewController = UINavigationController(rootViewController: AddViewController())
  private let likeViewController = UINavigationController(rootViewController: LikeViewController())
  private let personalRecommendationsViewController = UINavigationController(rootViewController: PersonalRecommendationsViewController())

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
    viewControllers = [generateVC(viewController: homeViewController, image: UIImage(systemName: "house.fill"), tabBarTintColor: .white,                               tabBarUnselectedItemTintColor: .gray),
                       generateVC(viewController: searchViewController, image: UIImage(systemName: "magnifyingglass"), tabBarTintColor: .white, tabBarUnselectedItemTintColor: .gray),
                       generateVC(viewController: addViewController, image: UIImage(systemName: "plus.app"),tabBarTintColor: .white, tabBarUnselectedItemTintColor: .gray),
                       generateVC(viewController: likeViewController, image: UIImage(systemName: "heart"),tabBarTintColor: .white, tabBarUnselectedItemTintColor: .gray),
                       generateVC(viewController: personalRecommendationsViewController, image: UIImage(systemName: "person"),tabBarTintColor: .white, tabBarUnselectedItemTintColor: .gray)]
  }
  
  private func setupSelfView() {
    let lineView = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.size.width, height: 0.3))
    lineView.backgroundColor = .darkGray
    selectedViewController = homeViewController
    tabBar.addSubview(lineView)
    tabBar.barTintColor = .black
    tabBar.isTranslucent = true

  }
  
  private func generateVC(viewController: UIViewController, image: UIImage?, tabBarTintColor: UIColor,  tabBarUnselectedItemTintColor: UIColor) -> UIViewController {
    viewController.tabBarItem.image = image
    tabBar.tintColor = tabBarTintColor
    tabBar.unselectedItemTintColor = tabBarUnselectedItemTintColor
    return viewController
  }
}
