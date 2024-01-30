//
//  ChatViewModel.swift
//  instagram-swiftui-app
//
//  Created by loratech on 30/01/24.
//

import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var messageText = ""
    @Published var messages = [Message]()
    
    let service: ChatService
    
    init(user: User){
        self.service = ChatService(chatPartner: user)
        observeMessage()
    }
    
    func observeMessage(){
        service.observeMessage(){ message in
            self.messages.append(contentsOf: message)
        }
    }
    
    func sendMessage(){
        service.sendMessage(messageText)
    }
    
}
