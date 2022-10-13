import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      guard let ws = scene as? UIWindowScene else { return }
      window = UIWindow(windowScene: ws)
      let navigationController = UINavigationController()
      let viewController = TimerViewController()
      navigationController.viewControllers = [viewController]
      window?.rootViewController = navigationController
      window?.makeKeyAndVisible()
  }
}

