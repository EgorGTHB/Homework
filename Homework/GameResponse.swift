import Foundation

struct GameResponse {
  var word: String = ""
  func wordReturn() -> String {
    let returnValue = (word == "leohl") ?  "Hello" : "Попробуйте еще раз"
    return returnValue
  }
}
