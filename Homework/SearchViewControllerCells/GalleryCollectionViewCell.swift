import UIKit

final class GalleryCollectionViewCell: UICollectionViewCell {
  //MARK: - Private Properties
  private let frameImageView = UIImageView()
  
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
    backgroundColor = .white
  }
  
  private func setupStoryImageView() {
    frameImageView.contentMode = .scaleToFill
  }
  
  //MARK: - Private Methods
  private func setupCell() {
    setupStoryImageView()
    setupAppearance()
    addSubviews()
    setupStoryImageViewConstraint()
  }
  
  private func addSubviews() {
    [frameImageView].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  //MARK: - Public Methods
  func configureCell(model: GalleryModel) {
    frameImageView.image = UIImage(named: model.image)
  }
  
  //MARK: - Constraints
  private func setupStoryImageViewConstraint() {
    NSLayoutConstraint.activate([
      frameImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
      frameImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
      frameImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
      frameImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
    ])
  }
}
