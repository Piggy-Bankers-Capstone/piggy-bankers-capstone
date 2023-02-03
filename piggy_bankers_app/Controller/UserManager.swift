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
    
    init() {
//        fetchKids()
    }
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var user_kids: [Kid] = testKids
    
    
    func fetchKids() {
        print("fetching kids")
    }
    
    func fundTransaction(name: String, amount: Double) {
        let result = user_kids.first { $0.kid_name == name}

        if var kidChosen = result {
            print(kidChosen)
            print("before: \(kidChosen.total_balance)")
            print("amount: \(amount)")
//            print("balance for \(kidChosen.kid_name) updated.")
            kidChosen.total_balance = kidChosen.total_balance + amount
            print("after: \(kidChosen.total_balance)")
            
        }

        print("funds transfered.")
    }
    
}
