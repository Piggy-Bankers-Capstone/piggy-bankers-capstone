//
//  KidManager.swift
//  piggy_bankers_app
//
//  Created by Jonah Duffin on 2/8/23.
//

import Foundation
import UIKit

// I guess all Kids should be an array of Kids associated with a User (or a Household if we ever get that far).
// But this KidManager can exist for now.

@MainActor
class KidManager: ObservableObject {
    
    init() {
        // This should probably accept a user/household ID and return all the kids for the user.
        // But for now it just pulls in a single kid for testing.
        self.kids = [KidService.fetchKidPG(kid_id: 1)!]
    }
    
    @Published var kids: [Kid]
    
}
