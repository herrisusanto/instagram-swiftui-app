//
//  ProfileHeaderView.swift
//  instagram-swiftui-app
//
//  Created by loratech on 25/01/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                if let imageUrl = user.profileImageUrl {
                    Image(imageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 84, height: 84)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                    
                
                Spacer()
                
                UserStatView(value: 23, title: "Posts")
                
                UserStatView(value: 11, title: "Followers")
                
                UserStatView(value: 33, title: "Following")
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            VStack(alignment: .leading, spacing: 4) {
                if let fullName = user.fullname {
                    Text(fullName)
                        .fontWeight(.semibold)
                }
                if let bio = user.bio {
                    Text(bio)
                }
                
            }
            .padding(.horizontal)
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button{
                
            }label:{
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.gray, lineWidth: 1)
                    }
            }
            .padding(.horizontal)
            
            Divider()
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}
