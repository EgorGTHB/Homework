import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

    guard let windowScene = scene as? UIWindowScene else { return }
    let myWindow = UIWindow(windowScene: windowScene)
    let navigationController = UINavigationController()
    let registerViewController = RegisterViewController()
    navigationController.viewControllers = [registerViewController]
    myWindow.rootViewController = navigationController
    self.window = myWindow
    myWindow.makeKeyAndVisible()
  }
}


