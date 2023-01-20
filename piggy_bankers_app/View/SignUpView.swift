//
//  SignUpView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/20/23.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                Text("Piggy")
                    .font(.largeTitle)
                
                Group {
                    TextField("First name", text: $userManager.firstName)
                        .textFieldStyle(.plain)
                        .padding()
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    TextField("Last name", text: $userManager.lastName)
                        .textFieldStyle(.plain)
                        .padding()
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    TextField("username", text: $userManager.username)
                        .textFieldStyle(.plain)
                        .padding()
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $userManager.password)
                        .textFieldStyle(.plain)
                        .padding()
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    SecureField("Confirm Password", text: $userManager.confirmPassword)
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
                        .environmentObject(userManager)
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
            .environmentObject(UserManager())
    }
}
