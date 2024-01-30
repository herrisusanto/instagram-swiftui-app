//
//  InboxView.swift
//  instagram-swiftui-app
//
//  Created by loratech on 30/01/24.
//

import SwiftUI

struct InboxView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(Message.MOCK_MESSAGES){ message in
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
        }
    }
}

#Preview {
    InboxView()
}
