import UIKit

final class MainTabBarController: UITabBarController {
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
    tabBar.tintColor = .orange
    tabBar.unselectedItemTintColor = .gray
  }
  
  private func generateTabBar() {
    viewControllers = [generateVC(viewController: WorldTimeViewController(), title: "Мировые часы", image: UIImage(systemName: "globe")),
                       generateVC(viewController: AlarmViewController(), title: "Будильник", image: UIImage(systemName: "alarm.fill")),
                       generateVC(viewController: StopwatchViewController(), title: "Секундомер", image: UIImage(systemName: "stopwatch.fill")),
                       generateVC(viewController: TimerViewController(), title: "Таймер", image: UIImage(systemName: "timer"))]
  }
  
  private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
    viewController.tabBarItem.title = title
    viewController.tabBarItem.image = image
    return viewController
  }
}

