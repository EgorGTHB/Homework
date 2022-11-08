import UIKit

final class OnboardingViewController: UIViewController {
  // MARK: - Private Properties
  private let shopImage = UIImageView()
  private let shopLabel = UILabel()
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  init(withShopModel: ShopHelper) {
    super.init(nibName: nil, bundle: nil)
    shopImage.image = UIImage(named: withShopModel.image)
    shopLabel.text = withShopModel.text
    edgesForExtendedLayout = []
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  // MARK: - Visual Components
  private func setupShopImage() {
    shopImage.frame = CGRect(x: 0, y: 50, width: 414, height: 700)
    shopImage.contentMode = .scaleAspectFit
  }
  
  private func setupShopLabel() {
    shopLabel.frame = CGRect(x: 57, y: 600, width: 300, height: 100)
    shopLabel.numberOfLines = 2
    shopLabel.textAlignment = .center
    shopLabel.textColor = .black
    shopLabel.font = .systemFont(ofSize: 25)
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupShopImage()
    setupShopLabel()
    addSubviews()
    setupSelfView()
  }
  
  private func addSubviews() {
    [shopImage, shopLabel].forEach {
      view.addSubview($0)
    }
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }
}



