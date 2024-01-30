//
//  ChatView.swift
//  instagram-swiftui-app
//
//  Created by loratech on 30/01/24.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject var viewModel: ChatViewModel
    let user: User
    
    init(user: User){
        self.user = user
        self._viewModel = StateObject(wrappedValue: ChatViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    CircularProfileImageView(user: user, size: .xLarge)
                    VStack(spacing: 4) {
                        Text(user.fullname ?? "")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text(user.email)
                            .font(.footnote)
                            .foregroundStyle(Color(.systemGray))
                    }
                }
                
                LazyVStack {
                    ForEach(viewModel.messages){ message in
                        ChatMessageCell(message: message)
                    }
                }
            }
            Spacer()
            
            ZStack(alignment: .trailing) {
                TextField("Message...", text: $viewModel.messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button{
                    viewModel.sendMessage() 
                }label: {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            .padding()
        }
        .navigationTitle(user.fullname ?? user.username)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ChatView(user: User.MOCK_USERS[0])
}
