import UIKit
import WebKit

final class CardProductViewController: UIViewController {
  // MARK: - Private Properties
  private let webView = WKWebView()
  private let toolbar = UIToolbar()
  private let backwardButtonItem = UIBarButtonItem(systemItem: .rewind)
  private let forwardButtonItem = UIBarButtonItem(systemItem: .fastForward)
  private let shareButtonItem = UIBarButtonItem(systemItem: .action)
  private let spacer = UIBarButtonItem(systemItem: .flexibleSpace)
  private let refreshButtonItem = UIBarButtonItem(systemItem: .refresh)
  private let spinner = UIActivityIndicatorView()
  
  // MARK: - Public Properties
  var urlString = String()
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupWebView() {
    webView.frame = view.bounds
    webView.navigationDelegate = self
  }
  
  private func setupSpinner() {
    spinner.hidesWhenStopped = true
    spinner.center = view.center
  }
  
  private func setupToolbar() {
    toolbar.items = [backwardButtonItem, forwardButtonItem, spacer, shareButtonItem, spacer, refreshButtonItem]
    toolbar.frame = CGRect(x: 0, y: 750, width: 414, height: 70)
    backwardButtonItem.action = #selector(backAction)
    forwardButtonItem.action = #selector(forwardAction)
    shareButtonItem.action = #selector(shareAction)
    refreshButtonItem.action = #selector(refreshAction)
  }
 
  // MARK: - Private Methods
  private func setupView() {
    setupWebView()
    setupSpinner()
    loadRequest()
    setupToolbar()
    addSubviews()
    setupSelfView()
  }
  
  private func addSubviews() {
    [webView, toolbar, spinner].forEach {
      view.addSubview($0)
    }
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }

  private func loadRequest() {
    guard let url = URL(string: urlString) else { return }
    let urlRequest = URLRequest(url: url)
    webView.load(urlRequest)
  }
  
  // MARK: - Actions
  @objc private func backAction() {
    guard webView.canGoBack else { return }
    webView.goBack()
  }
  
  @objc private func forwardAction() {
    guard webView.canGoForward else { return }
    webView.goForward()
  }
  
  @objc private func shareAction() {
    guard let item = URL(string: urlString) else { return }
    let ac = UIActivityViewController(activityItems: [item], applicationActivities: nil)
    present(ac, animated: true)
  }
  
  @objc private func refreshAction() {
    webView.reload()
  }
}

// MARK: - WKNavigationDelegate
extension CardProductViewController: WKNavigationDelegate {
  
  public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    guard let url = navigationAction.request.url?.absoluteString else { return }
    if url.contains("samsung") {
      guard let newURL = URL(string: "https/www.apple.com") else { return }
      webView.load(URLRequest(url: newURL))
      decisionHandler(.cancel)
    } else {
      decisionHandler(.allow)
    }
  }
  
  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    backwardButtonItem.isEnabled = webView.canGoBack
    forwardButtonItem.isEnabled = webView.canGoForward
    isActivityIndicator(isAnimated: true, indicator: spinner)
  }
  
  public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    print("didFinish")
    isActivityIndicator(isAnimated: false, indicator: spinner)
  }
}
















 
