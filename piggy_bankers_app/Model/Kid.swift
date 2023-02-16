//
//  Kid.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/31/23.
//

import Foundation

struct SubBalance: Identifiable {
    let id = UUID()
    let kid_id: Int
    let name: String
    let balance: Double
}



struct Kid: Identifiable {
    let id = UUID()
    let kid_name: String
    var total_balance: Double
    var sub_balances: [SubBalance] = []
    var goals: [Goal] = []
    
    var total_sub_balance: Double {
        sub_balances.reduce(0) { $0 + $1.balance }
    }
    
    var available_balance: Double {
        total_balance + total_sub_balance
    }
}

