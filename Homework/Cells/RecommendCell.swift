import UIKit

final class RecommendCell: UITableViewCell {
  // MARK: - Private Properties
  private let recommendScrollView = UIScrollView()
  private let helpView = UIView()
  private let recommendForToYouLabel = UILabel()
  private let recommendViewOne = UIView()
  private let photoOne = UIImageView()
  private let nickNameLabelOne = UILabel()
  private let recommendedToYouLabel1 = UILabel()
  private let subscribeButtonOne = UIButton()
  private let recommendViewTwo = UIView()
  private let photoTwo = UIImageView()
  private let nickNameLabelTwo = UILabel()
  private let recommendedToYouLabelTwo = UILabel()
  private let subscribeButtonTwo = UIButton()
  private let recommendViewThree = UIView()
  private let photoThree = UIImageView()
  private let nickNameLabelThree = UILabel()
  private let recommendedToYouLabelThree = UILabel()
  private let subscribeButtonThree = UIButton()
  private let stackViewOne = UIStackView()
  
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
  private func setupAppearance() {
    backgroundColor = UIColor(red: 20/255, green: 20/255, blue: 20/255, alpha: 1)
    selectionStyle = .none
  }
  
  private func setupRecommendForYouLabel() {
    recommendForToYouLabel.text = "Рекомендуем вам"
    recommendForToYouLabel.textColor = .white
    recommendForToYouLabel.font = .systemFont(ofSize: 17, weight: .bold)
  }
  
  private func setupRecommendViewOne() {
    recommendViewOne.backgroundColor = .black
    recommendViewOne.layer.cornerRadius = 17
    recommendViewOne.layer.masksToBounds = true
  }
  
  private func setupPhotoOne() {
    photoOne.image = UIImage(named: "avatar")
    photoOne.backgroundColor = .systemPink
    photoOne.layer.cornerRadius = 100
    photoOne.layer.masksToBounds = true
  }
  
  private func setupNickNameLabelOne() {
    nickNameLabelOne.text = "NickName1"
    nickNameLabelOne.textColor = .white
    nickNameLabelOne.font = .systemFont(ofSize: 17, weight: .bold)
    nickNameLabelOne.textAlignment = .center
  }
  
  private func setupRecommendedToYouLabelOne() {
    recommendedToYouLabel1.text = "Рекомендации для вас"
    recommendedToYouLabel1.textColor = .gray
    recommendedToYouLabel1.font = .systemFont(ofSize: 15, weight: .regular)
    recommendedToYouLabel1.textAlignment = .center
  }
  
  private func setupSubscribeButtonOne() {
    subscribeButtonOne.setTitle("Подписаться", for: .normal)
    subscribeButtonOne.backgroundColor = .systemBlue
    subscribeButtonOne.setTitleColor(.white, for: .normal)
    subscribeButtonOne.layer.cornerRadius = 5
  }
  
  private func setupRecommendViewTwo() {
    recommendViewTwo.backgroundColor = .black
    recommendViewTwo.layer.cornerRadius = 17
    recommendViewTwo.layer.masksToBounds = true
  }
  
  private func setupPhotoTwo() {
    photoTwo.image = UIImage(named: "avatar")
    photoTwo.backgroundColor = .systemPink
    photoTwo.layer.cornerRadius = 100
    photoTwo.layer.masksToBounds = true
  }
  
  private func setupNickNameLabelTwo() {
    nickNameLabelTwo.text = "NickName2"
    nickNameLabelTwo.textColor = .white
    nickNameLabelTwo.font = .systemFont(ofSize: 17, weight: .bold)
    nickNameLabelTwo.textAlignment = .center
  }
  
  private func setupRecommendedToYouLabelTwo() {
    recommendedToYouLabelTwo.text = "Рекомендации для вас"
    recommendedToYouLabelTwo.textColor = .gray
    recommendedToYouLabelTwo.font = .systemFont(ofSize: 15, weight: .regular)
    recommendedToYouLabelTwo.textAlignment = .center
  }
  
