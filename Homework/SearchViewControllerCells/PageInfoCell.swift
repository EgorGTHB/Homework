import UIKit

final class PageInfoCell: UITableViewCell {
  // MARK: - Private Properties
  private let avatarImageView = UIImageView()
  private let postsCountLabel = UILabel()
  private let postsLabel = UILabel()
  private let subscribersCountLabel = UILabel()
  private let subscribersLabel = UILabel()
  private let subscriptionsCountLabel = UILabel()
  private let subscriptionsLabel = UILabel()
  
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
    avatarImageView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
    avatarImageView.layer.cornerRadius = 60
    avatarImageView.clipsToBounds = true
    avatarImageView.contentMode = .scaleAspectFill
    gradient(view: avatarImageView)
  }
  
  private func setupPostsCountLabel() {
    postsCountLabel.textAlignment = .center
    postsCountLabel.textColor = .white
    postsCountLabel.font = .systemFont(ofSize: 16, weight: .bold)
  }
  
  private func setupPostsLabel() {
    postsLabel.text = "Публикации"
    postsLabel.textAlignment = .center
    postsLabel.textColor = .white
    postsLabel.font = .systemFont(ofSize: 14, weight: .regular)
  }
  
  private func setupSubscribersCountLabel() {
    subscribersCountLabel.textAlignment = .center
    subscribersCountLabel.textColor = .white
    subscribersCountLabel.font = .systemFont(ofSize: 16, weight: .bold)
  }
  
  private func setupSubscribersLabel() {
    subscribersLabel.text = "Подписчики"
    subscribersLabel.textAlignment = .center
    subscribersLabel.textColor = .white
    subscribersLabel.font = .systemFont(ofSize: 14, weight: .regular)
  }
  
  private func setupSubscriptionsCountLabel() {
    subscriptionsCountLabel.textAlignment = .center
    subscriptionsCountLabel.textColor = .gray
    subscriptionsCountLabel.font = .systemFont(ofSize: 16, weight: .bold)
  }
  
  private func setupSubscriptionsLabel() {
    subscriptionsLabel.text = "Подписки"
    subscriptionsLabel.textAlignment = .center
    subscriptionsLabel.textColor = .white
    subscriptionsLabel.font = .systemFont(ofSize: 14, weight: .regular)
  }
  
  //MARK: - Private Methods
  private func setupCell() {
    setupAppearance()
    
    setupAvatarImageView()
    setupPostsCountLabel()
    setupPostsLabel()
    setupSubscribersCountLabel()
    setupSubscribersLabel()
    setupSubscriptionsCountLabel()
    setupSubscriptionsLabel()
    addSubviews()
    setupAvatarImageViewConstraint()
    setupPostsCountLabelConstraint()
    setupPostsLabelConstraint()
    setupSubscribersCountLabelConstraint()
    setupSubscribersLabelConstraint()
    setupSubscriptionsCountLabelConstraint()
    setupSubscriptionsLabelConstraint()
  }
  
  private func setupAppearance() {
    backgroundColor = .black
    selectionStyle = .none
  }
  
  private func addSubviews() {
    [avatarImageView, postsCountLabel, postsLabel, subscribersCountLabel, subscribersLabel, subscriptionsCountLabel, subscriptionsLabel].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  //MARK: - Public Methods
  func configureCell(model: PageInfoModel) {
    avatarImageView.image = UIImage(named: model.avatarImage)
    postsCountLabel.text = model.postsCount
    subscribersCountLabel.text = model.subscribersCount
    subscriptionsCountLabel.text = model.subscriptionsCount
  }
  
  //MARK: - Constraints
  private func setupAvatarImageViewConstraint() {
    NSLayoutConstraint.activate([
      avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
      avatarImageView.widthAnchor.constraint(equalToConstant: 120),
      avatarImageView.heightAnchor.constraint(equalToConstant: 120),
      avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
  
  private func setupPostsCountLabelConstraint() {
    NSLayoutConstraint.activate([
      postsCountLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 35),
      postsCountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
      postsCountLabel.widthAnchor.constraint(equalToConstant: 40),
      postsCountLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupPostsLabelConstraint() {
    NSLayoutConstraint.activate([
      postsLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
      postsLabel.topAnchor.constraint(equalTo: postsCountLabel.bottomAnchor, constant: 5),
      postsLabel.widthAnchor.constraint(equalToConstant: 90),
      postsLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupSubscribersCountLabelConstraint() {
    NSLayoutConstraint.activate([
      subscribersCountLabel.leadingAnchor.constraint(equalTo: postsCountLabel.trailingAnchor, constant: 40),
      subscribersCountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
      subscribersCountLabel.widthAnchor.constraint(equalToConstant: 80),
      subscribersCountLabel.heightAnchor.constraint(equalToConstant: 20),
    ])
  }
  
  private func setupSubscribersLabelConstraint() {
    NSLayoutConstraint.activate([
      subscribersLabel.leadingAnchor.constraint(equalTo: postsLabel.trailingAnchor, constant: 10),
      subscribersLabel.topAnchor.constraint(equalTo: subscribersCountLabel.bottomAnchor, constant: 5),
      subscribersLabel.widthAnchor.constraint(equalToConstant: 90),
      subscribersLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupSubscriptionsCountLabelConstraint() {
    NSLayoutConstraint.activate([
      subscriptionsCountLabel.leadingAnchor.constraint(equalTo: subscribersCountLabel.trailingAnchor, constant: 40),
      subscriptionsCountLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
      subscriptionsCountLabel.widthAnchor.constraint(equalToConstant: 20),
      subscriptionsCountLabel.heightAnchor.constraint(equalToConstant: 20),
    ])
  }
  
  private func setupSubscriptionsLabelConstraint() {
    NSLayoutConstraint.activate([
      subscriptionsLabel.leadingAnchor.constraint(equalTo: subscribersLabel.trailingAnchor, constant: 10),
      subscriptionsLabel.topAnchor.constraint(equalTo: subscriptionsCountLabel.bottomAnchor, constant: 5),
      subscriptionsLabel.widthAnchor.constraint(equalToConstant: 70),
      subscriptionsLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
}

