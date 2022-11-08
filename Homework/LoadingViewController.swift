import UIKit

final class LoadingViewController: UIViewController {
  // MARK: - Private Properties
  private let loadingImageView = UIImageView()
  private let imageLoadingProgressView = UIProgressView()

  private var timer = Timer()

  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }

  // MARK: - Visual Components
  private func setupLoadingImageView() {
    loadingImageView.frame = CGRect(x: 0, y: 270, width: 414, height: 200)
    loadingImageView.image = UIImage(named: "restore")
    loadingImageView.alpha = 0
  }
  
  private func setupImageLoadingProgressView() {
    imageLoadingProgressView.progressViewStyle = .bar
    imageLoadingProgressView.frame = CGRect(x: 107, y: 500, width: 200, height: 50)
    imageLoadingProgressView.setProgress(0, animated: false)
    imageLoadingProgressView.progressTintColor = .systemPink
    imageLoadingProgressView.trackTintColor = .gray
   }
  
  // MARK: - Private Methods
  private func setupView() {
    setupImageLoadingProgressView()
    setupLoadingImageView()
    setupTimer()
    addSubviews()
    setupSelfView()
  }

  private func addSubviews() {
    [imageLoadingProgressView, loadingImageView].forEach {
      view.addSubview($0)
    }
  }

  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  private func setupTimer() {
     timer = Timer.scheduledTimer(timeInterval: 1,
                                   target: self,
                                   selector: #selector(updateImageLoadingProgressView),
                                   userInfo: nil,
                                   repeats: true)
   }

  // MARK: - Actions
  @objc private func updateImageLoadingProgressView() {
    if imageLoadingProgressView.progress != 1.0 {
      imageLoadingProgressView.progress += 0.25
      loadingImageView.alpha += 0.25
    } else {
      timer.invalidate()
      let shopTabBarController = ShopTabBarController()
      shopTabBarController.modalPresentationStyle = .fullScreen
      present(shopTabBarController, animated: false, completion: nil)
      shopTabBarController.navigationItem.hidesBackButton = true
    }
  }
}
 
