//
//  Transaction.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 2/9/23.
//

import Foundation

struct Transaction: Identifiable, Hashable {
    let id = UUID()
    let household_id: Int
    var profile_id: Int
    var transaction_date: Date
    var transaction_type: String
    var transaction_amount: Double
    var transaction_memo: String
    var transaction_description: String
    
    init(household_id: Int = 1,
         profile_id: Int = 1,
         transaction_date: Date = Date(),
         transaction_type: String = "",
         transaction_amount: Double = 0.0,
         transaction_memo: String = "",
         transaction_description: String = ""
    ) {
        self.household_id = household_id
        self.profile_id = profile_id
        self.transaction_date = transaction_date
        self.transaction_type = transaction_type
        self.transaction_amount = transaction_amount
        self.transaction_memo = transaction_memo
        self.transaction_description = transaction_description
    }
    
    
}
