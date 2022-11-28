import UIKit

final class SearchViewController: UIViewController {
  //MARK: - Private Properties
  private let tableView = UITableView()
  private let refresh = UIRefreshControl()
  private var storiesModels = [StoriesArchiveModel]()
  private var galleryFrameModels = [GalleryModel]()

  // MARK: - UITableViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  //MARK: - Visual Components
  private func setupNavigationController() {
    let appearance = UINavigationBarAppearance()
    appearance.backgroundColor = .black
    appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)]
    navigationItem.standardAppearance = appearance
    navigationItem.scrollEdgeAppearance = appearance
    navigationItem.title = "elonmuskrus"
    navigationController?.navigationBar.tintColor = .white
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: nil)
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: nil)
  }
  
  private func setupRefreshControl() {
    refresh.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
    refresh.tintColor = .white
  }
  
  //MARK: - Private Methods
  private func setupView() {
    setupNavigationController()
    setupRefreshControl()
    addSubviews()
    setupSelfView()
    setupTableView()
    setupPostsTableViewConstraint()
  }
  
  private func addSubviews() {
    [tableView].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func setupSelfView() {
    view.backgroundColor = .black
  }
  
  private func setupTableView() {
    tableView.refreshControl = refresh
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(PageInfoCell.self, forCellReuseIdentifier: "PageInfoCell")
    tableView.register(DescriptionCell.self, forCellReuseIdentifier: "DescriptionCell")
    tableView.register(StoriesArchiveCell.self, forCellReuseIdentifier: "StoriesArchiveCell")
    tableView.register(GalleryCell.self, forCellReuseIdentifier: "GalleryCell")
    tableView.backgroundColor = .black
    tableView.layoutMargins = .zero
    tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  private func setupPostsTableViewConstraint() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
  }
  
  // MARK: - Actions
  @objc private func refreshAction(sender: UIRefreshControl) {
    sender.endRefreshing()
  }
}

extension SearchViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = UITableViewCell()
    switch indexPath.row {
    case 0:
      let pageInfoCell = tableView.dequeueReusableCell(withIdentifier: "PageInfoCell") as! PageInfoCell
      let model = PageInfoModel(avatarImage: "elon", postsCount: "152", subscribersCount: "18.6 тыс.", subscriptionsCount: "0")
      pageInfoCell.configureCell(model: model)
      cell = pageInfoCell
    case 1:
      let descriptionCell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell") as! DescriptionCell
      let model = DescriptionModel(name: "Илон Маск в России", profession: "Предприниматель", jobTitle: "CEO @spacex / @teslamotors / сооснователь @раураl", site: "www.spacex.com", whoSubscribe: "дима_барановский")
      descriptionCell.configureCell(model: model)
      cell = descriptionCell
    case 2:
      let storiesArchiveCell = tableView.dequeueReusableCell(withIdentifier: "StoriesArchiveCell", for: indexPath) as! StoriesArchiveCell
      storiesModels.append(StoriesArchiveModel(image: "starlink", description: "Starlink"))
      storiesModels.append(StoriesArchiveModel(image: "tesla", description: "Tesla"))
      storiesModels.append(StoriesArchiveModel(image: "starlink", description: "Starship"))
      storiesModels.append(StoriesArchiveModel(image: "tesla", description: "SpaceX"))
      storiesModels.append(StoriesArchiveModel(image: "starlink", description: "Crew Dragon"))
      storiesArchiveCell.configureCell(models: storiesModels)
      cell = storiesArchiveCell
    case 3:
      let galleryCell = tableView.dequeueReusableCell(withIdentifier: "GalleryCell", for: indexPath) as! GalleryCell
      galleryFrameModels.append(GalleryModel(image: "elonOne"))
      galleryFrameModels.append(GalleryModel(image: "elonTwo"))
      galleryFrameModels.append(GalleryModel(image: "elonThree"))
      galleryFrameModels.append(GalleryModel(image: "elonFour"))
      galleryFrameModels.append(GalleryModel(image: "elonFive"))
      galleryFrameModels.append(GalleryModel(image: "elonSix"))
      galleryFrameModels.append(GalleryModel(image: "elonSeven"))
      galleryFrameModels.append(GalleryModel(image: "elonEight"))
      galleryFrameModels.append(GalleryModel(image: "elonNine"))
      galleryFrameModels.append(GalleryModel(image: "elonTen"))
      galleryFrameModels.append(GalleryModel(image: "elonEleven"))
      galleryFrameModels.append(GalleryModel(image: "elonTwelve"))
      galleryCell.configureCell(models: galleryFrameModels)
      cell = galleryCell
     default:
      break
    }
    return cell
  }
}

extension SearchViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.row {
    case 0:
      return 130
    case 1:
      return 200
    case 2:
      return 120
    case 3:
      return 630
    default:
      return 80
    }
  }
}
