//
//  GoalService.swift
//  piggy_bankers_app
//
//  Created by Jonah Duffin on 2/8/23.
//

import Foundation
import PostgresClientKit

struct GoalService {
    static func fetchAllGoalsForKidPG(kid_id: Int = 1) -> [Goal] {
        // Fetches a single goal from POSTGRES using a goal ID. Probably not what will be used in production.
        // currently exists here for testing/proof of concept. In practice, we will probably just query all
        // goals for a single kid.
        var goals = [Goal]()
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "piggybankers.cm676jibchhn.us-west-1.rds.amazonaws.com"
            configuration.database = "piggy"
            configuration.user = "postgres"
            configuration.credential = .cleartextPassword(password: "piggybankers")
            
            let connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
            
            let text = "SELECT goal_id, household_id, profile_id, goal_name, goal_description, goal_amount, goal_total_needed FROM app.goal WHERE profile_id = $1;"
            let statement = try connection.prepareStatement(text: text)
            defer { statement.close() }
            
            let cursor = try statement.execute(parameterValues: [ kid_id ])
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
                
                goals.append(Goal(goal_name: pg_goal_name, goal_amount: pg_goal_amount, total_needed: pg_goal_total_needed))
            }
            return goals
        } catch {
            print(error)
        }
        // is it best to return an empty array of goals here? Could probably throw an error if the request didn't work,
        // only return empty array if there truly were no goals
        return goals
    }
}
