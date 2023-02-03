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

let testKids = [
    Kid(kid_name: "jovi", total_balance: 10.0),
    Kid(kid_name: "rayen", total_balance: 11.0),
    Kid(kid_name: "mikah", total_balance: 12.0)
]
