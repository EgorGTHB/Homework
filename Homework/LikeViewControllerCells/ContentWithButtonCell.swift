import UIKit

final class ContentWithButtonCell: UITableViewCell {
  //MARK: - Private Properties
  private let someoneElseAccountPhoto = UIImageView()
  private let mentionTextLabel = UILabel()
  private let subscribeButton = UIButton(type: .system)
  
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
 
  //MARK: - Private Methods
  private func setupCell() {
    setupAppearance()
    setupSomeoneElseAccountPhoto()
    setupMentionTextLabel()
    addSubviews()
    setupSomeoneElseAccountPhotoConstraint()
    setupMentionTextLabelConstraint()
    setupOwnPhotoConstraint()
  }
  
  private func addSubviews() {
    [someoneElseAccountPhoto, mentionTextLabel, subscribeButton].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func setupAppearanceButton(option: Bool) {
    if option {
      subscribeButton.setTitle("Подписаться", for: .normal)
      subscribeButton.backgroundColor = .systemBlue
      subscribeButton.tintColor = .white
      subscribeButton.layer.cornerRadius = 5
    } else {
      subscribeButton.setTitle("Вы подписаны", for: .normal)
      subscribeButton.backgroundColor = .black
      subscribeButton.tintColor = .white
      subscribeButton.layer.borderWidth = 0.5
      subscribeButton.layer.borderColor = UIColor.gray.cgColor
      subscribeButton.layer.cornerRadius = 5
    }
  }
  
  // MARK: - Public methods
  func configureCell(model: ContentWithButtonModel) {
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
    setupAppearanceButton(option: model.optionButton)
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
      mentionTextLabel.widthAnchor.constraint(equalToConstant: 170),
      mentionTextLabel.heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  private func setupOwnPhotoConstraint() {
    NSLayoutConstraint.activate([
      subscribeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
      subscribeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      subscribeButton.widthAnchor.constraint(equalToConstant: 150),
      subscribeButton.heightAnchor.constraint(equalToConstant: 30)
    ])
  }
}
