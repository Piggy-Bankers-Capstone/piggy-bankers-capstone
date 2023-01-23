//
//  HomeView.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 1/20/23.
//

import SwiftUI

struct Child: Identifiable {
    var id = UUID()
    var total_balance: Decimal
    var goals: [(goal_name: String, goal_balance: Decimal)]
}

struct HomeView: View {
    var body: some View {
        Text("profile view")
    }
}

