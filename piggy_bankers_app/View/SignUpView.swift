//
//  SignUpView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/20/23.
//

import SwiftUI

struct SignUpView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                Text("Piggy")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Group {
                    TextField("First name", text: $firstName)
                        .textFieldStyle(.plain)
                        .padding()
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    TextField("Last name", text: $lastName)
                        .textFieldStyle(.plain)
                        .padding()
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    TextField("username", text: $username)
                        .textFieldStyle(.plain)
                        .padding()
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(.plain)
                        .padding()
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    SecureField("Confirm Password", text: $confirmPassword)
                        .textFieldStyle(.plain)
                        .padding()
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }
                
                NavigationLink {
                    ActiveUserView()
                } label: {
                    Text("Sign Up")
                        .bold()
                        .frame(width: 280, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.gray, lineWidth: 2)
                        )
                }
                
                NavigationLink {
                    LogInView()
                } label: {
                    Text("Already have an account? Log in.")
                }
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
