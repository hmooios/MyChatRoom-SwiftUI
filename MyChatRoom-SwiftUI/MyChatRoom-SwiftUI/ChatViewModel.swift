//
//  ChatViewModel.swift
//  MyChatRoom-SwiftUI
//
//  Created by Hmoo Myat Theingi on 06/01/2024.
//

import Foundation
import FirebaseAuth

class ChatViewModel:ObservableObject{
    @Published var messages = [Message]()
    
    @Published var eampleMessages = [
    Message(userUID: "123", text: "Hello,it's me", photoURL: nil, createdAt: Date()),
    Message(userUID: "123", text: "Hello,it's me", photoURL: nil, createdAt: Date()),
    Message(userUID: "123", text: "Hello,it's me", photoURL: nil, createdAt: Date()),
    Message(userUID: "123", text: "Hello,it's me", photoURL: nil, createdAt: Date()),
    Message(userUID: "123", text: "Hello,it's me", photoURL: nil, createdAt: Date())
    ]
    
    init(){
        DatabaseManager.shared.fetchMessage { result in
            switch result {
            case .success(let messages):
                self.messages=messages
            case .failure(let failure):
                print("Error fetching messages \(failure)")
            }
        }
    }
    
    func sendMessage(text:String,completion:@escaping(Bool)->Void){
        guard
        let user = Auth.auth().currentUser else{
            return
        }
        let message = Message(userUID: user.uid, text: text, photoURL: nil, createdAt: Date())
        DatabaseManager.shared.saveMessage(message: message) { success in
            if success{
                self.messages.append(message)
                completion(true)
            }else{
                completion(false)
            }
        }
    }
}
