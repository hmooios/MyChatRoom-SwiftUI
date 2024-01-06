//
//  ContentView.swift
//  MyChatRoom-SwiftUI
//
//  Created by Hmoo Myat Theingi on 05/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showSignInView = true
    var body: some View {
        
        NavigationView {
            VStack{
                NavigationLink {
                    RegisterView()
                } label: {
                    Text("Register")
                }
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Login")
                }
                
            }
        }
       
        
        
    }
}

#Preview {
    ContentView()
}
