import UIKit

final class LikeYourContentCell: UITableViewCell {
  //MARK: - Private Properties
  private let someoneElseAccountPhoto = UIImageView()
  private let mentionTextLabel = UILabel()
  private let ownPhoto = UIImageView()
  
  //MARK: - UITableViewCell
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupCell()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Visual Components
  private func setupAppearance() {
    backgroundColor = .black
    selectionStyle = .none
  }
  
  private func setupSomeoneElseAccountPhoto() {
    someoneElseAccountPhoto.layer.cornerRadius = 20
    someoneElseAccountPhoto.clipsToBounds = true
    someoneElseAccountPhoto.contentMode = .scaleAspectFill
  }
  
  private func setupMentionTextLabel() {
    mentionTextLabel.textAlignment = .left
    mentionTextLabel.numberOfLines = 3
  }
  
  private func setupOwnPhoto() {
    ownPhoto.contentMode = .scaleToFill
  }
  
  //MARK: - Private Methods
  private func setupCell() {
    setupAppearance()
    setupSomeoneElseAccountPhoto()
    setupMentionTextLabel()
    setupOwnPhoto()
    addSubviews()
    setupSomeoneElseAccountPhotoConstraint()
    setupMentionTextLabelConstraint()
    setupOwnPhotoConstraint()
  }
  
  private func addSubviews() {
    [someoneElseAccountPhoto, mentionTextLabel, ownPhoto].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  //MARK: - Public methods
  func configureCell(model: LikeYourContentModel) {
    someoneElseAccountPhoto.image = UIImage(named: model.imageSomeone)
    let attrsOne = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.white]
    let attrsTwo = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.white]
    let attrsThree = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
    let attrsFour = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.white]
    let attrsFive = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular), NSAttributedString.Key.foregroundColor: UIColor.gray]
    let attributedStringOne = NSMutableAttributedString(string: model.atrOne, attributes: attrsOne)
    let attributedStringTwo = NSMutableAttributedString(string: model.atrTwo, attributes: attrsTwo)
    let attributedStringThree = NSMutableAttributedString(string: model.atrThree, attributes: attrsThree)
    let attributedStringFour = NSMutableAttributedString(string: model.atrFour, attributes: attrsFour)
    let attributedStringFive = NSMutableAttributedString(string: model.atrFive, attributes: attrsFive)
    attributedStringOne.append(attributedStringTwo)
    attributedStringOne.append(attributedStringThree)
    attributedStringOne.append(attributedStringFour)
    attributedStringOne.append(attributedStringFive)
    mentionTextLabel.attributedText = attributedStringOne
    ownPhoto.image = UIImage(named: model.imageOwn)
  }
  
  //MARK: - Constraints
  private func setupSomeoneElseAccountPhotoConstraint() {
    NSLayoutConstraint.activate([
      someoneElseAccountPhoto.centerYAnchor.constraint(equalTo: centerYAnchor),
      someoneElseAccountPhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
      someoneElseAccountPhoto.widthAnchor.constraint(equalToConstant: 40),
      someoneElseAccountPhoto.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
  
  private func setupMentionTextLabelConstraint() {
    NSLayoutConstraint.activate([
      mentionTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      mentionTextLabel.leadingAnchor.constraint(equalTo: someoneElseAccountPhoto.trailingAnchor, constant: 10),
      mentionTextLabel.widthAnchor.constraint(equalToConstant: 200),
      mentionTextLabel.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  private func setupOwnPhotoConstraint() {
    NSLayoutConstraint.activate([
      ownPhoto.centerYAnchor.constraint(equalTo: centerYAnchor),
      ownPhoto.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      ownPhoto.widthAnchor.constraint(equalToConstant: 40),
      ownPhoto.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
}
