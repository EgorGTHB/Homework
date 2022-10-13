import UIKit
 
final class TimerViewController: UIViewController {
  // MARK: - Private Properties
  private let timerLabel = UILabel()
  private let startStopButton = UIButton(type: .system)
  private let resetButton = UIButton(type: .system)
  
  private var timer = Timer()
  private var counter = 0
  private var startStopIs = false

  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupTimerLabel() {
    timerLabel.frame = CGRect(x: 50, y: 150, width: 314, height: 50)
    timerLabel.text = "00:00:00"
    timerLabel.textAlignment = .center
    timerLabel.font = .systemFont(ofSize: 60)
  }
  
  private func setupStartStopButton() {
    startStopButton.backgroundColor = UIColor(red: 64/255, green: 159/255, blue: 88/255, alpha: 1)
    startStopButton.setTitle("Старт", for: .normal)
    startStopButton.titleLabel?.font = .systemFont(ofSize: 20)
    startStopButton.frame = CGRect(x: 20, y: 450, width: 85, height: 85)
    startStopButton.layer.cornerRadius = 43
    startStopButton.tintColor = UIColor(red: 11/255, green: 31/255, blue: 14/255, alpha: 1)
  }
  
  private func setupResetButton() {
    resetButton.backgroundColor = .blue
    resetButton.setTitle("Сброс", for: .normal)
    resetButton.titleLabel?.font = .systemFont(ofSize: 20)
    resetButton.frame = CGRect(x: 319, y: 450, width: 85, height: 85)
    resetButton.layer.cornerRadius = 43
    resetButton.tintColor = .black
    resetButton.setTitleColor(.black, for: .normal)
  }
  
  // MARK: - Private Methods
  private func setupView() {
    setupTimerLabel()
    setupStartStopButton()
    setupResetButton()
    addSubviews()
    addTarget()
    setupSelfView()
  }
  
  private func addSubviews() {
    [timerLabel, startStopButton, resetButton].forEach {
      view.addSubview($0)
    }
  }
  
  private func addTarget() {
    startStopButton.addTarget(self, action: #selector(createTimer), for: .touchUpInside)
    resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  // MARK: - Actions
  @objc private func reset() {
    startStopButton.setTitle("Старт", for: .normal)
    startStopButton.setTitleColor(.black, for: .normal)
    startStopButton.backgroundColor = UIColor(red: 64/255, green: 159/255, blue: 88/255, alpha: 1)
    timerLabel.text = "00:00:00"
    counter = 0
    startStopIs = false
    timer.invalidate()
  }
  
  @objc private func createTimer(sender: UIButton) {
    startStopIs.toggle()
    if startStopIs {
      timer = .scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
      sender.setTitle("Стоп", for: .normal)
      sender.backgroundColor = .red
    } else {
      timer.invalidate()
      sender.setTitle("Старт", for: .normal)
      sender.backgroundColor = UIColor(red: 64/255, green: 159/255, blue: 88/255, alpha: 1)
    }
  }

  @objc private func updateLabel() {
    counter += 1
    timerLabel.text = "\(convertToMinutes(seconds: counter))"
  }
}


