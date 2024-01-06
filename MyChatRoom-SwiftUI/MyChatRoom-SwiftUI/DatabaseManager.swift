//
//  DatabaseManager.swift
//  MyChatRoom-SwiftUI
//
//  Created by Hmoo Myat Theingi on 06/01/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

enum FetchMessageError:Error{
    case snapshotError
}

final class DatabaseManager{
    static let shared = DatabaseManager()
    let messageRef = Firestore.firestore().collection("messages")
    
    func fetchMessage(completion:@escaping (Result<[Message],FetchMessageError>)->Void){
        messageRef
            .order(by: "createdAt",descending: true)
            .getDocuments { querySnapshot, error in
            if let e=error{
                completion(.failure(.snapshotError))
            }else{
                if let docs = querySnapshot?.documents{
                    var messages=[Message]()

                    for doc in docs{
                        let data = doc.data()
                        let text = data["text"] as? String ?? "Error"
                        let userUID = data["userUID"] as? String ?? "Error"
                        let photoURL = data["photoURL"] as? String ?? ""
                        let createdAt = data["createdAt"] as? Date ?? Date()
                        
                        let message = Message(userUID: userUID, text: text, photoURL: photoURL, createdAt: createdAt)
                        messages.append(message)
                    }
                    
                    completion(.success(messages))
                }
            }
        }
    }
    
    
    func saveMessage(message:Message,completion: @escaping (Bool)->Void){
        let data = [
            "text":message.text,
            "userUID":message.userUID,
            "photoURL":message.photoURL ?? "",
            "createdAt":message.id
        ] as [String : Any]
        
        messageRef.addDocument(data: data) { error in
            if let e=error{
                print("Error saving message to firebase.")
                completion(false)
            }else{
                completion(true)
            }
        }
    }
}
