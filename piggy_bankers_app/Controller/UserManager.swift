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
    
    internal init(firstName: String = "", lastName: String = "", username: String = "", password: String = "", confirmPassword: String = "", user_kids: [Kid] = [Kid]()) {
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.password = password
        self.confirmPassword = confirmPassword
        self.user_kids = [
            Kid(kid_name: "jovi", total_balance: 10.0),
            Kid(kid_name: "rayen", total_balance: 11.0),
            Kid(kid_name: "mikah", total_balance: 12.0)
        ]
    }
    
    @Published var firstName: String
    @Published var lastName: String
    @Published var username: String
    @Published var password: String
    @Published var confirmPassword: String
    @Published var user_kids: [Kid]?
    
}
