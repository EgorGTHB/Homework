import UIKit
import AVFoundation

final class SongViewController: UIViewController {
  // MARK: - Private Properties
  private let leftChevronButton = UIButton(type: .system)
  private let playingFromAlbumLabel = UILabel()
  private let topNameOfTheSongLabel = UILabel()
  private let rightShareButton = UIButton(type: .system)
  private let iconAlbumImageView = UIImageView()
  private let leftPlusButton = UIButton(type: .system)
  private let bottomNameOfTheSongLabel = UILabel()
  private let singerLabel = UILabel()
  private let rightEllipsisButton = UIButton(type: .system)
  private let leftSliderLabel = UILabel()
  private let rightSliderLabel = UILabel()
  private let pointOfTrackSlider = UISlider()
  private let leftShuffleButton = UIButton(type: .system)
  private let backwardButton = UIButton(type: .system)
  private let pausePlayButton = UIButton(type: .system)
  private let forwardButton = UIButton(type: .system)
  private let rightRepeatButton = UIButton(type: .system)
  private let volumeSlider = UISlider()
  
  private var player = AVAudioPlayer()
  private var timer = Timer()
  private var shouldPlay: Bool = false
  private var repeatIs = false
  
  // MARK: - Public Properties
  var topName = String()
  var iconAlbum = UIImage()
  var bottomName = String()
  var singer = String()
  var rightSlider = String()
  var track = String()
  
  // MARK: - UIViewController
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Visual Components
  private func setupLeftChevronButton() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
    let image = UIImage(systemName: "chevron.down", withConfiguration: configuration)
    
