import UIKit

class LikeViewController: UITableViewController {
  //MARK: - Private Properties
  private let refreshController = UIRefreshControl()
 
  // MARK: - UITableViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  //MARK: - Visual Components
  private func setupNavigationController() {
    let appearance = UINavigationBarAppearance()
    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
    appearance.backgroundColor = .black
    navigationItem.standardAppearance = appearance
    navigationItem.scrollEdgeAppearance = appearance
    navigationItem.title = "Действия"
  }
  
  private func setupRefreshControl() {
    refreshController.addTarget(self, action: #selector(refresh), for: .valueChanged)
    refreshController.tintColor = .white
  }
  
  //MARK: - Private Methods
  private func setupView() {
    setupNavigationController()
    setupRefreshControl()
    addSubviews()
    setupSelfView()
    setupTableView()
  }
  
  private func addSubviews() {
    [refreshController].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  private func setupSelfView() {
    view.backgroundColor = .black
  }
  
  private func setupTableView() {
    tableView.register(SubscriptionRequestsCell.self, forCellReuseIdentifier: "SubscriptionRequestsCell")
    tableView.register(LikeYourContentCell.self, forCellReuseIdentifier: "LikeYourContentCell")
    tableView.register(ContentWithButtonCell.self, forCellReuseIdentifier: "ContentWithButtonCell")
    tableView.backgroundColor = .black
    tableView.layoutMargins = .zero
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 1
    } else if section == 1 {
      return 2
    } else {
      return 6
    }
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = UITableViewCell()
    switch indexPath.section {
    case 0:
      guard let subscriptionRequestsCell = tableView.dequeueReusableCell(withIdentifier: "SubscriptionRequestsCell", for: indexPath) as? SubscriptionRequestsCell else { return UITableViewCell() }
      cell = subscriptionRequestsCell
    case 1:
      switch indexPath.row {
      case 0:
        guard let likeYourContentCell = tableView.dequeueReusableCell(withIdentifier: "LikeYourContentCell", for: indexPath) as? LikeYourContentCell else { return UITableViewCell() }
        let model = LikeYourContentModel(imageSomeone: "vtumxi", atrOne: "vtumxi ", atrTwo: "упомянул(-а) вас в комментарии: ", atrThree: "@evgeny_zveric ", atrFour: "спасибо) ", atrFive: "12 ч.", imageOwn: "two")
        likeYourContentCell.configureCell(model: model)
        cell = likeYourContentCell
      case 1:
       guard let likeYourContentCell = tableView.dequeueReusableCell(withIdentifier: "LikeYourContentCell", for: indexPath) as? LikeYourContentCell else { return UITableViewCell() }
        let model = LikeYourContentModel(imageSomeone: "vtumxi", atrOne: "vtumxi ", atrTwo: "понравился ваш комментарий: ух ты фотошопер какой", atrThree: " ", atrFour: "", atrFive: "12 ч.", imageOwn: "two")
        likeYourContentCell.configureCell(model: model)
        cell = likeYourContentCell
      default: break
      }
    case 2:
      switch indexPath.row {
      case 0:
        guard let likeYourContentCell = tableView.dequeueReusableCell(withIdentifier: "LikeYourContentCell", for: indexPath) as? LikeYourContentCell else { return UITableViewCell() }
        let model = LikeYourContentModel(imageSomeone: "three", atrOne: "tima5955 ", atrTwo: "понравился ваш комментарий: красивые кадры", atrThree: " ", atrFour: "", atrFive: "2 д.", imageOwn: "four")
        likeYourContentCell.configureCell(model: model)
        cell = likeYourContentCell
      case 1:
       guard let contentWithButtonCell = tableView.dequeueReusableCell(withIdentifier: "ContentWithButtonCell", for: indexPath) as? ContentWithButtonCell else { return UITableViewCell() }
        let model = ContentWithButtonModel(imageSomeone: "eight", atrOne: "zenkova2021 ", atrTwo: "Есть в Instagram. Вы можете знать этого человека.", atrThree: " ", atrFour: "", atrFive: "3 д.", optionButton: true)
        contentWithButtonCell.configureCell(model: model)
        cell = contentWithButtonCell
      case 2:
        guard let likeYourContentCell = tableView.dequeueReusableCell(withIdentifier: "LikeYourContentCell", for: indexPath) as? LikeYourContentCell else { return UITableViewCell() }
        let model = LikeYourContentModel(imageSomeone: "five", atrOne: "baskatov_ ", atrTwo: "нравится ваше видео.", atrThree: " ", atrFour: "", atrFive: "3 д.", imageOwn: "six")
        likeYourContentCell.configureCell(model: model)
        cell = likeYourContentCell
      case 3:
        guard let contentWithButtonCell = tableView.dequeueReusableCell(withIdentifier: "ContentWithButtonCell", for: indexPath) as? ContentWithButtonCell else { return UITableViewCell() }
        let model = ContentWithButtonModel(imageSomeone: "seven", atrOne: "axper ", atrTwo: "подписался(-ась) на ваши обновления.", atrThree: " ", atrFour: "", atrFive: "3 д.", optionButton: false)
        contentWithButtonCell.configureCell(model: model)
        cell = contentWithButtonCell
      case 4:
        guard let contentWithButtonCell = tableView.dequeueReusableCell(withIdentifier: "ContentWithButtonCell", for: indexPath) as? ContentWithButtonCell else { return UITableViewCell() }
        let model = ContentWithButtonModel(imageSomeone: "five", atrOne: "baskatov_ ", atrTwo: "подписался(-ась) на ваши обновления.", atrThree: " ", atrFour: "", atrFive: "3 д.", optionButton: false)
        contentWithButtonCell.configureCell(model: model)
        cell = contentWithButtonCell
      case 5:
        guard let contentWithButtonCell = tableView.dequeueReusableCell(withIdentifier: "ContentWithButtonCell", for: indexPath) as? ContentWithButtonCell else { return UITableViewCell() }
        let model = ContentWithButtonModel(imageSomeone: "nine", atrOne: "goncharov ", atrTwo: "подписался(-ась) на ваши обновления.", atrThree: " ", atrFour: "", atrFive: "5 д.", optionButton: true)
        contentWithButtonCell.configureCell(model: model)
        cell = contentWithButtonCell
      default: break
      }
    default:
      return cell
    }
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 {
      return 50
    } else {
      return 70
    }
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    if section == 1 {
      return "Сегодня"
    } else if section == 2 {
      return "На этой неделе"
    } else {
      return ""
    }
  }
  
  override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    let header = view as! UITableViewHeaderFooterView
    header.textLabel?.textColor = .white
    header.textLabel?.font = UIFont.boldSystemFont(ofSize: 22)
    header.textLabel?.frame = header.bounds
  }
  
  // MARK: - Actions
  @objc private func refresh(sender: UIRefreshControl) {
    sender.endRefreshing()
  }
}
