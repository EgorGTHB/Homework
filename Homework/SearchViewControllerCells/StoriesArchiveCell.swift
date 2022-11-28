import UIKit

final class StoriesArchiveCell: UITableViewCell {
  // MARK: - Private Properties
  private let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
  private lazy var collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
  
  private var storiesModels = [StoriesArchiveModel]()
  
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
  
  private func setupCollectionView() {
    layout.scrollDirection = .horizontal
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.reloadData()
    collectionView.collectionViewLayout = layout
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isPagingEnabled = true
    collectionView.register(StoriesArchiveCollectionViewCell.self, forCellWithReuseIdentifier: "StoriesArchiveCollectionViewCell")
    collectionView.backgroundColor = .black
  }
  
  //MARK: - Private Methods
  private func setupCell() {
    setupCollectionView()
    setupAppearance()
    addSubviews()
    setupCollectionViewConstraint()
  }
  
  private func addSubviews() {
    [collectionView].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  //MARK: - Public Methods
  func configureCell(models: [StoriesArchiveModel]) {
    storiesModels = models
    collectionView.reloadData()
  }
  
  //MARK: - Constraint
  private func setupCollectionViewConstraint() {
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
    ])
  }
}

extension StoriesArchiveCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return storiesModels.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoriesArchiveCollectionViewCell", for: indexPath) as? StoriesArchiveCollectionViewCell else { return UICollectionViewCell() }
    cell.configureCell(model: storiesModels[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 100, height: 120)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt  section: Int) -> UIEdgeInsets {
    return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}

