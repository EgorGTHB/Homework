import UIKit

final class SubscriptionRequestsCell: UITableViewCell {
  //MARK: - Private Properties
  private var requestsLabel = UILabel()
  
  //MARK: - UITableViewCell
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
  
  private func setupRequestsLabel() {
    requestsLabel.text = "Запросы на подписку"
    requestsLabel.textColor = .white
    requestsLabel.font = UIFont.systemFont(ofSize: 22, weight: .regular)
  }
  
  //MARK: - Private Methods
  private func setupCell() {
    setupAppearance()
    setupRequestsLabel()
    addSubviews()
    setupRequestsLabelConstraint()
  }
  
  private func addSubviews() {
    [requestsLabel].forEach {
      contentView.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }
  
  //MARK: - Constraints
  private func setupRequestsLabelConstraint() {
    NSLayoutConstraint.activate([
      requestsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      requestsLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
      requestsLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
}

