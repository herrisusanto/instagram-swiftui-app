//
//  MessageView.swift
//  instagram-swiftui-app
//
//  Created by loratech on 30/01/24.
//

import SwiftUI

struct MessageView: View {
    
    @State var searchText = ""
    @Environment(\.dismiss) var dismiss
    
    @StateObject var viewModel = MessageViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("To: ", text: $searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                Text("CONTACTS")
                    .foregroundStyle(.gray)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .padding()
                
                ForEach(viewModel.users){ user in
                    VStack {
                        HStack {
                            CircularProfileImageView(user: user, size: .large)
                            if let fullname = user.fullname {
                                Text(fullname)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            }
                            
                            Spacer()
                            
                        }
                        .padding(.leading)
                    }
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button("Cancel"){
                        dismiss()
                    }
                    .foregroundStyle(.blue)
                }
            }
            
        }
    }
}

#Preview {
    MessageView()
}
