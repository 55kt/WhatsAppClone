//
//  MessageItem.swift
//  WhatsAppClone
//
//  Created by Vlad on 20/7/24.
//

import Foundation

struct MessageItem: Identifiable {
    let id = UUID().uuidString
    let text: String
    let direction: MessageDirection
}

enum MessageDirection {
    case sent, recived
    
    static var random: MessageDirection {
        return [MessageDirection.sent, .recived].randomElement() ?? .sent
    }
}
