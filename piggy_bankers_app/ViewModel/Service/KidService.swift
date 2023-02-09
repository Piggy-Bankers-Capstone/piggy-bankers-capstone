//
//  KidService.swift
//  piggy_bankers_app
//
//  Created by Jonah Duffin on 2/8/23.
//

import Foundation
import PostgresClientKit

struct KidService {
    static func fetchKidPG(kid_id: Int = 1) -> Kid? {
        // Fetches a single goal from POSTGRES using a goal ID. Probably not what will be used in production.
        // currently exists here for testing/proof of concept. In practice, we will probably just query all
        // goals for a single kid.
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "piggybankers.cm676jibchhn.us-west-1.rds.amazonaws.com"
            configuration.database = "piggy"
            configuration.user = "postgres"
            configuration.credential = .scramSHA256(password: "piggybankers")
            
            let connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
            
            let text = "SELECT id, household_id, profile_name, profile_img_url, profile_description FROM app.profile WHERE id = $1;"
            let statement = try connection.prepareStatement(text: text)
            defer { statement.close() }
            
            let cursor = try statement.execute(parameterValues: [ kid_id ])
            defer { cursor.close() }
            
            // This row will fail if the cursor doesn't find a kid. Should probably change to if let syntax
            let row = cursor.next()!
            let columns = try row.get().columns
//            let pg_kid_id = try columns[0].int()
//            let pg_household_id = try columns[1].int()
            let pg_kid_name = try columns[2].string()
//            let pg_kid_img_url = try columns[3].string()
//            let pg_kid_description = try columns[4].string()
            
            // this should be replaced with a sum of the transactions a kid has done, maybe an array of transactions. This way we don't have to manage both a sum and individual transactions
            let kid_total_balance: Double = 1.00
      
            return Optional(Kid(kid_name: pg_kid_name, total_balance: kid_total_balance))
        } catch {
            print(error)
        }
        // If we didn't find a kid, return nil. Will probably never be reached cause row = cursor.next()! will fail if no kid is found.
        return nil
    }
}
