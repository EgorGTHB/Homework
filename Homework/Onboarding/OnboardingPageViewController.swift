import UIKit

final class OnboardingPageViewController: UIPageViewController {
  
  // MARK: - Private Properties
  private let skipButton = UIButton(type: .system)
  private let nextButton = UIButton(type: .system)
  private let getStartedButton = UIButton(type: .system)
  
  private let firstImage = "1"
  private let secondImage = "2"
  private let thirdImage = "3"
  private var arrayShopHelpers = [ShopHelper]()
  private var arrayOnboardingViewController = [OnboardingViewController]()
  private var appearancePageControl = UIPageControl.appearance(whenContainedInInstancesOf: [OnboardingPageViewController.self])
  private var current = 0
  
  // MARK: - UIPageViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  override init(transitionStyle style: UIPageViewController.TransitionStyle,
                navigationOrientation: UIPageViewController.NavigationOrientation,
                options: [UIPageViewController.OptionsKey : Any]?) {
    super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
    dataSource = self
    view.backgroundColor = .white
    setViewControllers([arrayOnboardingViewController[0]], direction: .forward, animated: true, completion: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Visual Components
  private func setupSkipButton() {
    skipButton.setTitle("Skip", for: .normal)
    skipButton.frame = CGRect(x: 70, y: 832, width: 100, height: 30)
    skipButton.titleLabel?.font = .systemFont(ofSize: 20)
    skipButton.isHidden = false
    skipButton.tintColor = .gray
  }
  
  private func setupNextButton() {
    nextButton.setTitle("Next", for: .normal)
    nextButton.frame = CGRect(x: 245, y: 832, width: 100, height: 30)
    nextButton.titleLabel?.font = .systemFont(ofSize: 20)
    nextButton.isHidden = false
    nextButton.tintColor = .systemBlue
  }
  
  private func setupGetStartedButton() {
    getStartedButton.setTitle("Get Started!", for: .normal)
    getStartedButton.frame = CGRect(x: 142, y: 832, width: 130, height: 30)
    getStartedButton.titleLabel?.font = .systemFont(ofSize: 20)
    getStartedButton.isHidden = true
  }
  
  private func setupPageControl() {
    appearancePageControl.pageIndicatorTintColor = .gray
    appearancePageControl.currentPageIndicatorTintColor = .black
    appearancePageControl.backgroundStyle = .prominent
  }
  
  // MARK: - Private Methods
  private func setupView() {
    addSubviews()
    setupSkipButton()
    setupNextButton()
    setupGetStartedButton()
    addTarget()
    setupPageControl()
    setupCarsHelper()
    setupArrayCarViewController()
  }
  
  private func setupCarsHelper() {
    let firstWindow = ShopHelper(image: firstImage, text: "Покупайте в приложении")
    let secondWindow = ShopHelper(image: secondImage, text: "В приложении дешевле")
    let thirdWindow = ShopHelper(image: thirdImage, text: "Тысячи товаров уже здесь")
    arrayShopHelpers.append(firstWindow)
    arrayShopHelpers.append(secondWindow)
    arrayShopHelpers.append(thirdWindow)
  }
  
  private func addSubviews() {
    [skipButton, nextButton, getStartedButton].forEach {
      view.addSubview($0)
    }
  }
  
  private func addTarget() {
    skipButton.addTarget(self, action: #selector(skipButtonAction), for: .touchUpInside)
    nextButton.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
    getStartedButton.addTarget(self, action: #selector(getStartedButtonAction), for: .touchUpInside)
  }
  
  private func setupArrayCarViewController() {
    for shopHelper in arrayShopHelpers {
      arrayOnboardingViewController.append(OnboardingViewController(withShopModel: shopHelper))
    }
  }
  
  private func isLast(viewController: OnboardingViewController) {
    if viewController == arrayOnboardingViewController.last {
      elementsIsHidden(nextButtonIsHidden: true, skipButtonIsHiddenn: true, getStartedButtonIsHidden: false, appearanceIsHidden: true)
    } else {
      elementsIsHidden(nextButtonIsHidden: false, skipButtonIsHiddenn: false, getStartedButtonIsHidden: true, appearanceIsHidden: false)
    }
  }
  
  private func elementsIsHidden(nextButtonIsHidden: Bool, skipButtonIsHiddenn: Bool, getStartedButtonIsHidden: Bool, appearanceIsHidden: Bool) {
    nextButton.isHidden = nextButtonIsHidden
    skipButton.isHidden = skipButtonIsHiddenn
    getStartedButton.isHidden = getStartedButtonIsHidden
    togglePageControl(isHidden: appearanceIsHidden)
  }
  
  private func togglePageControl(isHidden: Bool) {
    for subView in view.subviews where subView is UIPageControl {
      subView.isHidden = isHidden
    }
  }
  
  // MARK: - Actions
  @objc private func skipButtonAction() {
    dismiss(animated: true)
  }
  
  @objc private func nextButtonAction() {
    guard let currentViewController = viewControllers?.first else { return }
    guard let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) else { return }
    setViewControllers([nextViewController], direction: .forward, animated: true)
    isLast(viewController: nextViewController as! OnboardingViewController)
  }
  
  @objc private func getStartedButtonAction() {
    dismiss(animated: true)
  }
}

// MARK: - UIPageViewControllerDataSource, UIPageViewControllerDelegate
extension OnboardingPageViewController: UIPageViewControllerDataSource {
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let viewController = viewController as? OnboardingViewController else { return nil }
    guard let index = arrayOnboardingViewController.firstIndex(of: viewController) else { return nil}
    isLast(viewController: viewController)
    if index > 0 {
      current = index - 1
      return arrayOnboardingViewController[index - 1]
    }
    return nil
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let viewController = viewController as? OnboardingViewController else { return nil }
    guard let index = arrayOnboardingViewController.firstIndex(of: viewController) else { return nil }
    isLast(viewController: viewController)
    if index < arrayShopHelpers.count - 1 {
      current = index + 1
      return arrayOnboardingViewController[index + 1]
    }
    return nil
  }
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return arrayShopHelpers.count
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    return current
  }
}
 
