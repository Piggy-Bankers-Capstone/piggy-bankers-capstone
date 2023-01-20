//
//  ContentView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/17/23.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject var userManager = UserManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                
                VStack {
                    Text("Piggy")
                        .font(.largeTitle)
                    NavigationLink {
                        ActiveUserView()
                            .environmentObject(userManager)
                    } label: {
                        Text("active user view")
                    }
                    
                    NavigationLink {
                        SignUpView()
                            .environmentObject(userManager)
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
                        Text("Log In")
                            .bold()
                            .frame(width: 280, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(.gray, lineWidth: 2)
                            )
                    }
                }
                .padding()
            }
            .ignoresSafeArea()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
