import UIKit

final class PostCell: UITableViewCell {
  // MARK: - Private Properties
  private let avatarImageView = UIImageView()
  private let nicknameLabel = UILabel()
  private let ellipsisButton = UIButton()
  private let photoOfPostImageView = UIImageView()
  private let likeButton = UIButton()
  private let commentsButton = UIButton()
  private let paperplaneButton = UIButton()
  private let likeCountLabel = UILabel()
  private let commentatorNicknameLabel = UILabel()
  private let commentTextLabel = UILabel()
  private let seeCommentLabel = UILabel()
  private let avatarImageViewTwo = UIImageView()
  private let addCommentLabel = UILabel()
  private let heartEmojiLabel = UILabel()
  private let handsEmojiLabel = UILabel()
  private let plusCircleButton = UIButton()
  private let timeOfPublicationOfPost = UILabel()
  private let stackViewOne = UIStackView()
  private let stackViewTwo = UIStackView()
  private let stackViewThree = UIStackView()
  private let stackViewFour = UIStackView()
  private let stackViewFive = UIStackView()
  
  // MARK: - UITableViewCell
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupCell()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Visual Components
  private func setupAvatarImageView() {
    avatarImageView.image = UIImage(named: "avatar")
    avatarImageView.layer.cornerRadius = 20
    avatarImageView.clipsToBounds = true
   }
  
  private func setupNicknameLabel() {
    nicknameLabel.text = "daniil"
    nicknameLabel.textAlignment = .center
    nicknameLabel.textColor = .white
    nicknameLabel.font = .systemFont(ofSize: 16, weight: .bold)
  }
  
  private func setupEllipsisButton() {
    ellipsisButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
    ellipsisButton.tintColor = .white
  }
  
  private func setupPhotoOfPostImageView() {
    photoOfPostImageView.image = UIImage(named: "photoOfPost")
    photoOfPostImageView.contentMode = .scaleToFill
  }
  
