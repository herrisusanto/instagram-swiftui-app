//
//  UserStatView.swift
//  instagram-swiftui-app
//
//  Created by loratech on 23/01/24.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(title)
                .font(.footnote)
        }
        .frame(width: 72)
    }
}

#Preview {
    UserStatView(value: 12, title: "Posts")
}
