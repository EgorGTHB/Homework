import UIKit

final class LoseWeightViewController: UIViewController {
  // MARK: - Private Properties
  private let beginImageView = UIImageView()
  private let beginLabel = UILabel()
  private let advancedImageView = UIImageView()
  private let advancedLabel = UILabel()
  private let profiImageView = UIImageView()
  private let profiLabel = UILabel()
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupNavigationController() {
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: self, action: #selector(goToSettings))
    navigationItem.rightBarButtonItem?.tintColor = .black
    title = "Похудей"
    navigationItem.hidesBackButton = true
  }
  
  private func setupBeginImageView() {
    beginImageView.frame = CGRect(x: 0, y: 100, width: 414, height: 250)
    beginImageView.image = UIImage(named: "begginer")
    beginImageView.layer.borderColor = UIColor.gray.cgColor
  }
  
  private func setupBeginLabel() {
    beginLabel.frame = CGRect(x: 20, y: 120, width: 240, height: 60)
    beginLabel.textAlignment = .left
    beginLabel.text = "Начинающий"
    beginLabel.textColor = UIColor(red: 253/255, green: 181/255, blue: 28/255, alpha: 1)
    beginLabel.font = UIFont(name: "ArialHebrew-Bold", size: 35)
  }
  
  private func setupAdvancedImageView() {
    advancedImageView.frame = CGRect(x: 0, y: 350, width: 414, height: 250)
    advancedImageView.image = UIImage(named: "advanced")
    advancedImageView.layer.borderWidth = 0.5
    advancedImageView.layer.borderColor = UIColor.gray.cgColor
  }
  
  private func setupAdvancedLabel() {
    advancedLabel.frame = CGRect(x: 20, y: 370, width: 250, height: 60)
    advancedLabel.textAlignment = .left
    advancedLabel.text = "Продвинутый"
    advancedLabel.textColor = UIColor(red: 253/255, green: 181/255, blue: 28/255, alpha: 1)
    advancedLabel.font = UIFont(name: "ArialHebrew-Bold", size: 35)
  }
  
  private func setupProfiImageView() {
    profiImageView.frame = CGRect(x: 0, y: 550, width: 414, height: 250)
    profiImageView.image = UIImage(named: "profi")
    profiImageView.layer.borderColor = UIColor.gray.cgColor
  }
  
  private func setupProfiLabel() {
    profiLabel.frame = CGRect(x: 20, y: 570, width: 170, height: 60)
    profiLabel.textAlignment = .left
    profiLabel.text = "Опытный"
    profiLabel.textColor = UIColor(red: 253/255, green: 181/255, blue: 28/255, alpha: 1)
    profiLabel.font = UIFont(name: "ArialHebrew-Bold", size: 35)
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupNavigationController()
    setupBeginImageView()
    setupBeginLabel()
    setupAdvancedImageView()
    setupAdvancedLabel()
    setupProfiImageView()
    setupProfiLabel()
    addSubviews()
    setupSelfView()
  }
  
  private func addSubviews() {
    [beginImageView, beginLabel, advancedImageView, advancedLabel, profiImageView, profiLabel].forEach {
      view.addSubview($0)
    }
  }
  
  // MARK: - Actions
  @objc private func goToSettings() {
    let settingsViewController = SettingsViewController()
    navigationController?.pushViewController(settingsViewController, animated: true)
    let backItem = UIBarButtonItem()
    backItem.title = ""
    backItem.tintColor = .black
    navigationItem.backBarButtonItem = backItem
  }
}





