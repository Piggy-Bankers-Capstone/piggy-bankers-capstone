//
//  UserManager.swift
//  piggy_bankers_app
//
//  Created by Jonah Duffin on 2/8/23.
//
import Foundation
import UIKit

@MainActor
class GoalManager: ObservableObject {
    
    init() {
        self.kid_goals = GoalService.fetchAllGoalsForKidPG(kid_id: 1)
    }
    
    @Published var kid_goals: [Goal] = [Goal]()
    
}
