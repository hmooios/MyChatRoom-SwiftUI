//
//  MessageView.swift
//  MyChatRoom-SwiftUI
//
//  Created by Hmoo Myat Theingi on 05/01/2024.
//

import SwiftUI

struct MessageView: View {
    
    var message:Message
    
    var body: some View {
        
        if message.isFromCurrentUser(){
            HStack{
                HStack{
                    Text(message.text)
                        .padding()
                }
                .frame(maxWidth: 260,alignment: .topLeading)
                .background(.blue)
                .cornerRadius(20)
                
                Image(systemName: "person")
                    .frame(maxHeight: 32,alignment:.top)
                    .padding(.bottom,16)
                    .padding(.leading,4)
                
            }
            .frame(maxWidth: 360,alignment: .trailing)
            
        }else{
            HStack{
                
                Image(systemName: "person")
                    .frame(maxHeight: 32,alignment:.top)
                    .padding(.bottom,16)
                    .padding(.leading,4)
                HStack{
                    Text(message.text)
                        .padding()
                }
                .frame(maxWidth: 260,alignment: .leading)
                .background(.gray)
                .cornerRadius(20)
             
                
            }
            .frame(maxWidth: 360,alignment: .leading)
        }

    }
}

#Preview {
    MessageView(message: Message.example)
}