  private func setupSubscribeButtonTwo() {
    subscribeButtonTwo.setTitle("Подписаться", for: .normal)
    subscribeButtonTwo.backgroundColor = .systemBlue
    subscribeButtonTwo.setTitleColor(.white, for: .normal)
    subscribeButtonTwo.layer.cornerRadius = 5
  }
  
  private func setupRecommendViewThree() {
    recommendViewThree.backgroundColor = .black
    recommendViewThree.layer.cornerRadius = 17
    recommendViewThree.layer.masksToBounds = true
  }
  
  private func setupPhotoThree() {
    photoThree.image = UIImage(named: "avatar")
    photoThree.backgroundColor = .systemPink
    photoThree.layer.cornerRadius = 100
    photoThree.layer.masksToBounds = true
  }
  
  private func setupNickNameLabelThree() {
    nickNameLabelThree.text = "NickName3"
    nickNameLabelThree.textColor = .white
    nickNameLabelThree.font = .systemFont(ofSize: 17, weight: .bold)
    nickNameLabelThree.textAlignment = .center
  }
  
  private func setupRecommendedToYouLabelThree() {
    recommendedToYouLabelThree.text = "Рекомендации для вас"
    recommendedToYouLabelThree.textColor = .gray
    recommendedToYouLabelThree.font = .systemFont(ofSize: 15, weight: .regular)
    recommendedToYouLabelThree.textAlignment = .center
  }
  
  private func setupSubscribeButtonThree() {
    subscribeButtonThree.setTitle("Подписаться", for: .normal)
    subscribeButtonThree.backgroundColor = .systemBlue
    subscribeButtonThree.setTitleColor(.white, for: .normal)
    subscribeButtonThree.layer.cornerRadius = 5
  }
  
  private func setupRecommendScrollView() {
    recommendScrollView.contentSize = CGSize(width: 800, height: 100)
  }
  
  private func setupHelpView() {
    helpView.frame.size = CGSize(width: 1000, height: 100)
  }
  
  //MARK: - Private Methods
  private func setupCell() {
    setupAppearance()
    setupRecommendForYouLabel()
    setupRecommendViewOne()
    setupPhotoOne()
    setupNickNameLabelOne()
    setupRecommendedToYouLabelOne()
    setupSubscribeButtonOne()
    setupRecommendViewTwo()
    setupPhotoTwo()
    setupNickNameLabelTwo()
    setupRecommendedToYouLabelTwo()
    setupSubscribeButtonTwo()
    setupRecommendViewThree()
    setupPhotoThree()
    setupNickNameLabelThree()
    setupRecommendedToYouLabelThree()
    setupSubscribeButtonThree()
    setupRecommendScrollView()
    setupHelpView()
    addSubviews()
    addSubviewsToPhotoScrollView()
    addSubviewsToHelpView()
    addSubviewsToRecommendViewOne()
    addSubviewsToRecommendViewTwo()
    addSubviewsToRecommendViewThree()
    setupRecommendForYouLabelConstraint()
    setupRecommendView1Constraint()
    setupPhoto1Constraint()
    setupNickNameLabelOneConstraint()
    setupRecommendedToYouLabel1Constraint()
    setupSubscribeButtonOneConstraint()
    setupRecommendViewTwoConstraint()
    setupPhotoTwoConstraint()
    setupNickNameLabelTwoConstraint()
    setupRecommendedToYouLabelTwoConstraint()
    setupSubscribeButtonTwoConstraint()
    setupRecommendViewThreeConstraint()
    setupPhotoThreeConstraint()
    setupNickNameLabelThreeConstraint()
    setupRecommendedToYouLabelThreeConstraint()
    setupSubscribeButtonThreeConstraint()
    setupRecommendScrollViewConstraint()
    setupStackViewOne()
    setupStackViewOneConstraints()
  }
  
