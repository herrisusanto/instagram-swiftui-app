//
//  MainTabBarView.swift
//  instagram-swiftui-app
//
//  Created by loratech on 23/01/24.
//

import SwiftUI

struct MainTabBarView: View {
    var body: some View {
        TabView{
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                }
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
            
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabBarView()
}
