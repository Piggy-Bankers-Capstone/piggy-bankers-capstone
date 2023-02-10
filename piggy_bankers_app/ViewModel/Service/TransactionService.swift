//
//  TransactionService.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 2/9/23.
//

import Foundation
import PostgresClientKit

struct TransactionService {
    static func fetchTransactionsPG() -> [Transaction] {
        // Fetches a single goal from POSTGRES using a goal ID. Probably not what will be used in production.
        // currently exists here for testing/proof of concept. In practice, we will probably just query all
        // goals for a single kid.
        var allTransactions: [Transaction] = []
        
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "piggybankers.cm676jibchhn.us-west-1.rds.amazonaws.com"
            configuration.database = "piggy"
            configuration.user = "postgres"
            configuration.credential = .scramSHA256(password: "piggybankers")
            
            let connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
            
            let text = "SELECT id, household_id, profile_id, transaction_date, transaction_type, transaction_amount, transaction_memo, transaction_description FROM app.transaction;"
            let statement = try connection.prepareStatement(text: text)
            defer { statement.close() }
            
            let cursor = try statement.execute(parameterValues: [])
            defer { cursor.close() }
            
            for row in cursor {
                let columns = try row.get().columns
    //            let transaction_id = try columns[0].int()
                let household_id = try columns[1].int()
                let profile_id = try columns[2].int()
                let transaction_date = try columns[3].string()
                let transaction_type = try columns[4].string()
                let transaction_amount = try columns[5].double()
                let transaction_memo = try columns[6].string()
                let transaction_description = try columns[7].string()
                print("\(transaction_amount) - \(transaction_date)")
                
                allTransactions.append(Transaction(household_id: household_id, profile_id: profile_id, transaction_date: transaction_date, transaction_type: transaction_type, transaction_amount: transaction_amount, transaction_memo: transaction_memo, transaction_description: transaction_description))
            }
      
            return allTransactions
            
        } catch {
            print(error)
        }
        // If we didn't find a kid, return nil. Will probably never be reached cause row = cursor.next()! will fail if no kid is found.
        return [Transaction(household_id: 999, profile_id: 999, transaction_date: "01/01/2000", transaction_type: "type", transaction_amount: 999.99, transaction_memo: "testing transaction 999", transaction_description: "transaction for testing connection"),
                Transaction(household_id: 888, profile_id: 888, transaction_date: "01/01/2000",transaction_type: "type", transaction_amount: 888.88, transaction_memo: "testing transaction 888", transaction_description: "transaction for testing connection")
        ]
    }
}
