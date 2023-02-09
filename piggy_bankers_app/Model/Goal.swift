//
//  Goal.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/31/23.
//

import Foundation

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
    
}