  private func setupLikeButton() {
    likeButton.setImage(UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)), for: .normal)
    likeButton.tintColor = .white
    likeButton.titleLabel?.font = .systemFont(ofSize: 30)
  }
  
  private func setupCommentsButton() {
    commentsButton.setImage(UIImage(systemName: "bubble.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)), for: .normal)
    commentsButton.tintColor = .white
    commentsButton.titleLabel?.font = .systemFont(ofSize: 30)
  }
  
  private func setupPaperplaneButton() {
    paperplaneButton.setImage(UIImage(systemName: "paperplane", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)), for: .normal)
    paperplaneButton.tintColor = .white
    paperplaneButton.titleLabel?.font = .systemFont(ofSize: 30)
  }
  
  private func setupLikeCountLabel() {
    likeCountLabel.text = "Нравится: 20"
    likeCountLabel.textAlignment = .left
    likeCountLabel.textColor = .white
    likeCountLabel.font = .systemFont(ofSize: 17, weight: .bold)
  }
  
  private func setupCommentatorNicknameLabel() {
    commentatorNicknameLabel.text = "daniil"
    commentatorNicknameLabel.textAlignment = .left
    commentatorNicknameLabel.textColor = .white
    commentatorNicknameLabel.font = .systemFont(ofSize: 17, weight: .bold)
  }
  
  private func setupCommentTextLabel() {
    commentTextLabel.text = "цветочное полецветочное полецветочное полецветочное полецветочное полецветочное поле"
    commentTextLabel.textAlignment = .left
    commentTextLabel.textColor = .white
    commentTextLabel.numberOfLines = 2
  }
  
  private func setupSeeCommentLabel() {
    seeCommentLabel.text = "Посмотреть комментарий"
    seeCommentLabel.textAlignment = .left
    seeCommentLabel.textColor = .gray
  }
  
  private func setupAvatarImageView2() {
    avatarImageViewTwo.image = UIImage(named: "avatar")
    avatarImageViewTwo.layer.cornerRadius = 20
    avatarImageViewTwo.clipsToBounds = true
  }
  
  private func setupAddCommentLabel() {
    addCommentLabel.text = "Добавьте комментарий..."
    addCommentLabel.textAlignment = .left
    addCommentLabel.textColor = .gray
  }
  
  private func setupHeartEmojiLabel() {
    heartEmojiLabel.text = "❤️"
    heartEmojiLabel.textAlignment = .left
    heartEmojiLabel.textColor = .gray
  }
  
  private func setupHandsEmojiLabel() {
    handsEmojiLabel.text = "🙌"
    handsEmojiLabel.textAlignment = .left
    handsEmojiLabel.textColor = .gray
  }
  
  private func setupPlusCircleButton() {
    plusCircleButton.setImage(UIImage(systemName: "plus.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20)), for: .normal)
    plusCircleButton.tintColor = .gray
  }
  
  private func setupTimeOfPublicationOfPost() {
    timeOfPublicationOfPost.text = "4 минуты назад"
    timeOfPublicationOfPost.textAlignment = .left
    timeOfPublicationOfPost.textColor = .gray
  }
  
  //MARK: - Private Methods
  private func setupCell() {
    setupAppearance()
    setupAvatarImageView()
    setupNicknameLabel()
    setupEllipsisButton()
    setupPhotoOfPostImageView()
    setupLikeButton()
    setupCommentsButton()
    setupPaperplaneButton()
    setupLikeCountLabel()
    setupCommentatorNicknameLabel()
    setupCommentTextLabel()
    setupSeeCommentLabel()
    setupAvatarImageView2()
    setupAddCommentLabel()
    setupHeartEmojiLabel()
    setupHandsEmojiLabel()
    setupPlusCircleButton()
    setupTimeOfPublicationOfPost()
    addSubviews()
    setupAvatarConstraints()
    setupNicknameLabelConstraints()
    setupEllipsisButtonConstraints()
    setupStackViewOne()
    setupStackViewOneConstraints()
    setupPhotoOfPostImageViewConstraints()
    setupLikeButtonConstraints()
    setupCommentsButtonConstraints()
    setupPaperplaneButtonConstraints()
    setupStackViewTwo()
    setupCommentatorNicknameLabelConstraints()
    setupCommentTextLabelConstraints()
    setupStackViewThree()
    setupSeeCommentLabelConstraint()
    setupAvatarImageViewTwoConstraint()
    setupAddCommentLabelConstraint()
    setupHeartEmojiLabelConstraint()
    setupHandsEmojiLabelConstraint()
    setupPlusCircleButtonConstraint()
    setupStackViewFour()
    setupTimeOfPublicationOfPostConstraint()
    setupStackViewFive()
    setupStackViewFiveConstraint()
  }
  
  private func setupAppearance() {
    backgroundColor = .black
    selectionStyle = .none
  }
  
  private func addSubviews() {
    [avatarImageView, nicknameLabel, stackViewOne, ellipsisButton, photoOfPostImageView, likeButton, commentsButton, paperplaneButton, stackViewTwo, likeCountLabel, commentatorNicknameLabel, commentTextLabel, stackViewThree, seeCommentLabel, avatarImageViewTwo, addCommentLabel, heartEmojiLabel, handsEmojiLabel, plusCircleButton, timeOfPublicationOfPost, stackViewFive].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func setupAvatarConstraints() {
    NSLayoutConstraint.activate([
      avatarImageView.heightAnchor.constraint(equalToConstant: 40),
      avatarImageView.widthAnchor.constraint(equalToConstant: 40)
    ])
  }
  
  private func setupNicknameLabelConstraints() {
    NSLayoutConstraint.activate([
      nicknameLabel.heightAnchor.constraint(equalToConstant: 20),
      nicknameLabel.widthAnchor.constraint(equalToConstant: 50)
    ])
  }
  
  private func setupEllipsisButtonConstraints() {
    NSLayoutConstraint.activate([
      ellipsisButton.heightAnchor.constraint(equalToConstant: 20),
      ellipsisButton.widthAnchor.constraint(equalToConstant: 40),
      
      ellipsisButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      ellipsisButton.topAnchor.constraint(equalTo: topAnchor, constant: 23)
    ])
  }
  
  private func setupStackViewOne() {
    stackViewOne.addArrangedSubview(avatarImageView)
    stackViewOne.addArrangedSubview(nicknameLabel)
    stackViewOne.axis = .horizontal
    stackViewOne.spacing = 5
    stackViewOne.alignment = .center
  }
  
  private func setupStackViewOneConstraints() {
    NSLayoutConstraint.activate([
      stackViewOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      stackViewOne.topAnchor.constraint(equalTo: topAnchor, constant: 10)
    ])
  }
  
  private func setupPhotoOfPostImageViewConstraints() {
    NSLayoutConstraint.activate([
      photoOfPostImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
      photoOfPostImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
      photoOfPostImageView.topAnchor.constraint(equalTo: stackViewOne.bottomAnchor, constant: 10),
      photoOfPostImageView.heightAnchor.constraint(equalToConstant: 300)
    ])
  }
  
  private func setupLikeButtonConstraints() {
    NSLayoutConstraint.activate([
      likeButton.heightAnchor.constraint(equalToConstant: 30),
      likeButton.widthAnchor.constraint(equalToConstant: 35)
    ])
  }
  
  private func setupCommentsButtonConstraints() {
    NSLayoutConstraint.activate([
      commentsButton.heightAnchor.constraint(equalToConstant: 30),
      commentsButton.widthAnchor.constraint(equalToConstant: 35)
    ])
  }
  
  private func setupPaperplaneButtonConstraints() {
    NSLayoutConstraint.activate([
      paperplaneButton.heightAnchor.constraint(equalToConstant: 30),
      paperplaneButton.widthAnchor.constraint(equalToConstant: 35)
    ])
  }
  
  private func setupStackViewTwo() {
    stackViewTwo.addArrangedSubview(likeButton)
    stackViewTwo.addArrangedSubview(commentsButton)
    stackViewTwo.addArrangedSubview(paperplaneButton)
    stackViewTwo.axis = .horizontal
    stackViewTwo.spacing = 10
    stackViewTwo.alignment = .center
  }
  
  private func setupCommentatorNicknameLabelConstraints() {
    NSLayoutConstraint.activate([
      commentatorNicknameLabel.heightAnchor.constraint(equalToConstant: 35),
      commentatorNicknameLabel.widthAnchor.constraint(equalToConstant: 47)
    ])
  }
  
  private func setupCommentTextLabelConstraints() {
    NSLayoutConstraint.activate([
      commentTextLabel.heightAnchor.constraint(equalToConstant: 20),
      commentTextLabel.widthAnchor.constraint(equalToConstant: 350)
    ])
  }
  
  private func setupStackViewThree() {
    stackViewThree.addArrangedSubview(commentatorNicknameLabel)
    stackViewThree.addArrangedSubview(commentTextLabel)
    stackViewThree.axis = .horizontal
    stackViewThree.spacing = 4
    stackViewThree.alignment = .center
  }
  
  private func setupSeeCommentLabelConstraint() {
    NSLayoutConstraint.activate([
      seeCommentLabel.heightAnchor.constraint(equalToConstant: 20),
      seeCommentLabel.widthAnchor.constraint(equalToConstant: 250)
    ])
  }
  
  private func setupAvatarImageViewTwoConstraint() {
    NSLayoutConstraint.activate([
      avatarImageViewTwo.heightAnchor.constraint(equalToConstant: 40),
      avatarImageViewTwo.widthAnchor.constraint(equalToConstant: 40)
    ])
  }
  
  private func setupAddCommentLabelConstraint() {
    NSLayoutConstraint.activate([
      addCommentLabel.heightAnchor.constraint(equalToConstant: 20),
      addCommentLabel.widthAnchor.constraint(equalToConstant: 220)
    ])
  }
  
  private func setupHeartEmojiLabelConstraint() {
    NSLayoutConstraint.activate([
      heartEmojiLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      heartEmojiLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10)
    ])
  }
  
  private func setupHandsEmojiLabelConstraint() {
    NSLayoutConstraint.activate([
      handsEmojiLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      handsEmojiLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10)
    ])
  }
  
  private func setupPlusCircleButtonConstraint() {
    NSLayoutConstraint.activate([
      plusCircleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
      plusCircleButton.topAnchor.constraint(equalTo: topAnchor, constant: 35)
    ])
  }
  
  private func setupStackViewFour() {
    stackViewFour.addArrangedSubview(avatarImageViewTwo)
    stackViewFour.setCustomSpacing(15, after: avatarImageViewTwo)
    stackViewFour.addArrangedSubview(addCommentLabel)
    stackViewFour.addArrangedSubview(heartEmojiLabel)
    stackViewFour.setCustomSpacing(15, after: heartEmojiLabel)
    stackViewFour.addArrangedSubview(handsEmojiLabel)
    stackViewFour.setCustomSpacing(15, after: handsEmojiLabel)
    stackViewFour.addArrangedSubview(plusCircleButton)
    stackViewFour.axis = .horizontal
    stackViewFour.spacing = 4
    stackViewFour.alignment = .center
  }
  
  private func setupTimeOfPublicationOfPostConstraint() {
    NSLayoutConstraint.activate([
      timeOfPublicationOfPost.heightAnchor.constraint(equalToConstant: 20),
      timeOfPublicationOfPost.widthAnchor.constraint(equalToConstant: 150)
    ])
  }
  
  private func setupStackViewFive() {
    stackViewFive.addArrangedSubview(stackViewTwo)
    stackViewFive.addArrangedSubview(likeCountLabel)
    stackViewFive.addArrangedSubview(stackViewThree)
    stackViewFive.addArrangedSubview(seeCommentLabel)
    stackViewFive.setCustomSpacing(13, after: seeCommentLabel)
    stackViewFive.addArrangedSubview(stackViewFour)
    stackViewFive.setCustomSpacing(13, after: stackViewFour)
    stackViewFive.addArrangedSubview(timeOfPublicationOfPost)
    stackViewFive.axis = .vertical
    stackViewFive.spacing = 5
    stackViewFive.alignment = .leading
    stackViewFive.setCustomSpacing(220, after: nicknameLabel)
  }
  
  private func setupStackViewFiveConstraint() {
    NSLayoutConstraint.activate([
      stackViewFive.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      stackViewFive.topAnchor.constraint(equalTo: photoOfPostImageView.bottomAnchor, constant: 10),
      stackViewFive.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
    ])
  }
}
