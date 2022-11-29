import UIKit

final class HomeViewController: UIViewController {
  // MARK: - Private Properties
  private let postsTableView = UITableView()
  private let refreshControl = UIRefreshControl()
 
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupNavigationController() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = .black
    appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    navigationController?.navigationBar.standardAppearance = appearance
    navigationItem.title = "Instagram"
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "message"), style: .plain, target: self, action: nil)
   }
  
  private func setupRefreshControl() {
    refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    refreshControl.tintColor = .white
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupNavigationController()
    setupRefreshControl()
    addSubviews()
    setupSelfView()
    setupTableView()
    setupPostsTableViewConstraint()
  }

  private func addSubviews() {
      [postsTableView].forEach {
        view.addSubview($0)
        $0.translatesAutoresizingMaskIntoConstraints = false
      }
  }
 
  private func setupSelfView() {
    view.backgroundColor = .black
  }
  
  func setupTableView() {
    postsTableView.refreshControl = refreshControl
    postsTableView.delegate = self
    postsTableView.dataSource = self
    postsTableView.register(PostCell.self, forCellReuseIdentifier: "PostCell")
    postsTableView.register(PhotoTapeCell.self, forCellReuseIdentifier: "PhotoTapeCell")
    postsTableView.register(RecommendCell.self, forCellReuseIdentifier: "RecommendCell")
    postsTableView.backgroundColor = .black
    postsTableView.layoutMargins = .zero
    postsTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func setupPostsTableViewConstraint() {
    NSLayoutConstraint.activate([
      postsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      postsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      postsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      postsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
  }

  // MARK: - Actions
  @objc private func refresh(sender: UIRefreshControl) {
    sender.endRefreshing()
  }
}
 
// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell
    if indexPath.row == 0 {
      guard let photoTapeCell = tableView.dequeueReusableCell(withIdentifier: "PhotoTapeCell") as? PhotoTapeCell else { return UITableViewCell() }
      photoTapeCell.contentView.isUserInteractionEnabled = true
      cell = photoTapeCell
    } else if indexPath.row == 2 {
      guard let recommendCell = tableView.dequeueReusableCell(withIdentifier: "RecommendCell") as? RecommendCell else { return UITableViewCell() }
      recommendCell.contentView.isUserInteractionEnabled = true
      cell = recommendCell
    }
    else {
      cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
      cell.contentView.isUserInteractionEnabled = true
    }
    return cell
  }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0 {
      return 100
    } else if indexPath.row == 2 {
      return 390
    } else {
      return 600
    }
  }
}
