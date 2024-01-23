//
//  ProfileView.swift
//  instagram-swiftui-app
//
//  Created by loratech on 23/01/24.
//

import SwiftUI

struct ProfileView: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    HStack(spacing: 8) {
                        Circle()
                            .frame(width: 84, height: 84)
                        
                        Spacer()
                        
                        UserStatView(value: 23, title: "Posts")
                        
                        UserStatView(value: 11, title: "Followers")
                        
                        UserStatView(value: 33, title: "Following")
                    }
                    .padding(.bottom)
                    
                    VStack {
                        Text("Jennie Blackpink")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text("Wakanda Forever")
                            .font(.footnote)
                        
                    }
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
            .toolbar{
                ToolbarItem {
                    Button{
                        
                    }label:{
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
            }
            
        }
    }
}

#Preview {
    ProfileView()
}
