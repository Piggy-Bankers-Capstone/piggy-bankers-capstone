//
//  TransactionManager.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 2/9/23.
//

import Foundation

@MainActor
class TransactionManager: ObservableObject {
    
    init() {
        // This should probably accept a user/household ID and return all the kids for the user.
        // But for now it just pulls in a single kid for testing.
        self.transactions = TransactionService.fetchTransactionsPG()
    }
    
    @Published var transactions: [Transaction]
    
}