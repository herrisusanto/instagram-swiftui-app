//
//  InboxView.swift
//  instagram-swiftui-app
//
//  Created by loratech on 30/01/24.
//

import SwiftUI

struct InboxView: View {
    
    @State private var selectedUser: User?
    @State private var showChat = false
    @StateObject var viewModel = InboxViewModel()
    
    private var user: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            List {
                ActiveNowView()
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical)
                    .padding(.horizontal, 4)
                
                ForEach(viewModel.recentMessages){ message in
                    ZStack {
                        NavigationLink(value: message){
                            EmptyView()
                        }.opacity(0.0)
                        InboxRowView(message: message)
                    }
                    
                }
            }
            .navigationTitle("Inbox")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(PlainListStyle())
            .navigationDestination(for: Message.self) { message in
                if let user = message.user {
                    ChatView(user: user)
                }
            }
        }
    }
}

#Preview {
    InboxView()
}
