//
//  ChatView.swift
//  MyChatRoom-SwiftUI
//
//  Created by Hmoo Myat Theingi on 06/01/2024.
//

import SwiftUI

struct ChatView: View {
    @StateObject var chatViewModel = ChatViewModel()
    @State private var messageField=""
    var body: some View {
        
        NavigationView {
            VStack {
                ScrollView {
                    VStack(spacing:8) {
                        ForEach(chatViewModel.eampleMessages){ message in
                            MessageView(message: message)
                        }
                    }
                }
                
                HStack {
                    TextField("", text: $messageField, axis: .vertical)
                        .padding()
                    
                    Button {
                        if messageField.count>0{
                            chatViewModel.sendMessage(text: messageField) { success in
                                if success{
                                    
                                }else{
                                    print("Error sending message")
                                }
                            }
                            messageField=""
                        }
                    } label: {
                        Image(systemName: "paperplane.circle.fill")
                            .font(.title)
                            .padding()
                            .background(.white)
                            .cornerRadius(30)
                            .padding([.trailing,.top])
                    }

                }
                .background(Color(uiColor: .systemGray6))

                
            }
            .navigationTitle("MyChatRoom")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar{
                            ToolbarItem(placement: .topBarTrailing) {
                                Button{
                                   //
                                } label: {
                                    Text("Sign out")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
            
        }
    
    }


#Preview {
    ChatView()
}
