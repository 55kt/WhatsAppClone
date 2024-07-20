//
//  MessageListView.swift
//  WhatsAppClone
//
//  Created by Vlad on 20/7/24.
//

import SwiftUI

struct MessageListView: UIViewControllerRepresentable {
    typealias UIViewControllerType = MessageListController
    
    func makeUIViewController(context: Context) -> MessageListController {
        let messageListController = MessageListController()
        return messageListController
    }
    
    func updateUIViewController(_ uiViewController: MessageListController, context: Context) {
        //
    }
}

#Preview {
    MessageListView()
}
