//
//  ProfileView.swift
//  instagram-swiftui-app
//
//  Created by loratech on 23/01/24.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
            ScrollView {
                ProfileHeaderView(user: user)
                
                
                PostGridView(user: user)
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .scrollIndicators(.hidden)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}
