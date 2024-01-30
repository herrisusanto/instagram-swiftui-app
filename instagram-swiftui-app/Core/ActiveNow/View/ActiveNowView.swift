//
//  ActiveNowView.swift
//  instagram-swiftui-app
//
//  Created by loratech on 30/01/24.
//

import SwiftUI

struct ActiveNowView: View {
    
    @StateObject var viewModel = ActiveNowViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 32) {
                ForEach(viewModel.users){ user in
                    NavigationLink{
                        ChatView(user: user)
                    }label:{
                        VStack{
                            ZStack(alignment: .bottomTrailing) {
                                CircularProfileImageView(user: user, size: .large)
                                ZStack {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 18, height: 18)
                                    Circle()
                                        .fill(Color(.systemGreen))
                                        .frame(width: 12, height: 12)
                                }
                            }
                            Text(user.fullname ?? "")
                                .font(.subheadline)
                                .foregroundStyle(Color(.systemGray))
                        }
                    }
                   
                }
            } 
        }
        .frame(height: 106)
    }
}

#Preview {
    ActiveNowView().environmentObject(ActiveNowViewModel())
}
