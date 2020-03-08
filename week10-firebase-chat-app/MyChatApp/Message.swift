import UIKit
import Firebase

class Message: NSObject {
    var sender: String
    var message: String
    var localCreatedTime: Int64
    
    override init() {
        self.sender = ""
        self.message = ""
        self.localCreatedTime = Date.currentTimeStamp
    }
    
    func receiveFromSnapshotValue(data: DataSnapshot) {
        let dicData = data.value as! Dictionary<String, String>
        let messageBody = dicData["body"]!
        let sender = dicData["sender"]!
        self.sender = sender
        self.message = messageBody
    }
}

extension Date {
    static var currentTimeStamp: Int64{
        return Int64(Date().timeIntervalSince1970 * 1000)
    }
}
