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
        fetchKids()
    }
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var user_kids: [Kid] = [Kid]()
    
    
    func fetchKids() {
        print("fetching kids")
        
        self.user_kids = [
            Kid(kid_name: "jovi", total_balance: 10.0),
            Kid(kid_name: "rayen", total_balance: 11.0),
            Kid(kid_name: "mikah", total_balance: 12.0)
        ]
    }
    
    func fundTransaction(name: String, amount: Double) {
//        let result = self.user_kids.filter { $0.kid_name == name }.first
//        
//        if var kidChosen = result {
//            print(kidChosen)
//            print("before: \(kidChosen.total_balance)")
//            print("amount: \(amount)")
////            print("balance for \(kidChosen.kid_name) updated.")
//            kidChosen.total_balance += amount
//            print("after: \(kidChosen.total_balance)")
//        }
//        
//        print("\(self.user_kids.filter { $0.kid_name == name }.first?.total_balance)")
//        
//        print("funds transfered.")
    }
    
}
