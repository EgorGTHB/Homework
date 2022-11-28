import UIKit

final class StoriesArchiveCollectionViewCell: UICollectionViewCell {
  //MARK: - Private Properties
  private let storyImageView = UIImageView()
  private let descriptionLabel = UILabel()
  
  // MARK: - UICollectionViewCell
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupCell()
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Visual Components
  private func setupAppearance() {
    backgroundColor = .black
  }
  
  private func setupStoryImageView() {
    storyImageView.layer.cornerRadius = 40
    storyImageView.layer.masksToBounds = true
    storyImageView.contentMode = .scaleAspectFit
    storyImageView.layer.borderWidth = 1
    storyImageView.layer.borderColor = UIColor.gray.cgColor
   }
  
  private func setupDescriptionLabel() {
    descriptionLabel.textAlignment = .center
    descriptionLabel.textColor = .white
  }
  
  //MARK: - Private Methods
  private func setupCell() {
    setupStoryImageView()
    setupDescriptionLabel()
    setupAppearance()
    addSubviews()
    setupStoryImageViewConstraint()
    setupDescriptionLabelConstraint()
  }
  
  private func addSubviews() {
    [storyImageView, descriptionLabel].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  //MARK: - Public Methods
  func configureCell(model: StoriesArchiveModel) {
    storyImageView.image = UIImage(named: model.image)
    descriptionLabel.text = model.description
  }
  
  //MARK: - Constraints
  private func setupStoryImageViewConstraint() {
    NSLayoutConstraint.activate([
      storyImageView.widthAnchor.constraint(equalToConstant: 80),
      storyImageView.heightAnchor.constraint(equalToConstant: 80),
      storyImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      storyImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
  }
  
  private func setupDescriptionLabelConstraint() {
    NSLayoutConstraint.activate([
      descriptionLabel.widthAnchor.constraint(equalToConstant: 100),
      descriptionLabel.heightAnchor.constraint(equalToConstant: 20),
      descriptionLabel.topAnchor.constraint(equalTo: storyImageView.bottomAnchor, constant: 5),
      descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
  }
}
