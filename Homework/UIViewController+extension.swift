import UIKit

extension UIViewController {
  
  func convertToMinutes(seconds: Int) -> String {
     let mins: Int = seconds / 60
     let hours: Int = mins / 60
     let secs: Int = seconds % 60

     let strTimestamp: String = ((hours < 10) ? "0" : "") + String(hours) + ":" + ((mins < 10) ? "0" : "") + String(mins) + ":" + ((secs < 10) ? "0" : "") + String(secs)
     return strTimestamp
  }
}
