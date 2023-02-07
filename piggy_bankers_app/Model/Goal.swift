//
//  Goal.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/31/23.
//

import Foundation
import PostgresClientKit

struct Goal: Identifiable {
    var id = UUID()
    private(set) var goal_name: String
    private(set) var goal_amount: Double
    private(set) var total_needed: Double
    
    init(goal_name: String, goal_amount: Double, total_needed: Double) {
        self.goal_name = goal_name
        self.goal_amount = goal_amount
        self.total_needed = total_needed
    }
    
    mutating func fetchGoalPG(goal_id: Int = 1) {
        // Fetches a single goal from POSTGRES using a goal ID. Probably not what will be used in production.
        // currently exists here for testing/proof of concept. In practice, we will probably just query all
        // goals for a single kid.
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "piggybankers.cm676jibchhn.us-west-1.rds.amazonaws.com"
            configuration.database = "piggy"
            configuration.user = "postgres"
            configuration.credential = .cleartextPassword(password: "piggybankers")
            
            let connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
            
            let text = "SELECT goal_id, household_id, profile_id, goal_name, goal_description, goal_amount, goal_total_needed WHERE goal_id = $1;"
            let statement = try connection.prepareStatement(text: text)
            defer { statement.close() }
            
            let cursor = try statement.execute(parameterValues: [ goal_id ])
            defer { cursor.close() }
            
            for row in cursor {
                let columns = try row.get().columns
                let pg_goal_id = try columns[0].int()
                let pg_household_id = try columns[1].int()
                let pg_profile_id = try columns[2].int()
                let pg_goal_name = try columns[3].string()
                let pg_goal_description = try columns[4].string()
                let pg_goal_amount = try columns[5].double()
                let pg_goal_total_needed = try columns[6].double()
                
                goal_name = pg_goal_name
                goal_amount = pg_goal_amount
                total_needed = pg_goal_total_needed
            }
        } catch {
            print(error)
        }
    }
}