  private func addSubviews() {
    [recommendForToYouLabel, recommendScrollView].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func addSubviewsToPhotoScrollView() {
    [helpView].forEach {
      recommendScrollView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func addSubviewsToHelpView() {
    [stackViewOne].forEach {
      helpView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func addSubviewsToRecommendViewOne() {
    [photoOne, nickNameLabelOne, recommendedToYouLabel1, subscribeButtonOne].forEach {
      recommendViewOne.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func addSubviewsToRecommendViewTwo() {
    [photoTwo, nickNameLabelTwo, recommendedToYouLabelTwo, subscribeButtonTwo
    ].forEach {
      recommendViewTwo.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func addSubviewsToRecommendViewThree() {
    [photoThree, nickNameLabelThree, recommendedToYouLabelThree, subscribeButtonThree
    ].forEach {
      recommendViewThree.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  //MARK: - Constraints
  private func setupRecommendForYouLabelConstraint() {
    NSLayoutConstraint.activate([
      recommendForToYouLabel.widthAnchor.constraint(equalToConstant: 200),
      recommendForToYouLabel.heightAnchor.constraint(equalToConstant: 25),
      recommendForToYouLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      recommendForToYouLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10)
    ])
  }
  
  private func setupRecommendView1Constraint() {
    NSLayoutConstraint.activate([
      recommendViewOne.heightAnchor.constraint(equalToConstant: 320),
      recommendViewOne.widthAnchor.constraint(equalToConstant: 240),
    ])
  }
  
  private func setupPhoto1Constraint() {
    NSLayoutConstraint.activate([
      photoOne.topAnchor.constraint(equalTo: recommendViewOne.topAnchor, constant: 20),
      photoOne.centerXAnchor.constraint(equalTo: recommendViewOne.centerXAnchor),
      photoOne.widthAnchor.constraint(equalToConstant: 190),
      photoOne.heightAnchor.constraint(equalToConstant: 190)
    ])
  }
  
  private func setupNickNameLabelOneConstraint() {
    NSLayoutConstraint.activate([
      nickNameLabelOne.topAnchor.constraint(equalTo: photoOne.bottomAnchor, constant: 10),
      nickNameLabelOne.centerXAnchor.constraint(equalTo: recommendViewOne.centerXAnchor),
      nickNameLabelOne.widthAnchor.constraint(equalToConstant: 100),
      nickNameLabelOne.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupRecommendedToYouLabel1Constraint() {
    NSLayoutConstraint.activate([
      recommendedToYouLabel1.topAnchor.constraint(equalTo: nickNameLabelOne.bottomAnchor, constant: 0),
      recommendedToYouLabel1.centerXAnchor.constraint(equalTo: nickNameLabelOne.centerXAnchor),
      recommendedToYouLabel1.widthAnchor.constraint(equalToConstant: 180),
      recommendedToYouLabel1.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupSubscribeButtonOneConstraint() {
    NSLayoutConstraint.activate([
      subscribeButtonOne.topAnchor.constraint(equalTo: recommendedToYouLabel1.bottomAnchor, constant: 15),
      subscribeButtonOne.centerXAnchor.constraint(equalTo: nickNameLabelOne.centerXAnchor),
      subscribeButtonOne.widthAnchor.constraint(equalToConstant: 210),
      subscribeButtonOne.heightAnchor.constraint(equalToConstant: 30)
    ])
  }
  
  private func setupRecommendViewTwoConstraint() {
    NSLayoutConstraint.activate([
      recommendViewTwo.heightAnchor.constraint(equalToConstant: 320),
      recommendViewTwo.widthAnchor.constraint(equalToConstant: 240)
    ])
  }
  
  private func setupPhotoTwoConstraint() {
    NSLayoutConstraint.activate([
      photoTwo.topAnchor.constraint(equalTo: recommendViewTwo.topAnchor, constant: 20),
      photoTwo.centerXAnchor.constraint(equalTo: recommendViewTwo.centerXAnchor),
      photoTwo.widthAnchor.constraint(equalToConstant: 190),
      photoTwo.heightAnchor.constraint(equalToConstant: 190)
    ])
  }
  
  private func setupNickNameLabelTwoConstraint() {
    NSLayoutConstraint.activate([
      nickNameLabelTwo.topAnchor.constraint(equalTo: photoTwo.bottomAnchor, constant: 10),
      nickNameLabelTwo.centerXAnchor.constraint(equalTo: recommendViewTwo.centerXAnchor),
      nickNameLabelTwo.widthAnchor.constraint(equalToConstant: 100),
      nickNameLabelTwo.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupRecommendedToYouLabelTwoConstraint() {
    NSLayoutConstraint.activate([
      recommendedToYouLabelTwo.topAnchor.constraint(equalTo: nickNameLabelTwo.bottomAnchor, constant: 0),
      recommendedToYouLabelTwo.centerXAnchor.constraint(equalTo: nickNameLabelTwo.centerXAnchor),
      recommendedToYouLabelTwo.widthAnchor.constraint(equalToConstant: 180),
      recommendedToYouLabelTwo.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupSubscribeButtonTwoConstraint() {
    NSLayoutConstraint.activate([
      subscribeButtonTwo.topAnchor.constraint(equalTo: recommendedToYouLabelTwo.bottomAnchor, constant: 15),
      subscribeButtonTwo.centerXAnchor.constraint(equalTo: nickNameLabelTwo.centerXAnchor),
      subscribeButtonTwo.widthAnchor.constraint(equalToConstant: 210),
      subscribeButtonTwo.heightAnchor.constraint(equalToConstant: 30)
    ])
  }
  
  private func setupRecommendViewThreeConstraint() {
    NSLayoutConstraint.activate([
      recommendViewThree.heightAnchor.constraint(equalToConstant: 320),
      recommendViewThree.widthAnchor.constraint(equalToConstant: 240),
    ])
  }
  
  private func setupPhotoThreeConstraint() {
    NSLayoutConstraint.activate([
      photoThree.topAnchor.constraint(equalTo: recommendViewThree.topAnchor, constant: 20),
      photoThree.centerXAnchor.constraint(equalTo: recommendViewThree.centerXAnchor),
      photoThree.widthAnchor.constraint(equalToConstant: 190),
      photoThree.heightAnchor.constraint(equalToConstant: 190)
    ])
  }
  
  private func setupNickNameLabelThreeConstraint() {
    NSLayoutConstraint.activate([
      nickNameLabelThree.topAnchor.constraint(equalTo: photoThree.bottomAnchor, constant: 10),
      nickNameLabelThree.centerXAnchor.constraint(equalTo: recommendViewThree.centerXAnchor),
      nickNameLabelThree.widthAnchor.constraint(equalToConstant: 100),
      nickNameLabelThree.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupRecommendedToYouLabelThreeConstraint() {
    NSLayoutConstraint.activate([
      recommendedToYouLabelThree.topAnchor.constraint(equalTo: nickNameLabelThree.bottomAnchor, constant: 0),
      recommendedToYouLabelThree.centerXAnchor.constraint(equalTo: nickNameLabelThree.centerXAnchor),
      recommendedToYouLabelThree.widthAnchor.constraint(equalToConstant: 180),
      recommendedToYouLabelThree.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupSubscribeButtonThreeConstraint() {
    NSLayoutConstraint.activate([
      subscribeButtonThree.topAnchor.constraint(equalTo: recommendedToYouLabelThree.bottomAnchor, constant: 15),
      subscribeButtonThree.centerXAnchor.constraint(equalTo: nickNameLabelThree.centerXAnchor),
      subscribeButtonThree.widthAnchor.constraint(equalToConstant: 210),
      subscribeButtonThree.heightAnchor.constraint(equalToConstant: 30)
    ])
  }
  
  private func setupRecommendScrollViewConstraint() {
    NSLayoutConstraint.activate([
      recommendScrollView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
      recommendScrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
      recommendScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
      recommendScrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
    ])
  }
  
  //MARK: - StackView
  private func setupStackViewOne() {
    [recommendViewOne, recommendViewTwo, recommendViewThree].forEach {
      stackViewOne.addArrangedSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    stackViewOne.axis = .horizontal
    stackViewOne.spacing = 30
    stackViewOne.alignment = .center
  }
  
  private func setupStackViewOneConstraints() {
    NSLayoutConstraint.activate([
      stackViewOne.leadingAnchor.constraint(equalTo: helpView.leadingAnchor, constant: 10),
      stackViewOne.trailingAnchor.constraint(equalTo: helpView.trailingAnchor, constant: 0)
    ])
  }
}
