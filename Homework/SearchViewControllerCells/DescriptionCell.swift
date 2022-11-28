import UIKit

final class DescriptionCell: UITableViewCell {
  // MARK: - Private Properties
  private let nameLabel = UILabel()
  private let professionLabel = UILabel()
  private let jobTitleLabel = UILabel()
  private let siteLabel = UILabel()
  private let subscribersLabel = UILabel()
  private let whoSubscribeLabel = UILabel()
  private let subscribeButton = UIButton(type: .system)
  private let writeButton = UIButton(type: .system)
  private let downChevron = UIButton(type: .system)
  
  // MARK: - UITableViewCell
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupCell()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupNameLabel() {
    nameLabel.font = .systemFont(ofSize: 15, weight: .bold)
    nameLabel.textColor = .white
    nameLabel.textAlignment = .left
  }
  
  private func setupProfessionLabel() {
    professionLabel.font = .systemFont(ofSize: 15, weight: .regular)
    professionLabel.textColor = .gray
    professionLabel.textAlignment = .left
  }
  
  private func setupJobTitleLabel() {
    jobTitleLabel.font = .systemFont(ofSize: 15, weight: .regular)
    jobTitleLabel.textColor = .white
    jobTitleLabel.numberOfLines = 2
    jobTitleLabel.textAlignment = .left
  }
  
  private func setupSiteLabel() {
    siteLabel.font = .systemFont(ofSize: 15, weight: .regular)
    siteLabel.textColor = .systemBlue
  }
  
  private func setupSubscribersLabel() {
    subscribersLabel.text = "Подписаны:"
    subscribersLabel.font = .systemFont(ofSize: 15, weight: .regular)
    subscribersLabel.textColor = .white
  }
  
  private func setupWhoSubscribeLabel() {
    whoSubscribeLabel.font = .systemFont(ofSize: 15, weight: .bold)
    whoSubscribeLabel.textColor = .white
  }
  
  private func setupSubscribeButton() {
    subscribeButton.setTitle("Подписаться", for: .normal)
    subscribeButton.tintColor = .white
    subscribeButton.backgroundColor = .systemBlue
    subscribeButton.layer.cornerRadius = 6
  }
  
  private func setupWriteButton() {
    writeButton.setTitle("Написать", for: .normal)
    writeButton.tintColor = .white
    writeButton.backgroundColor = .black
    writeButton.layer.cornerRadius = 6
    writeButton.layer.borderWidth = 1
    writeButton.layer.borderColor = UIColor.systemGray.cgColor
  }
  
  private func setupDownChevron() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 10)
    let image = UIImage(systemName: "chevron.down", withConfiguration: configuration)
    downChevron.setImage(image, for: .normal)
    downChevron.tintColor = .white
    downChevron.backgroundColor = .black
    downChevron.layer.cornerRadius = 6
    downChevron.layer.borderWidth = 1
    downChevron.layer.borderColor = UIColor.gray.cgColor
  }
  
  //MARK: - Visual Components
  private func setupAppearance() {
    backgroundColor = .black
    selectionStyle = .none
  }
  
  //MARK: - Private Methods
  private func setupCell() {
    setupNameLabel()
    setupProfessionLabel()
    setupJobTitleLabel()
    setupSiteLabel()
    setupSubscribersLabel()
    setupWhoSubscribeLabel()
    setupSubscribeButton()
    setupWriteButton()
    setupDownChevron()
    setupAppearance()
    addSubviews()
    setupNameLabelConstraint()
    setupProfessionLabelConstraint()
    setupJobTitleLabelConstraint()
    setupSiteLabelConstraint()
    setupSubscribersLabelConstraint()
    setupWhoSubscribeLabelConstraint()
    setupSubscribeButtonConstraint()
    setupWriteButtonConstraint()
    setupDownChevronConstraint()
  }
  
  private func addSubviews() {
    [nameLabel, professionLabel, jobTitleLabel, siteLabel, subscribersLabel, whoSubscribeLabel, subscribeButton,
     writeButton, downChevron].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  //MARK: - Public Methods
  func configureCell(model: DescriptionModel) {
    nameLabel.text = model.name
    professionLabel.text = model.profession
    jobTitleLabel.text = model.jobTitle
    siteLabel.text = model.site
    whoSubscribeLabel.text = model.whoSubscribe
  }
  
  //MARK: - Constraint
  private func setupNameLabelConstraint() {
    NSLayoutConstraint.activate([
      nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      nameLabel.widthAnchor.constraint(equalToConstant: 165),
      nameLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupProfessionLabelConstraint() {
    NSLayoutConstraint.activate([
      professionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      professionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
      professionLabel.widthAnchor.constraint(equalToConstant: 140),
      professionLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupJobTitleLabelConstraint() {
    NSLayoutConstraint.activate([
      jobTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      jobTitleLabel.topAnchor.constraint(equalTo: professionLabel.bottomAnchor, constant: 5),
      jobTitleLabel.widthAnchor.constraint(equalToConstant: 400),
      jobTitleLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupSiteLabelConstraint() {
    NSLayoutConstraint.activate([
      siteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      siteLabel.topAnchor.constraint(equalTo: jobTitleLabel.bottomAnchor, constant: 5),
      siteLabel.widthAnchor.constraint(equalToConstant: 200),
      siteLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupSubscribersLabelConstraint() {
    NSLayoutConstraint.activate([
      subscribersLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      subscribersLabel.topAnchor.constraint(equalTo: siteLabel.bottomAnchor, constant: 5),
      subscribersLabel.widthAnchor.constraint(equalToConstant: 90),
      subscribersLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupWhoSubscribeLabelConstraint() {
    NSLayoutConstraint.activate([
      whoSubscribeLabel.leadingAnchor.constraint(equalTo: subscribersLabel.trailingAnchor, constant: 0),
      whoSubscribeLabel.topAnchor.constraint(equalTo: siteLabel.bottomAnchor, constant: 5),
      whoSubscribeLabel.widthAnchor.constraint(equalToConstant: 150),
      whoSubscribeLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupSubscribeButtonConstraint() {
    NSLayoutConstraint.activate([
      subscribeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      subscribeButton.topAnchor.constraint(equalTo: whoSubscribeLabel.bottomAnchor, constant: 15),
      subscribeButton.widthAnchor.constraint(equalToConstant: 170),
      subscribeButton.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
  
  private func setupWriteButtonConstraint() {
    NSLayoutConstraint.activate([
      writeButton.leadingAnchor.constraint(equalTo: subscribeButton.trailingAnchor, constant: 7),
      writeButton.topAnchor.constraint(equalTo: whoSubscribeLabel.bottomAnchor, constant: 15),
      writeButton.widthAnchor.constraint(equalToConstant: 170),
      writeButton.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
  
  private func setupDownChevronConstraint() {
    NSLayoutConstraint.activate([
      downChevron.leadingAnchor.constraint(equalTo: writeButton.trailingAnchor, constant: 7),
      downChevron.topAnchor.constraint(equalTo: whoSubscribeLabel.bottomAnchor, constant: 15),
      downChevron.widthAnchor.constraint(equalToConstant: 40),
      downChevron.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
}
