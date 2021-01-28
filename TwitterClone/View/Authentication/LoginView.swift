//
//  LoginView.swift
//  TwitterClone
//
//  Created by chihsien  on 2021/1/28.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("Twitter_Logo_WhiteOnBlue")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 180)
                        .padding(.top, 30)
                    
                    VStack(spacing: 20) {
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                  
                        SecureTextField(text: $password, placeholder: Text("Password"), imageName: "lock")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 30)
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {}, label: {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .foregroundColor(.white)
                                .padding()
                        })
                    }
                    
                    Button(action: {}, label: {
                        Text("Sign in")
                            .font(.headline)
                            .foregroundColor(.blue)
                    })
                    .frame(width: 360, height: 50)
                    .background(Color(.white))
                    .clipShape(Capsule())
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    HStack {
                        Text("Don't have an account?")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: RegistrationView().navigationBarBackButtonHidden(true)) {
                            Text("Sign up")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.bottom, 30)
                }
            }
            .background(Color(#colorLiteral(red: 0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1)))
            .ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