    leftChevronButton.frame = CGRect(x: 17, y: 60, width: 50, height: 50)
    leftChevronButton.setImage(image, for: .normal)
    leftChevronButton.tintColor = .gray
  }
  
  private func setupPlayingFromAlbumLabel() {
    playingFromAlbumLabel.frame = CGRect(x: 135, y: 62, width: 150, height: 25)
    playingFromAlbumLabel.textAlignment = .center
    playingFromAlbumLabel.text = "Playing from album"
    playingFromAlbumLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    playingFromAlbumLabel.textColor = .gray
  }
  
  private func setupTopNameOfTheSongLabel() {
    topNameOfTheSongLabel.frame = CGRect(x: 135, y: 83, width: 150, height: 25)
    topNameOfTheSongLabel.textAlignment = .center
    topNameOfTheSongLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    topNameOfTheSongLabel.textColor = .black
  }
  
  private func setupRightShareButton() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
    let image = UIImage(systemName: "square.and.arrow.up", withConfiguration: configuration)
    
    rightShareButton.frame = CGRect(x: 347, y: 60, width: 50, height: 50)
    rightShareButton.setImage(image, for: .normal)
    rightShareButton.tintColor = .gray
  }
  
  private func setupIconAlbumImageView() {
    iconAlbumImageView.frame = CGRect(x: 30, y: 130, width: 354, height: 354)
    iconAlbumImageView.layer.cornerRadius = iconAlbumImageView.frame.size.width / 35
    iconAlbumImageView.clipsToBounds = true
  }
  
  private func setupLeftPlusButton() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
    let image = UIImage(systemName: "plus", withConfiguration: configuration)
    
    leftPlusButton.frame = CGRect(x: 17, y: 495, width: 50, height: 50)
    leftPlusButton.setImage(image, for: .normal)
    leftPlusButton.tintColor = .gray
  }
  
  private func setupBottomNameOfTheSongLabel() {
    bottomNameOfTheSongLabel.frame = CGRect(x: 110, y: 510, width: 200, height: 25)
    bottomNameOfTheSongLabel.textAlignment = .center
    bottomNameOfTheSongLabel.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
    bottomNameOfTheSongLabel.textColor = .black
  }
  
  private func setupSingerLabel() {
    singerLabel.frame = CGRect(x: 110, y: 540, width: 200, height: 25)
    singerLabel.textAlignment = .center
    singerLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    singerLabel.textColor = .gray
  }
  
  private func setupRightEllipsisButton() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
    let image = UIImage(systemName: "ellipsis", withConfiguration: configuration)
    
    rightEllipsisButton.frame = CGRect(x: 347, y: 495, width: 50, height: 50)
    rightEllipsisButton.setImage(image, for: .normal)
    rightEllipsisButton.tintColor = .gray
  }
  
  private func setupLeftSliderLabel() {
    leftSliderLabel.frame = CGRect(x: 20, y: 565, width: 60, height: 25)
    leftSliderLabel.textAlignment = .center
    leftSliderLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    leftSliderLabel.textColor = .gray
    leftSliderLabel.text = "00:00"
  }
  
  private func setupPointOfTrackSlider() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 12, weight: .medium)
    let image = UIImage(systemName: "circle.fill", withConfiguration: configuration)
    
    pointOfTrackSlider.frame = CGRect(x: 30, y: 600, width: 360, height: 23)
    pointOfTrackSlider.maximumValue = Float(player.duration)
    pointOfTrackSlider.tintColor = .systemGreen
    pointOfTrackSlider.minimumTrackTintColor = .systemGreen
    pointOfTrackSlider.setThumbImage(image, for: .normal)
  }
  
  private func setupRigthSliderLabel() {
    rightSliderLabel.frame = CGRect(x: 340, y: 565, width: 60, height: 25)
    rightSliderLabel.textAlignment = .center
    rightSliderLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    rightSliderLabel.textColor = .gray
  }
  
  private func setupLeftShuffleButton() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
    let image = UIImage(systemName: "shuffle", withConfiguration: configuration)
    
    leftShuffleButton.frame = CGRect(x: 17, y: 650, width: 50, height: 50)
    leftShuffleButton.setImage(image, for: .normal)
    leftShuffleButton.tintColor = .gray
  }
  
  private func setupBackwardButton() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 28, weight: .light)
    let image = UIImage(systemName: "backward.end.fill", withConfiguration: configuration)
    
    backwardButton.frame = CGRect(x: 92, y: 650, width: 50, height: 50)
    backwardButton.setImage(image, for: .normal)
    backwardButton.tintColor = .black
  }
  
  private func setupPausePlayButton() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 40, weight: .regular)
    let image = UIImage(systemName: "pause.fill", withConfiguration: configuration)
    
    pausePlayButton.frame = CGRect(x: 182, y: 650, width: 50, height: 50)
    pausePlayButton.setImage(image, for: .normal)
    pausePlayButton.tintColor = .black
  }
  
  private func setupForwardButton() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 28, weight: .light)
    let image = UIImage(systemName: "forward.end.fill", withConfiguration: configuration)
    
    forwardButton.frame = CGRect(x: 272, y: 650, width: 50, height: 50)
    forwardButton.setImage(image, for: .normal)
    forwardButton.tintColor = .black
  }
  
  private func setupRightRepeatButton() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
    let image = UIImage(systemName: "repeat", withConfiguration: configuration)
    
    rightRepeatButton.frame = CGRect(x: 347, y: 650, width: 50, height: 50)
    rightRepeatButton.setImage(image, for: .normal)
    rightRepeatButton.tintColor = .gray
    rightRepeatButton.addTarget(self, action: #selector(rightRepeatButtonTapped), for: .touchUpInside)
  }
  
  private func setupVolumeSlider() {
    let configuration = UIImage.SymbolConfiguration(pointSize: 10, weight: .medium)
    let image = UIImage(systemName: "circle.fill", withConfiguration: configuration)
    
    volumeSlider.frame = CGRect(x: 136, y: 753, width: 150, height: 23)
    volumeSlider.setThumbImage(image, for: .normal)
    volumeSlider.value = 0.5
  }
  
  // MARK: - Private Methods
  private func setupView() {
    addSubviews()
    addTarget()
    setupSelfView()
    setupLeftChevronButton()
    setupPlayingFromAlbumLabel()
    setupTopNameOfTheSongLabel()
    setupRightShareButton()
    setupIconAlbumImageView()
    setupLeftPlusButton()
    setupBottomNameOfTheSongLabel()
    setupSingerLabel()
    setupPlayer()
    setupRightEllipsisButton()
    setupLeftSliderLabel()
    setupPointOfTrackSlider()
    setupRigthSliderLabel()
    setupLeftShuffleButton()
    setupBackwardButton()
    setupPausePlayButton()
    setupForwardButton()
    setupRightRepeatButton()
    setupVolumeSlider()
    initUIElementsFromPlayListVC()
    makeTimer()
  }
  
  private func addSubviews() {
    view.addSubview(leftChevronButton)
    view.addSubview(playingFromAlbumLabel)
    view.addSubview(topNameOfTheSongLabel)
    view.addSubview(rightShareButton)
    view.addSubview(iconAlbumImageView)
    view.addSubview(leftPlusButton)
    view.addSubview(bottomNameOfTheSongLabel)
    view.addSubview(singerLabel)
    view.addSubview(rightEllipsisButton)
    view.addSubview(leftSliderLabel)
    view.addSubview(rightSliderLabel)
    view.addSubview(pointOfTrackSlider)
    view.addSubview(leftShuffleButton)
    view.addSubview(backwardButton)
    view.addSubview(pausePlayButton)
    view.addSubview(forwardButton)
    view.addSubview(rightRepeatButton)
    view.addSubview(volumeSlider)
  }
  
  private func addTarget() {
    leftChevronButton.addTarget(self, action: #selector(leftChevronButtonTapped), for: .touchUpInside)
    rightShareButton.addTarget(self, action: #selector(share), for: .touchUpInside)
    pointOfTrackSlider.addTarget(self, action: #selector(changePointOfTrackSlider), for: .valueChanged)
    pausePlayButton.addTarget(self, action: #selector(pausePlayButtonTapped), for: .touchUpInside)
    backwardButton.addTarget(self, action: #selector(forwardOrBackwardButtonTapped), for: .touchUpInside)
    forwardButton.addTarget(self, action: #selector(forwardOrBackwardButtonTapped), for: .touchUpInside)
    volumeSlider.addTarget(self, action: #selector(changeSliderVolume), for: .touchUpInside)
  }
  
  private func setupSelfView() {
    view.backgroundColor = .white
  }
  
  private func initUIElementsFromPlayListVC() {
    topNameOfTheSongLabel.text = topName
    iconAlbumImageView.image = iconAlbum
    bottomNameOfTheSongLabel.text = bottomName
    singerLabel.text = singer
    rightSliderLabel.text = rightSlider
  }
  
  private func makeTimer() {
    timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
  }
  
  @objc private func leftChevronButtonTapped() {
    dismiss(animated: true, completion: nil)
    timer.invalidate()
  }
  
  @objc private func share() {
    guard let nameOfSongs = topNameOfTheSongLabel.text else { return }
    let items = ["Послушай песню: \(nameOfSongs)"]
    let ac = UIActivityViewController(activityItems: items as [Any], applicationActivities: nil)
    present(ac, animated: true)
  }
  
  private func setupPlayer() {
    do{
      guard let audioPath = Bundle.main.path(forResource: track, ofType: "mp3") else { return }
      try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
      
    } catch {
      print("Error")
    }
    player.play()
    player.volume = 0.5
  }
  
  @objc private func changePointOfTrackSlider(sender: UISlider) {
    guard sender == pointOfTrackSlider else { return }
      player.currentTime = TimeInterval(sender.value)
      leftSliderLabel.text = convertToMinutes(intSeconds: Int(    pointOfTrackSlider.value))
  
  }
  
  @objc private func pausePlayButtonTapped() {
    shouldPlay.toggle()
    if shouldPlay {
      let configuration = UIImage.SymbolConfiguration(pointSize: 40, weight: .regular)
      let image = UIImage(systemName: "play.fill", withConfiguration: configuration)
      
      pausePlayButton.frame = CGRect(x: 182, y: 650, width: 50, height: 50)
      pausePlayButton.setImage(image, for: .normal)
      pausePlayButton.tintColor = .black
      player.pause()
    } else {
      let configuration = UIImage.SymbolConfiguration(pointSize: 40, weight: .regular)
      let image = UIImage(systemName: "pause.fill", withConfiguration: configuration)
      
      pausePlayButton.frame = CGRect(x: 182, y: 650, width: 50, height: 50)
      pausePlayButton.setImage(image, for: .normal)
      pausePlayButton.tintColor = .black
      player.play()
    }
  }
  
  @objc private func forwardOrBackwardButtonTapped() {
    if track == "mihail" {
      setupMadonna()
    } else {
      setupMihail()
    }
  }
  
  private func setupMadonna() {
    iconAlbumImageView.image = UIImage(named: "4 Minutes")
    topNameOfTheSongLabel.text = "4 Minutes"
    bottomNameOfTheSongLabel.text = "4 Minutes"
    singerLabel.text = "Madonna"
    track = "madonna"
    leftSliderLabel.text = "00:00"
    rightSliderLabel.text = "03:10"
    setupPlayer()
    pointOfTrackSlider.value = 0.0
    player.play()
  }
  
  private func setupMihail() {
    iconAlbumImageView.image = UIImage(named: "3 сентября")
    topNameOfTheSongLabel.text = "3 сентября"
    bottomNameOfTheSongLabel.text = "3 сентября"
    singerLabel.text = "Шуфутинский"
    leftSliderLabel.text = "00:00"
    rightSliderLabel.text = "06:21"
    track = "mihail"
    setupPlayer()
    pointOfTrackSlider.value = 0.0
    player.play()
  }

  
  @objc private func rightRepeatButtonTapped() {
    repeatIs.toggle()
    if repeatIs {
      let configuration = UIImage.SymbolConfiguration(pointSize: 18, weight: .bold)
      let image = UIImage(systemName: "repeat", withConfiguration: configuration)
      
      rightRepeatButton.frame = CGRect(x: 347, y: 650, width: 50, height: 50)
      rightRepeatButton.setImage(image, for: .normal)
      rightRepeatButton.tintColor = .black
      player.numberOfLoops = 1
    } else {
      let configuration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
      let image = UIImage(systemName: "repeat", withConfiguration: configuration)
      
      rightRepeatButton.frame = CGRect(x: 347, y: 650, width: 50, height: 50)
      rightRepeatButton.setImage(image, for: .normal)
      rightRepeatButton.tintColor = .gray
      player.numberOfLoops = 0
    }
  }
  
  @objc private func changeSliderVolume(sender: UISlider) {
    guard sender == volumeSlider else { return }
    player.volume = sender.value
  }
  
  
  @objc private func updateSlider() {
    pointOfTrackSlider.value = Float(player.currentTime)
    leftSliderLabel.text = convertToMinutes(intSeconds: Int(player.currentTime))
  }
}

extension UIViewController {
  
    func convertToMinutes(intSeconds: Int) -> String {
    let mins: Int = intSeconds / 60
    let secs: Int = intSeconds % 60
    let strTimestamp: String = ((mins<10) ? "0" : "") + String(mins) + ":" + ((secs<10) ? "0" : "") + String(secs)
    return strTimestamp
  }
}
