import Foundation

struct User {
    var name: String
    var surname: String
}

var users: [User] = [
    User(name: "Antony", surname: "Brown"),
    User(name: "John", surname: "Real"),
    User(name: "Emma", surname: "Smith"),
    User(name: "Paul", surname: "Wattson")
]

struct Message {
    var content: String
    var date: String
    var time: String
}

enum MessengerError: Error {
    case emptyMessage
    case userNotFound
    
    var localizedDescription: String {
        switch self {
        case .emptyMessage:
            return "Message is empty."
        case .userNotFound:
            return "User not found."
        }
    }
}

// Class for creating a wrap for the message
class NewMessage {
    var date: String,
        time: String
    
    func wrapMessage(content: String?) -> (Message?, MessengerError?) {
        guard content != "" && content != " " else { return (nil, MessengerError.emptyMessage) }
        return (Message(content: content!, date: self.date, time: self.time), nil)
    }
    
    init(date: String, time: String) {
        self.date = date
        self.time = time
    }
}

class Messenger {
    var version: String
    
    private func isUserInUsers(_ user: User) -> Bool {
        for i in users {
            if user.name == i.name && user.surname == i.surname {
                return true
            }
        }
        return false
    }
    
    func sendMessage(message: Message, toUser: User) throws {
        guard isUserInUsers(toUser) else { throw MessengerError.userNotFound }
        print("New message for \(toUser.name) \(toUser.surname): \(message.content)")
    }
    
    init() {
        self.version = "0.0.1"
    }
}

var telegram = Messenger()

var user1 = User(name: "Some", surname: "User"), // Incorrect user
    user2 = User(name: "Emma", surname: "Smith")   // Correct user

var rawMessage1: String = "",               // Incorrect message
    rawMessage2: String = "Hello! How are you?" // Incorrect message

var wrappedMessage = NewMessage(date: "09/02/21", time: "12:00PM").wrapMessage(content: rawMessage1)

if let content = wrappedMessage.0 {
    do {
        try telegram.sendMessage(message: content, toUser: user1)
    } catch let error as MessengerError {
        print("Can't send a message because of error: \(error.localizedDescription)")
    }
} else if let error = wrappedMessage.1 {
    print("Can't send a message because of error: \(error.localizedDescription)")
}



