import UIKit


final class PhotoTapeCell: UITableViewCell {
  // MARK: - Private Properties
  private let photoScrollView = UIScrollView()
  private let helpView = UIView()
  private let stackView1 = UIStackView()
  private let photoImageViewOne = UIImageView()
  private let photoImageViewTwo = UIImageView()
  private let photoImageViewThree = UIImageView()
  private let photoImageViewFour = UIImageView()
  private let photoImageViewFive = UIImageView()
  private let photoImageViewSix = UIImageView()
  private let photoImageViewSeven = UIImageView()
  
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
    backgroundColor = .black
    selectionStyle = .none
  }
  
  private func setupPhotoImageViews() {
    [photoImageViewOne, photoImageViewTwo, photoImageViewThree, photoImageViewFour, photoImageViewFive, photoImageViewSix, photoImageViewSeven].forEach {
      $0.image = UIImage(named: "photoOfPost")
      $0.layer.cornerRadius = 30
      $0.clipsToBounds = true
    }
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
    setupPhotoImageViews()
    setupHelpView()
    setupPhotoScrollView()
    addSubviews()
    addSubviewsToPhotoScrollView()
    addSubviewsToHelpView()
    setupMyScrollViewConstraint()
    setupPhotoImageViewOneConstraint()
    setupPhotoImageViewTwoConstraint()
    setupPhotoImageViewThreeConstraint()
    setupPhotoImageViewFourConstraint()
    setupPhotoImageViewFiveConstraint()
    setupPhotoImageViewSixConstraint()
    setupPhotoImageViewSevenConstraint()
    setupStackViewOne()
    setupStackViewOneConstraints()
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
  
  private func setupPhotoImageViewOneConstraint() {
    NSLayoutConstraint.activate([
      photoImageViewOne.widthAnchor.constraint(equalToConstant: 60),
      photoImageViewOne.heightAnchor.constraint(equalToConstant: 60),
    ])
  }
  
  private func setupPhotoImageViewTwoConstraint() {
    NSLayoutConstraint.activate([
      photoImageViewTwo.widthAnchor.constraint(equalToConstant: 60),
      photoImageViewTwo.heightAnchor.constraint(equalToConstant: 60),
    ])
  }
  
  private func setupPhotoImageViewThreeConstraint() {
    NSLayoutConstraint.activate([
      photoImageViewThree.widthAnchor.constraint(equalToConstant: 60),
      photoImageViewThree.heightAnchor.constraint(equalToConstant: 60),
    ])
  }
  
  private func setupPhotoImageViewFourConstraint() {
    NSLayoutConstraint.activate([
      photoImageViewFour.widthAnchor.constraint(equalToConstant: 60),
      photoImageViewFour.heightAnchor.constraint(equalToConstant: 60),
    ])
  }
  
  private func setupPhotoImageViewFiveConstraint() {
    NSLayoutConstraint.activate([
      photoImageViewFive.widthAnchor.constraint(equalToConstant: 60),
      photoImageViewFive.heightAnchor.constraint(equalToConstant: 60),
    ])
  }
  
  private func setupPhotoImageViewSixConstraint() {
    NSLayoutConstraint.activate([
      photoImageViewSix.widthAnchor.constraint(equalToConstant: 60),
      photoImageViewSix.heightAnchor.constraint(equalToConstant: 60),
    ])
  }
  
  private func setupPhotoImageViewSevenConstraint() {
    NSLayoutConstraint.activate([
      photoImageViewSeven.widthAnchor.constraint(equalToConstant: 60),
      photoImageViewSeven.heightAnchor.constraint(equalToConstant: 60),
    ])
  }
  
  //MARK: - StackView
  private func setupStackViewOne() {
    [photoImageViewOne, photoImageViewTwo, photoImageViewThree, photoImageViewFour, photoImageViewFive, photoImageViewSix, photoImageViewSeven].forEach {
      stackView1.addArrangedSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    stackView1.axis = .horizontal
    stackView1.spacing = 20
    stackView1.alignment = .center
  }
  
  private func setupStackViewOneConstraints() {
    NSLayoutConstraint.activate([
      stackView1.leadingAnchor.constraint(equalTo: helpView.leadingAnchor, constant: 10),
      stackView1.trailingAnchor.constraint(equalTo: helpView.trailingAnchor, constant: 0),
      stackView1.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
}
