import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      guard let ws = (scene as? UIWindowScene) else { return }
      let myWindow = UIWindow(windowScene: ws)
      let navigationController = UINavigationController()
      let signInViewController = SignInViewController()
      navigationController.viewControllers = [signInViewController]
      myWindow.rootViewController = navigationController
      self.window = myWindow
      myWindow.makeKeyAndVisible()
  }
}
