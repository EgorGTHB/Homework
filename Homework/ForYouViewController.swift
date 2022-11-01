import UIKit

final class ForYouViewController: UIViewController {
  // MARK: - Private Properties
  private let forYouLabel = UILabel()
  private let avatarImageView = UIImageView()
  private let newLabel = UILabel()
  private let airpodsImageView = UIImageView()
  private let orderView = UIView()
  private let sentOrderLabel = UILabel()
  private let deliveryLabel = UILabel()
  private let chevronImageView = UIImageView()
  private let orderProgressView = UIProgressView()
  private let processingLabel = UILabel()
  private let shippedLabel = UILabel()
  private let deliveredLabel = UILabel()
  private let recommendedLabel = UILabel()
  private let figureImageView = UIImageView()
  private let newsLabel = UILabel()
  private let notificationLabel = UILabel()
  private let chevronImageView2 = UIImageView()
  private let yourDevicesLabel = UILabel()
  private let showAllButton = UIButton(type: .system)
  
  private let airpodsImage = UIImage(named: "airpods")
  private var avatarImage = UIImage(named: "memoji")
  private var isShowOnboarding = 0


  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }

  private func setupIsShowOnboardingPageViewController() {
    isShowOnboarding = UserDefaults.standard.integer(forKey: "isShowOnboardingv")
    if isShowOnboarding == 0 {
      setupOnboardingPageViewController()
    }
    isShowOnboarding += 1
    UserDefaults.standard.set(isShowOnboarding, forKey: "isShowOnboardingv")
   }
  
  private func setupOnboardingPageViewController() {
    let onboardingPageViewController = OnboardingPageViewController()
    onboardingPageViewController.modalPresentationStyle = .fullScreen
    present(onboardingPageViewController, animated: true, completion: nil)
    onboardingPageViewController.navigationItem.hidesBackButton = true
  }
  
  // MARK: - Visual Components
  private func setupForYouLabel() {
    forYouLabel.frame = CGRect(x: 20, y: 100, width: 200, height: 30)
    forYouLabel.text = "Для вас"
    forYouLabel.font = .systemFont(ofSize: 33, weight: .bold)
  }
  
  private func setupAvatarImageView() {
    if let img = getImageFromUserDefaults(key: "avatarImage") {
      avatarImageView.image = img
    } else {
      avatarImageView.image = avatarImage
    }
    let tap = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
    avatarImageView.frame = CGRect(x: 340, y: 85, width: 50, height: 50)
    avatarImageView.addGestureRecognizer(tap)
    avatarImageView.isUserInteractionEnabled = true
    avatarImageView.layer.cornerRadius = 25
    avatarImageView.layer.masksToBounds = true
  }
  
  private func setupNewLabel() {
    newLabel.text = "Вот что нового"
    newLabel.frame = CGRect(x: 20, y: 170, width: 200, height: 30)
    newLabel.font = .systemFont(ofSize: 27, weight: .bold)
  }
  
  private func setupOrderView() {
    orderView.frame = CGRect(x: 20, y: 220, width: 374, height: 160)
    orderView.layer.cornerRadius = 20
    orderView.backgroundColor = .white
    setupShadow(orderView)
  }
  
  private func setupAirpodsImageView() {
    airpodsImageView.frame = CGRect(x: 25, y: 233, width: 65, height: 65)
    airpodsImageView.image = airpodsImage
  }
  
  private func setupSentOrderLabel() {
    sentOrderLabel.frame = CGRect(x: 100, y: 240, width: 200, height: 20)
    sentOrderLabel.text = "Ваш заказ отправлен."
    sentOrderLabel.font = .systemFont(ofSize: 17, weight: .bold)
  }
  
  private func setupDeliveryLabel() {
    deliveryLabel.frame = CGRect(x: 100, y: 270, width: 200, height: 20)
    deliveryLabel.text = "1 товар, доставка завтра"
    deliveryLabel.font = .systemFont(ofSize: 17, weight: .regular)
    deliveryLabel.textColor = .gray
  }
  
  private func setupChevronImageView() {
    let configuration = UIImage.SymbolConfiguration(weight: .semibold)
    chevronImageView.frame = CGRect(x: 370, y: 270, width: 12, height: 20)
    chevronImageView.image = UIImage(systemName: "chevron.right", withConfiguration: configuration)
    chevronImageView.tintColor = .gray
  }
  
  private func setupMyProgressView() {
    orderProgressView.frame = CGRect(x: 35, y: 340, width: 345, height: 100)
    orderProgressView.setProgress(0.5, animated: false)
    orderProgressView.progressTintColor = .systemGreen
  }
  
  private func setupProcessingLabel() {
    processingLabel.frame = CGRect(x: 35, y: 350, width: 120, height: 20)
    processingLabel.text = "Обрабатывается"
    processingLabel.textColor = .black
    processingLabel.font = .systemFont(ofSize: 12, weight: .bold)
  }
  
  private func setupShippedLabel() {
    shippedLabel.frame = CGRect(x: 175, y: 350, width: 100, height: 20)
    shippedLabel.text = "Отправлено"
    shippedLabel.textColor = .black
    shippedLabel.font = .systemFont(ofSize: 12, weight: .bold)
  }
  
  private func setupDeliveredLabel() {
    deliveredLabel.frame = CGRect(x: 305, y: 350, width: 100, height: 20)
    deliveredLabel.text = "Доставлено"
    deliveredLabel.textColor = .black
    deliveredLabel.font = .systemFont(ofSize: 12, weight: .bold)
  }
  
  private func setupRecommendedLabel() {
    recommendedLabel.text = "Рекомендуется вам"
    recommendedLabel.frame = CGRect(x: 23, y: 495, width: 230, height: 30)
    recommendedLabel.font = .systemFont(ofSize: 23, weight: .bold)
  }
  
  private func setupFigureImageView() {
    figureImageView.frame = CGRect(x: 30, y: 542, width: 45, height: 45)
    figureImageView.image = UIImage(named: "figure")
  }
  
  private func setupNewsLabel() {
    newsLabel.text = "Получайте новости о своём заказе в режиме реального времени."
    newsLabel.numberOfLines = 3
    newsLabel.textAlignment = .natural
    newsLabel.frame = CGRect(x: 100, y: 535, width: 250, height: 70)
    newsLabel.font = .systemFont(ofSize: 15, weight: .bold)
  }
  
  private func setupNotificationLabel() {
    notificationLabel.text = "Включите уведомления, чтобы получать новости о своём заказе."
    notificationLabel.numberOfLines = 2
    notificationLabel.textAlignment = .natural
    notificationLabel.frame = CGRect(x: 100, y: 585, width: 300, height: 70)
    notificationLabel.font = .systemFont(ofSize: 14)
    notificationLabel.textColor = .gray
  }
  
  private func setupChevronImageView2() {
    let configuration = UIImage.SymbolConfiguration(weight: .regular)
    chevronImageView2.frame = CGRect(x: 380, y: 580, width: 11, height: 15)
    chevronImageView2.image = UIImage(systemName: "chevron.right", withConfiguration: configuration)
    chevronImageView2.tintColor = .gray
  }
  
  private func setupYourDevicesLabel() {
    yourDevicesLabel.text = "ваши устройства"
    yourDevicesLabel.frame = CGRect(x: 20, y: 730, width: 300, height: 30)
    yourDevicesLabel.font = .systemFont(ofSize: 27, weight: .bold)
  }
  
  private func setupShowAllButton() {
    showAllButton.setTitle("Показать все", for: .normal)
    showAllButton.frame = CGRect(x: 290, y: 732, width: 100, height: 30)
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupIsShowOnboardingPageViewController()
    setupForYouLabel()
    setupAvatarImageView()
    setupNewLabel()
    setupOrderView()
    setupAirpodsImageView()
    setupSentOrderLabel()
    setupDeliveryLabel()
    setupChevronImageView()
    setupMyProgressView()
    setupProcessingLabel()
    setupShippedLabel()
    setupDeliveredLabel()
    setupRecommendedLabel()
    setupFigureImageView()
    setupNewsLabel()
    setupNotificationLabel()
    setupChevronImageView2()
    setupYourDevicesLabel()
    setupShowAllButton()
    addSubviews()
    setupLines()
    setupSelfView()
  }
  
  private func addSubviews() {
    [forYouLabel, avatarImageView, newLabel, orderView, airpodsImageView, sentOrderLabel, deliveryLabel, chevronImageView, orderProgressView, processingLabel, shippedLabel, deliveredLabel, recommendedLabel, figureImageView, newsLabel, notificationLabel, chevronImageView2, yourDevicesLabel, showAllButton].forEach {
      view.addSubview($0)
    }
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  private func setupLines() {
    let point1: CGPoint = CGPoint(x: 20, y: 150)
    let point2 = CGPoint(x: 390, y: 150)
    let point3 = CGPoint(x: 20, y: 320)
    let point4 = CGPoint(x: 395, y: 320)
    let point5 = CGPoint(x: 20, y: 665)
    let point6 = CGPoint(x: 414, y: 665)
    drawLine(start: point1, toPoint: point2, ofColor: .gray, inView: view, shapeWidth: 0.3)
    drawLine(start: point3, toPoint: point4, ofColor: .gray, inView: view, shapeWidth: 0.3)
    drawLine(start: point5, toPoint: point6, ofColor: .gray, inView: view, shapeWidth: 0.3)
  }
  
  // MARK: - Actions
  @objc private func tapFunction(sender: UITapGestureRecognizer) {
    let vc = UIImagePickerController()
    vc.sourceType = .photoLibrary
    vc.delegate = self
    vc.allowsEditing = true
    present(vc, animated: true)
  }
}

extension ForYouViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
    if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
      avatarImage = image
      if let avaImg = avatarImage {
        saveImageInUserDefaults(img: avaImg, key: "avatarImage")
      }
    }
    picker.dismiss(animated: true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
}


 
