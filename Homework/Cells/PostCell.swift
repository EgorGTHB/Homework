import UIKit

class PostCell: UITableViewCell {
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
  private let avatarImageView2 = UIImageView()
  private let addCommentLabel = UILabel()
  private let heartEmojiLabel = UILabel()
  private let handsEmojiLabel = UILabel()
  private let plusCircleButton = UIButton()
  private let timeOfPublicationOfPost = UILabel()
  private let stackView1 = UIStackView()
  private let stackView2 = UIStackView()
  private let stackView3 = UIStackView()
  private let stackView4 = UIStackView()
  private let stackView5 = UIStackView()
  
  // MARK: - UITableViewCell
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupCell()
  }
  
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
    avatarImageView2.image = UIImage(named: "avatar")
    avatarImageView2.layer.cornerRadius = 20
    avatarImageView2.clipsToBounds = true
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
    setupStackView1()
    setupStackView1Constraints()
    setupPhotoOfPostImageViewConstraints()
    setupLikeButtonConstraints()
    setupCommentsButtonConstraints()
    setupPaperplaneButtonConstraints()
    setupStackView2()
    setupCommentatorNicknameLabelConstraints()
    setupCommentTextLabelConstraints()
    setupStackView3()
    setupSeeCommentLabelConstraint()
    setupAvatarImageView2Constraint()
    setupAddCommentLabelConstraint()
    setupHeartEmojiLabelConstraint()
    setupHandsEmojiLabelConstraint()
    setupPlusCircleButtonConstraint()
    setupStackView4()
    setupTimeOfPublicationOfPostConstraint()
    setupStackView5()
    setupStackView5Constraint()
  }
  
  private func setupAppearance() {
    backgroundColor = .black
    selectionStyle = .none
  }
  
  private func addSubviews() {
    [avatarImageView, nicknameLabel, stackView1, ellipsisButton, photoOfPostImageView, likeButton, commentsButton, paperplaneButton, stackView2, likeCountLabel, commentatorNicknameLabel, commentTextLabel, stackView3, seeCommentLabel, avatarImageView2, addCommentLabel, heartEmojiLabel, handsEmojiLabel, plusCircleButton, timeOfPublicationOfPost, stackView5].forEach {
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
  
  private func setupStackView1() {
    stackView1.addArrangedSubview(avatarImageView)
    stackView1.addArrangedSubview(nicknameLabel)
    stackView1.axis = .horizontal
    stackView1.spacing = 5
    stackView1.alignment = .center
  }
  
  private func setupStackView1Constraints() {
    NSLayoutConstraint.activate([
      stackView1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      stackView1.topAnchor.constraint(equalTo: topAnchor, constant: 10)
    ])
  }
  
  private func setupPhotoOfPostImageViewConstraints() {
    NSLayoutConstraint.activate([
      photoOfPostImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
      photoOfPostImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
      photoOfPostImageView.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 10),
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
  
  private func setupStackView2() {
    stackView2.addArrangedSubview(likeButton)
    stackView2.addArrangedSubview(commentsButton)
    stackView2.addArrangedSubview(paperplaneButton)
    stackView2.axis = .horizontal
    stackView2.spacing = 10
    stackView2.alignment = .center
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
  
  private func setupStackView3() {
    stackView3.addArrangedSubview(commentatorNicknameLabel)
    stackView3.addArrangedSubview(commentTextLabel)
    stackView3.axis = .horizontal
    stackView3.spacing = 4
    stackView3.alignment = .center
  }
  
  private func setupSeeCommentLabelConstraint() {
    NSLayoutConstraint.activate([
      seeCommentLabel.heightAnchor.constraint(equalToConstant: 20),
      seeCommentLabel.widthAnchor.constraint(equalToConstant: 250)
    ])
  }
  
  private func setupAvatarImageView2Constraint() {
    NSLayoutConstraint.activate([
      avatarImageView2.heightAnchor.constraint(equalToConstant: 40),
      avatarImageView2.widthAnchor.constraint(equalToConstant: 40)
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
  
  private func setupStackView4() {
    stackView4.addArrangedSubview(avatarImageView2)
    stackView4.setCustomSpacing(15, after: avatarImageView2)
    stackView4.addArrangedSubview(addCommentLabel)
    stackView4.addArrangedSubview(heartEmojiLabel)
    stackView4.setCustomSpacing(15, after: heartEmojiLabel)
    stackView4.addArrangedSubview(handsEmojiLabel)
    stackView4.setCustomSpacing(15, after: handsEmojiLabel)
    stackView4.addArrangedSubview(plusCircleButton)
    stackView4.axis = .horizontal
    stackView4.spacing = 4
    stackView4.alignment = .center
  }
  
  private func setupTimeOfPublicationOfPostConstraint() {
    NSLayoutConstraint.activate([
      timeOfPublicationOfPost.heightAnchor.constraint(equalToConstant: 20),
      timeOfPublicationOfPost.widthAnchor.constraint(equalToConstant: 150)
    ])
  }
  
  private func setupStackView5() {
    stackView5.addArrangedSubview(stackView2)
    stackView5.addArrangedSubview(likeCountLabel)
    stackView5.addArrangedSubview(stackView3)
    stackView5.addArrangedSubview(seeCommentLabel)
    stackView5.setCustomSpacing(13, after: seeCommentLabel)
    stackView5.addArrangedSubview(stackView4)
    stackView5.setCustomSpacing(13, after: stackView4)
    stackView5.addArrangedSubview(timeOfPublicationOfPost)
    stackView5.axis = .vertical
    stackView5.spacing = 5
    stackView5.alignment = .leading
    stackView5.setCustomSpacing(220, after: nicknameLabel)
  }
  
  private func setupStackView5Constraint() {
    NSLayoutConstraint.activate([
      stackView5.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      stackView5.topAnchor.constraint(equalTo: photoOfPostImageView.bottomAnchor, constant: 10),
      stackView5.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
    ])
  }
}
