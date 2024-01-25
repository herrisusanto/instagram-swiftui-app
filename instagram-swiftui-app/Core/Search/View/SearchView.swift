//
//  SearchView.swift
//  instagram-swiftui-app
//
//  Created by loratech on 24/01/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
     
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(User.MOCK_USERS) { user in
                        NavigationLink(value: user) {
                            UserRowView(user: user)
                        }
                    }
                    
                }
                .padding(.top)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}

struct UserRowView: View {
    let user: User
    var body: some View {
        HStack {
            if let imageUrl = user.profileImageUrl {
                Image(imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            VStack(alignment: .leading) {
                Text(user.username)
                    .fontWeight(.semibold)
                if let fullName = user.fullname {
                    Text(fullName)
                }
            }
            .font(.footnote)
            
            Spacer()
            
        }
        .foregroundStyle(.black)
        .padding(.horizontal)
    }
}
