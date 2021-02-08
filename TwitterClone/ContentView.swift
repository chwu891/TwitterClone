//
//  ContentView.swift
//  TwitterClone
//
//  Created by chihsien  on 2021/1/28.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                VStack {
                    Text("Hello, world!")
                        .padding()
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        Text("Button")
                    })
                }
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
