//
//  KidProfileTag.swift
//  piggy_bankers_app
//
//  Created by Mitch Rogers on 2/15/23.
//

import SwiftUI

struct KidProfileTag: View {
    let tag_hw: CGFloat? = 40
    let font_size: CGFloat? = 22
    let profile_id: String
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: tag_hw, height: tag_hw)
                .foregroundColor(.gray)
            
            Text("\(profile_id)")
                .font(.system(size: font_size!))
        }
    }
}

struct KidProfileTag_Previews: PreviewProvider {
    static var previews: some View {
        KidProfileTag(profile_id: "101")
    }
}
