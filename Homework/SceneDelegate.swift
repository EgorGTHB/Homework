import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    if let ws = scene as? UIWindowScene {
      let myWindow = UIWindow(windowScene: ws)
      let navigationController = UINavigationController()
      let viewController = SharingViewController()
      navigationController.viewControllers = [viewController]
      myWindow.rootViewController = navigationController
      self.window = myWindow
      myWindow.makeKeyAndVisible()
      guard let _ = (scene as? UIWindowScene) else { return }
    }
  }
}
