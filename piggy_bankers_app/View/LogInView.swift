//
//  LogInView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/20/23.
//

import SwiftUI

struct LogInView: View {
    // temp - delete once db auth set up
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                Text("Piggy")
                    .font(.largeTitle)
                
                Group {
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
                }
                
                NavigationLink {
                    ActiveUserView()
                } label: {
                    Text("Log In")
                        .bold()
                        .frame(width: 280, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(.gray, lineWidth: 2)
                        )
                }
                
                NavigationLink {
                    SignUpView()
                } label: {
                    Text("Don't have an account? Sign Up")
                }
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
