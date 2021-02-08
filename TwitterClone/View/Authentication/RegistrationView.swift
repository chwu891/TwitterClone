//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by chihsien  on 2021/1/28.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var fullName = ""
    @State var username = ""
    @State var email = ""
    @State var password = ""
    
    @State private var toShowPhotoLibrary = false
    @State private var image: UIImage?
    @State private var transferredImage: Image?
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    func loadImage() {
        guard let image = image else { return }
        transferredImage = Image(uiImage: image)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: { self.toShowPhotoLibrary = true }, label: {
                    
                    if let userimage = transferredImage {
                        userimage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipped()
                            .cornerRadius(75)
                        
                    } else {
                        Image(systemName: "person.crop.circle.badge.plus")
                            .resizable()
                            .scaledToFill()
                            .foregroundColor(.white)
                            .frame(width: 150, height: 150)
                    }
                    
                })
                .padding(.top, 80)
                .padding(.bottom, 30)
                .sheet(isPresented: $toShowPhotoLibrary, onDismiss: loadImage, content: {
                    ImagePicker(selectedImage: $image, sourceType: .photoLibrary)
                })
                
                
                VStack(spacing: 20) {
                    
                    CustomTextField(text: $fullName, placeholder: Text("Full Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
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
                
                Button(action: {
                    guard let image = image else { return }
                    viewModel.registerUser(email: email, password: password, fullname: fullName, username: username, profileImage: image)
                }, label: {
                    Text("Sign up")
                        .font(.headline)
                        .foregroundColor(.blue)
                })
                .frame(width: 360, height: 50)
                .background(Color(.white))
                .clipShape(Capsule())
                .padding()
                
                Spacer()
                
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        mode.wrappedValue.dismiss()
                    }, label: {
                        Text("Sign in")
                            .font(.footnote)
                            .bold()
                            .foregroundColor(.white)
                        
                    })
                }
                .padding(.bottom, 30)
            }
        }
        .background(Color(#colorLiteral(red: 0.1137254902, green: 0.631372549, blue: 0.9490196078, alpha: 1)))
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
