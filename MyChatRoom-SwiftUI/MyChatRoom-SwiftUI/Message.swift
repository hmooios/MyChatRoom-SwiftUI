//
//  Message.swift
//  MyChatRoom-SwiftUI
//
//  Created by Hmoo Myat Theingi on 05/01/2024.
//

import Foundation
import FirebaseAuth

struct Message:Decodable,Identifiable{
    var id = UUID()
    let userUID :String
    let text:String
    let photoURL:String?
    let createdAt:Date
    
    func isFromCurrentUser()->Bool{
        guard let user = Auth.auth().currentUser else{
                return false
            }
        
        if user.uid == userUID{
            return true
        }else{
            return false
        }
    }

    
    static let example=Message(userUID: "123", text: "Hello this is a message from me", photoURL: "", createdAt: Date())
}
