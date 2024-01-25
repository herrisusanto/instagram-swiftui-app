//
//  ProfileView.swift
//  instagram-swiftui-app
//
//  Created by loratech on 23/01/24.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    var body: some View {
            ScrollView {
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
                    
                    Divider()
                }
                
                LazyVGrid(columns: gridItems, spacing: 1){
                    ForEach(0 ... 20, id:\.self){ index in
                        Image("jennie")
                            .resizable()
                            .scaledToFit()
                    }
                }
                
            }
            .padding()
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .scrollIndicators(.hidden)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}
