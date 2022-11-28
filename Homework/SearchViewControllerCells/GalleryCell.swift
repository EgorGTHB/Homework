import UIKit

final class GalleryCell: UITableViewCell {
  // MARK: - Private Properties
  private let gridButton = UIButton(type: .system)
  private let tvButton = UIButton(type: .system)
  private let personButton = UIButton(type: .system)
  private let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
  private lazy var collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
  
  private var galleryFrames = [GalleryModel]()
  
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
  
  private func setupGridButton() {
    gridButton.setImage(UIImage(systemName: "squareshape.split.3x3", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), for: .normal)
    gridButton.tintColor = .white
  }
  
  private func setupTvButton() {
    tvButton.setImage(UIImage(systemName: "play.tv", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), for: .normal)
    tvButton.tintColor = .white
  }
  
  private func setupPersonButton() {
    personButton.setImage(UIImage(systemName: "person.crop.rectangle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), for: .normal)
    personButton.tintColor = .white
  }
  
  private func setupCollectionView() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.reloadData()
    collectionView.collectionViewLayout = layout
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isPagingEnabled = true
    collectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: "GalleryCollectionViewCell")
    collectionView.backgroundColor = .black
  }
  
  //MARK: - Private Methods
  private func setupCell() {
    setupGridButton()
    setupTvButton()
    setupPersonButton()
    setupCollectionView()
    setupAppearance()
    addSubviews()
    setupGridButtonConstraint()
    setupTvButtonConstraint()
    setupPersonButtonConstraint()
    setupCollectionViewConstraint()
  }
  
  private func addSubviews() {
    [gridButton, tvButton, personButton, collectionView].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  //MARK: - Public Methods
  func configureCell(models: [GalleryModel]) {
    galleryFrames = models
    collectionView.reloadData()
  }
  
  //MARK: - Constraint
  private func setupGridButtonConstraint() {
    NSLayoutConstraint.activate([
      gridButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
      gridButton.heightAnchor.constraint(equalToConstant: 35),
      gridButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
      gridButton.topAnchor.constraint(equalTo: topAnchor, constant: 20)
    ])
  }
  
  private func setupTvButtonConstraint() {
    NSLayoutConstraint.activate([
      tvButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
      tvButton.heightAnchor.constraint(equalToConstant: 35),
      tvButton.leadingAnchor.constraint(equalTo: gridButton.trailingAnchor, constant: 0),
      tvButton.topAnchor.constraint(equalTo: topAnchor, constant: 20)
    ])
  }
  
  private func setupPersonButtonConstraint() {
    NSLayoutConstraint.activate([
      personButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3),
      personButton.heightAnchor.constraint(equalToConstant: 35),
      personButton.leadingAnchor.constraint(equalTo: tvButton.trailingAnchor, constant: 0),
      personButton.topAnchor.constraint(equalTo: topAnchor, constant: 20)
    ])
  }
  
  private func setupCollectionViewConstraint() {
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: gridButton.bottomAnchor, constant: 10),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
    ])
  }
}

extension GalleryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return galleryFrames.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCollectionViewCell", for: indexPath) as? GalleryCollectionViewCell else { return UICollectionViewCell() }
    cell.configureCell(model: galleryFrames[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: UIScreen.main.bounds.width / 3 - 1, height: UIScreen.main.bounds.width / 3 - 1)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt  section: Int) -> UIEdgeInsets {
    return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
}

