//
//  ProfileHeaderView.swift
//  instagram-swiftui-app
//
//  Created by loratech on 25/01/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State var showEditProfile = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                CircularProfileImageView(user: user, size: .xLarge)
                
                
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
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("follow user")
                }
            }label:{
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .foregroundStyle(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                    }
            }
            .padding(.horizontal)
            
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile){
            EditProfileView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}
