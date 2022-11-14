import UIKit

class RecommendCell: UITableViewCell {
  // MARK: - Private Properties
  private let recommendScrollView = UIScrollView()
  private let helpView = UIView()
  private let recommendForToYouLabel = UILabel()
  private let recommendView1 = UIView()
  private let photo1 = UIImageView()
  private let nickNameLabel1 = UILabel()
  private let recommendedToYouLabel1 = UILabel()
  private let subscribeButton1 = UIButton()
  private let recommendView2 = UIView()
  private let photo2 = UIImageView()
  private let nickNameLabel2 = UILabel()
  private let recommendedToYouLabel2 = UILabel()
  private let subscribeButton2 = UIButton()
  private let recommendView3 = UIView()
  private let photo3 = UIImageView()
  private let nickNameLabel3 = UILabel()
  private let recommendedToYouLabel3 = UILabel()
  private let subscribeButton3 = UIButton()
  private let stackView1 = UIStackView()
  
  // MARK: - UITableViewCell
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupCell()
  }
  
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
  
  private func setupRecommendView1() {
    recommendView1.backgroundColor = .black
    recommendView1.layer.cornerRadius = 17
    recommendView1.layer.masksToBounds = true
  }
  
  private func setupPhoto1() {
    photo1.image = UIImage(named: "avatar")
    photo1.backgroundColor = .systemPink
    photo1.layer.cornerRadius = 100
    photo1.layer.masksToBounds = true
  }
  
  private func setupNickNameLabel1() {
    nickNameLabel1.text = "NickName1"
    nickNameLabel1.textColor = .white
    nickNameLabel1.font = .systemFont(ofSize: 17, weight: .bold)
    nickNameLabel1.textAlignment = .center
  }
  
  private func setupRecommendedToYouLabel1() {
    recommendedToYouLabel1.text = "Рекомендации для вас"
    recommendedToYouLabel1.textColor = .gray
    recommendedToYouLabel1.font = .systemFont(ofSize: 15, weight: .regular)
    recommendedToYouLabel1.textAlignment = .center
  }
  
  private func setupSubscribeButton1() {
    subscribeButton1.setTitle("Подписаться", for: .normal)
    subscribeButton1.backgroundColor = .systemBlue
    subscribeButton1.setTitleColor(.white, for: .normal)
    subscribeButton1.layer.cornerRadius = 5
  }
  
  private func setupRecommendView2() {
    recommendView2.backgroundColor = .black
    recommendView2.layer.cornerRadius = 17
    recommendView2.layer.masksToBounds = true
  }
  
  private func setupPhoto2() {
    photo2.image = UIImage(named: "avatar")
    photo2.backgroundColor = .systemPink
    photo2.layer.cornerRadius = 100
    photo2.layer.masksToBounds = true
  }
  
  private func setupNickNameLabel2() {
    nickNameLabel2.text = "NickName2"
    nickNameLabel2.textColor = .white
    nickNameLabel2.font = .systemFont(ofSize: 17, weight: .bold)
    nickNameLabel2.textAlignment = .center
  }
  
  private func setupRecommendedToYouLabel2() {
    recommendedToYouLabel2.text = "Рекомендации для вас"
    recommendedToYouLabel2.textColor = .gray
    recommendedToYouLabel2.font = .systemFont(ofSize: 15, weight: .regular)
    recommendedToYouLabel2.textAlignment = .center
  }
  
  private func setupSubscribeButton2() {
    subscribeButton2.setTitle("Подписаться", for: .normal)
    subscribeButton2.backgroundColor = .systemBlue
    subscribeButton2.setTitleColor(.white, for: .normal)
    subscribeButton2.layer.cornerRadius = 5
  }
  
  private func setupRecommendView3() {
    recommendView3.backgroundColor = .black
    recommendView3.layer.cornerRadius = 17
    recommendView3.layer.masksToBounds = true
  }
  
  private func setupPhoto3() {
    photo3.image = UIImage(named: "avatar")
    photo3.backgroundColor = .systemPink
    photo3.layer.cornerRadius = 100
    photo3.layer.masksToBounds = true
  }
  
  private func setupNickNameLabel3() {
    nickNameLabel3.text = "NickName3"
    nickNameLabel3.textColor = .white
    nickNameLabel3.font = .systemFont(ofSize: 17, weight: .bold)
    nickNameLabel3.textAlignment = .center
  }
  
  private func setupRecommendedToYouLabel3() {
    recommendedToYouLabel3.text = "Рекомендации для вас"
    recommendedToYouLabel3.textColor = .gray
    recommendedToYouLabel3.font = .systemFont(ofSize: 15, weight: .regular)
    recommendedToYouLabel3.textAlignment = .center
  }
  
  private func setupSubscribeButton3() {
    subscribeButton3.setTitle("Подписаться", for: .normal)
    subscribeButton3.backgroundColor = .systemBlue
    subscribeButton3.setTitleColor(.white, for: .normal)
    subscribeButton3.layer.cornerRadius = 5
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
    setupRecommendView1()
    setupPhoto1()
    setupNickNameLabel1()
    setupRecommendedToYouLabel1()
    setupSubscribeButton1()
    setupRecommendView2()
    setupPhoto2()
    setupNickNameLabel2()
    setupRecommendedToYouLabel2()
    setupSubscribeButton2()
    setupRecommendView3()
    setupPhoto3()
    setupNickNameLabel3()
    setupRecommendedToYouLabel3()
    setupSubscribeButton3()
    setupRecommendScrollView()
    setupHelpView()
    addSubviews()
    addSubviewsToPhotoScrollView()
    addSubviewsToHelpView()
    addSubviewsToRecommendView1()
    addSubviewsToRecommendView2()
    addSubviewsToRecommendView3()
    setupRecommendForYouLabelConstraint()
    setupRecommendView1Constraint()
    setupPhoto1Constraint()
    setupNickNameLabel1Constraint()
    setupRecommendedToYouLabel1Constraint()
    setupSubscribeButton1Constraint()
    setupRecommendView2Constraint()
    setupPhoto2Constraint()
    setupNickNameLabel2Constraint()
    setupRecommendedToYouLabel2Constraint()
    setupSubscribeButton2Constraint()
    setupRecommendView3Constraint()
    setupPhoto3Constraint()
    setupNickNameLabel3Constraint()
    setupRecommendedToYouLabel3Constraint()
    setupSubscribeButton3Constraint()
    setupRecommendScrollViewConstraint()
    setupStackView1()
    setupStackView1Constraints()
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
    [stackView1].forEach {
      helpView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func addSubviewsToRecommendView1() {
    [photo1, nickNameLabel1, recommendedToYouLabel1, subscribeButton1].forEach {
      recommendView1.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func addSubviewsToRecommendView2() {
    [photo2, nickNameLabel2, recommendedToYouLabel2, subscribeButton2
    ].forEach {
      recommendView2.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func addSubviewsToRecommendView3() {
    [photo3, nickNameLabel3, recommendedToYouLabel3, subscribeButton3
    ].forEach {
      recommendView3.addSubview($0)
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
      recommendView1.heightAnchor.constraint(equalToConstant: 320),
      recommendView1.widthAnchor.constraint(equalToConstant: 240),
    ])
  }
  
  private func setupPhoto1Constraint() {
    NSLayoutConstraint.activate([
      photo1.topAnchor.constraint(equalTo: recommendView1.topAnchor, constant: 20),
      photo1.centerXAnchor.constraint(equalTo: recommendView1.centerXAnchor),
      photo1.widthAnchor.constraint(equalToConstant: 190),
      photo1.heightAnchor.constraint(equalToConstant: 190)
    ])
  }
  
  private func setupNickNameLabel1Constraint() {
    NSLayoutConstraint.activate([
      nickNameLabel1.topAnchor.constraint(equalTo: photo1.bottomAnchor, constant: 10),
      nickNameLabel1.centerXAnchor.constraint(equalTo: recommendView1.centerXAnchor),
      nickNameLabel1.widthAnchor.constraint(equalToConstant: 100),
      nickNameLabel1.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupRecommendedToYouLabel1Constraint() {
    NSLayoutConstraint.activate([
      recommendedToYouLabel1.topAnchor.constraint(equalTo: nickNameLabel1.bottomAnchor, constant: 0),
      recommendedToYouLabel1.centerXAnchor.constraint(equalTo: nickNameLabel1.centerXAnchor),
      recommendedToYouLabel1.widthAnchor.constraint(equalToConstant: 180),
      recommendedToYouLabel1.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupSubscribeButton1Constraint() {
    NSLayoutConstraint.activate([
      subscribeButton1.topAnchor.constraint(equalTo: recommendedToYouLabel1.bottomAnchor, constant: 15),
      subscribeButton1.centerXAnchor.constraint(equalTo: nickNameLabel1.centerXAnchor),
      subscribeButton1.widthAnchor.constraint(equalToConstant: 210),
      subscribeButton1.heightAnchor.constraint(equalToConstant: 30)
    ])
  }
  
  private func setupRecommendView2Constraint() {
    NSLayoutConstraint.activate([
      recommendView2.heightAnchor.constraint(equalToConstant: 320),
      recommendView2.widthAnchor.constraint(equalToConstant: 240)
    ])
  }
  
  private func setupPhoto2Constraint() {
    NSLayoutConstraint.activate([
      photo2.topAnchor.constraint(equalTo: recommendView2.topAnchor, constant: 20),
      photo2.centerXAnchor.constraint(equalTo: recommendView2.centerXAnchor),
      photo2.widthAnchor.constraint(equalToConstant: 190),
      photo2.heightAnchor.constraint(equalToConstant: 190)
    ])
  }
  
  private func setupNickNameLabel2Constraint() {
    NSLayoutConstraint.activate([
      nickNameLabel2.topAnchor.constraint(equalTo: photo2.bottomAnchor, constant: 10),
      nickNameLabel2.centerXAnchor.constraint(equalTo: recommendView2.centerXAnchor),
      nickNameLabel2.widthAnchor.constraint(equalToConstant: 100),
      nickNameLabel2.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupRecommendedToYouLabel2Constraint() {
    NSLayoutConstraint.activate([
      recommendedToYouLabel2.topAnchor.constraint(equalTo: nickNameLabel2.bottomAnchor, constant: 0),
      recommendedToYouLabel2.centerXAnchor.constraint(equalTo: nickNameLabel2.centerXAnchor),
      recommendedToYouLabel2.widthAnchor.constraint(equalToConstant: 180),
      recommendedToYouLabel2.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupSubscribeButton2Constraint() {
    NSLayoutConstraint.activate([
      subscribeButton2.topAnchor.constraint(equalTo: recommendedToYouLabel2.bottomAnchor, constant: 15),
      subscribeButton2.centerXAnchor.constraint(equalTo: nickNameLabel2.centerXAnchor),
      subscribeButton2.widthAnchor.constraint(equalToConstant: 210),
      subscribeButton2.heightAnchor.constraint(equalToConstant: 30)
    ])
  }
  
  private func setupRecommendView3Constraint() {
    NSLayoutConstraint.activate([
      recommendView3.heightAnchor.constraint(equalToConstant: 320),
      recommendView3.widthAnchor.constraint(equalToConstant: 240),
    ])
  }
  
  private func setupPhoto3Constraint() {
    NSLayoutConstraint.activate([
      photo3.topAnchor.constraint(equalTo: recommendView3.topAnchor, constant: 20),
      photo3.centerXAnchor.constraint(equalTo: recommendView3.centerXAnchor),
      photo3.widthAnchor.constraint(equalToConstant: 190),
      photo3.heightAnchor.constraint(equalToConstant: 190)
    ])
  }
  
  private func setupNickNameLabel3Constraint() {
    NSLayoutConstraint.activate([
      nickNameLabel3.topAnchor.constraint(equalTo: photo3.bottomAnchor, constant: 10),
      nickNameLabel3.centerXAnchor.constraint(equalTo: recommendView3.centerXAnchor),
      nickNameLabel3.widthAnchor.constraint(equalToConstant: 100),
      nickNameLabel3.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupRecommendedToYouLabel3Constraint() {
    NSLayoutConstraint.activate([
      recommendedToYouLabel3.topAnchor.constraint(equalTo: nickNameLabel3.bottomAnchor, constant: 0),
      recommendedToYouLabel3.centerXAnchor.constraint(equalTo: nickNameLabel3.centerXAnchor),
      recommendedToYouLabel3.widthAnchor.constraint(equalToConstant: 180),
      recommendedToYouLabel3.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func setupSubscribeButton3Constraint() {
    NSLayoutConstraint.activate([
      subscribeButton3.topAnchor.constraint(equalTo: recommendedToYouLabel3.bottomAnchor, constant: 15),
      subscribeButton3.centerXAnchor.constraint(equalTo: nickNameLabel3.centerXAnchor),
      subscribeButton3.widthAnchor.constraint(equalToConstant: 210),
      subscribeButton3.heightAnchor.constraint(equalToConstant: 30)
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
  private func setupStackView1() {
    [recommendView1, recommendView2, recommendView3].forEach {
      stackView1.addArrangedSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    stackView1.axis = .horizontal
    stackView1.spacing = 30
    stackView1.alignment = .center
  }
  
  private func setupStackView1Constraints() {
    NSLayoutConstraint.activate([
      stackView1.leadingAnchor.constraint(equalTo: helpView.leadingAnchor, constant: 10),
      stackView1.trailingAnchor.constraint(equalTo: helpView.trailingAnchor, constant: 0)
    ])
  }
}
