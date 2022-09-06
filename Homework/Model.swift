import Foundation

struct Model {
    
    var word: String = ""
    
    func wordReturn() -> String {
        
        if word == "leohl" {
            
            return "Hello"
            
        } else {
            
            return "Попробуйте еще раз"
            
        }
    }
}
