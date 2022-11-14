import UIKit


class PhotoTapeCell: UITableViewCell {
  // MARK: - Private Properties
  private let photoScrollView = UIScrollView()
  private let helpView = UIView()
  private let stackView1 = UIStackView()
  private let photoImageView1 = UIImageView()
  private let photoImageView2 = UIImageView()
  private let photoImageView3 = UIImageView()
  private let photoImageView4 = UIImageView()
  private let photoImageView5 = UIImageView()
  private let photoImageView6 = UIImageView()
  private let photoImageView7 = UIImageView()
  
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
    backgroundColor = .black
    selectionStyle = .none
  }
  
  private func setupPhotoImageView1() {
    photoImageView1.image = UIImage(named: "photoOfPost")
    photoImageView1.layer.cornerRadius = 30
    photoImageView1.clipsToBounds = true
  }
  
  private func setupPhotoImageView2() {
    photoImageView2.image = UIImage(named: "photoOfPost")
    photoImageView2.layer.cornerRadius = 30
    photoImageView2.clipsToBounds = true
  }
  
  private func setupPhotoImageView3() {
    photoImageView3.image = UIImage(named: "photoOfPost")
    photoImageView3.layer.cornerRadius = 30
    photoImageView3.clipsToBounds = true
  }
  
  private func setupPhotoImageView4() {
    photoImageView4.image = UIImage(named: "photoOfPost")
    photoImageView4.layer.cornerRadius = 30
    photoImageView4.clipsToBounds = true
  }
  
  private func setupPhotoImageView5() {
    photoImageView5.image = UIImage(named: "photoOfPost")
    photoImageView5.layer.cornerRadius = 30
    photoImageView5.clipsToBounds = true
  }
  
  private func setupPhotoImageView6() {
    photoImageView6.image = UIImage(named: "photoOfPost")
    photoImageView6.layer.cornerRadius = 30
    photoImageView6.clipsToBounds = true
  }
  
  private func setupPhotoImageView7() {
    photoImageView7.image = UIImage(named: "photoOfPost")
    photoImageView7.layer.cornerRadius = 30
    photoImageView7.clipsToBounds = true
  }
  
  private func setupHelpView() {
    helpView.frame.size = CGSize(width: 1000, height: 100)
  }
  
  private func setupPhotoScrollView() {
    photoScrollView.contentSize = CGSize(width: 560, height: 100)
    photoScrollView.indicatorStyle = .default
  }
  
  //MARK: - Private Methods
  private func setupCell() {
    setupAppearance()
    setupPhotoImageView1()
    setupPhotoImageView2()
    setupPhotoImageView3()
    setupPhotoImageView4()
    setupPhotoImageView5()
    setupPhotoImageView6()
    setupPhotoImageView7()
    setupHelpView()
    setupPhotoScrollView()
    
    addSubviews()
    addSubviewsToPhotoScrollView()
    addSubviewsToHelpView()
    
    setupMyScrollViewConstraint()
    setupPhotoImageView1Constraint()
    setupPhotoImageView2Constraint()
    setupPhotoImageView3Constraint()
    setupPhotoImageView4Constraint()
    setupPhotoImageView5Constraint()
    setupPhotoImageView6Constraint()
    setupPhotoImageView7Constraint()
    setupStackView1()
    setupStackView1Constraints()
  }
  
  
  private func addSubviews() {
    [photoScrollView].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func addSubviewsToPhotoScrollView() {
    [helpView].forEach {
      photoScrollView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func addSubviewsToHelpView() {
    [stackView1].forEach {
      helpView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  //MARK: - Constraints
  private func setupMyScrollViewConstraint() {
    NSLayoutConstraint.activate([
      photoScrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
      photoScrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
      photoScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
      photoScrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
    ])
  }
  
  private func setupPhotoImageView1Constraint() {
    NSLayoutConstraint.activate([
      photoImageView1.widthAnchor.constraint(equalToConstant: 60),
      photoImageView1.heightAnchor.constraint(equalToConstant: 60),
    ])
  }
  
  private func setupPhotoImageView2Constraint() {
    NSLayoutConstraint.activate([
      photoImageView2.widthAnchor.constraint(equalToConstant: 60),
      photoImageView2.heightAnchor.constraint(equalToConstant: 60),
    ])
  }
  
  private func setupPhotoImageView3Constraint() {
    NSLayoutConstraint.activate([
      photoImageView3.widthAnchor.constraint(equalToConstant: 60),
      photoImageView3.heightAnchor.constraint(equalToConstant: 60),
    ])
  }
  
  private func setupPhotoImageView4Constraint() {
    NSLayoutConstraint.activate([
      photoImageView4.widthAnchor.constraint(equalToConstant: 60),
      photoImageView4.heightAnchor.constraint(equalToConstant: 60),
    ])
  }
  
  private func setupPhotoImageView5Constraint() {
    NSLayoutConstraint.activate([
      photoImageView5.widthAnchor.constraint(equalToConstant: 60),
      photoImageView5.heightAnchor.constraint(equalToConstant: 60),
    ])
  }
  
  private func setupPhotoImageView6Constraint() {
    NSLayoutConstraint.activate([
      photoImageView6.widthAnchor.constraint(equalToConstant: 60),
      photoImageView6.heightAnchor.constraint(equalToConstant: 60),
    ])
  }
  
  private func setupPhotoImageView7Constraint() {
    NSLayoutConstraint.activate([
      photoImageView7.widthAnchor.constraint(equalToConstant: 60),
      photoImageView7.heightAnchor.constraint(equalToConstant: 60),
    ])
  }
  
  //MARK: - StackView
  private func setupStackView1() {
    [photoImageView1, photoImageView2, photoImageView3, photoImageView4, photoImageView5, photoImageView6, photoImageView7].forEach {
      stackView1.addArrangedSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    stackView1.axis = .horizontal
    stackView1.spacing = 20
    stackView1.alignment = .center
  }
  
  private func setupStackView1Constraints() {
    NSLayoutConstraint.activate([
      stackView1.leadingAnchor.constraint(equalTo: helpView.leadingAnchor, constant: 10),
      stackView1.trailingAnchor.constraint(equalTo: helpView.trailingAnchor, constant: 0),
      stackView1.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
}
