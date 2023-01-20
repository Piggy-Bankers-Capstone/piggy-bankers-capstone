//
//  UserManager.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/20/23.
//
import Foundation
import UIKit

@MainActor
class UserManager: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var username = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
}
