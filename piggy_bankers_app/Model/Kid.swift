//
//  Kid.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/31/23.
//

import Foundation

struct Kid: Identifiable {
    let id = UUID()
    let kid_name: String
    var total_balance: Double
    var goals: [Goal] = []
}
