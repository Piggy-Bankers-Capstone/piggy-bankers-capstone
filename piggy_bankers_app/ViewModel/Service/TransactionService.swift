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
        
        // CONSTANT Variables: int associated with column header in transaction table
//        let transaction_id_col_num = 0
        let household_id_col_num = 1
        let profile_id_col_num = 2
        let transaction_date_col_num = 3
        let transaction_type_col_num = 4
        let transaction_amount_col_num = 5
        let transaction_memo_col_num = 6
        let transaction_description_col_num = 7
        
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
    //            let transaction_id = try columns[transaction_id_col_num].int()
                let household_id = try columns[household_id_col_num].int()
                let profile_id = try columns[profile_id_col_num].int()
                let transaction_date = try columns[transaction_date_col_num].string()
                let transaction_type = try columns[transaction_type_col_num].string()
                let transaction_amount = try columns[transaction_amount_col_num].double()
                let transaction_memo = try columns[transaction_memo_col_num].string()
                let transaction_description = try columns[transaction_description_col_num].string()
                print("\(transaction_amount) - \(transaction_date)")
                
                let isoDate = transaction_date
                print(isoDate)

                let dateFormatter = DateFormatter()
                dateFormatter.locale = Locale(identifier: "en_US") // set locale to reliable US_POSIX
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                var dateOf = Date()
                if let date = dateFormatter.date(from: isoDate) {
                    dateOf = date
                }
                
                print(dateOf)

                let calendar = Calendar.current
                let components = calendar.dateComponents([.year, .month, .day], from: dateOf)
                
                let finalDate: Date = calendar.date(from: components) ?? Date()
                
                allTransactions.append(Transaction(household_id: household_id, profile_id: profile_id, transaction_date: finalDate, transaction_type: transaction_type, transaction_amount: transaction_amount, transaction_memo: transaction_memo, transaction_description: transaction_description))
            }
      
            return allTransactions
            
        } catch {
            print(error)
        }
        // If we didn't find a kid, return nil. Will probably never be reached cause row = cursor.next()! will fail if no kid is found.
        return [Transaction(household_id: 999, profile_id: 999, transaction_date: Date(), transaction_type: "type", transaction_amount: 999.99, transaction_memo: "testing transaction 999", transaction_description: "transaction for testing connection"),
                Transaction(household_id: 888, profile_id: 888, transaction_date: Date(),transaction_type: "type", transaction_amount: 888.88, transaction_memo: "testing transaction 888", transaction_description: "transaction for testing connection")
        ]
    }
}
