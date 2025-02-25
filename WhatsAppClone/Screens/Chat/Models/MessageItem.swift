//
//  MessageItem.swift
//  WhatsAppClone
//
//  Created by Vlad on 20/7/24.
//

import SwiftUI

struct MessageItem: Identifiable {
    let id = UUID().uuidString
    let text: String
    let type: MessageType
    let direction: MessageDirection
    
    static let sentPlaceholder = MessageItem(text: "sent message", type: .text, direction: .sent)
    static let receivedPlaceholder = MessageItem(text: "received message", type: .text, direction: .received)
    
    var alignment: Alignment {
        return direction == .received ? .leading : .trailing
    }
    
    var horizontalAlignment: HorizontalAlignment {
        return direction == .received ? .leading : .trailing
    }
    
    var backgroundColor: Color {
        return direction == .sent ? .bubbleGreen : .bubbleWhite
    }
    
    // Stub Messages for examination
    static let stubMessages: [MessageItem] = [
        MessageItem(text: "Hi There", type: .text, direction: .sent),
        MessageItem(text: "Check out this photo", type: .photo, direction: .received),
        MessageItem(text: "Play out this video", type: .video, direction: .sent),
        MessageItem(text: "Listen out this song", type: .audio, direction: .received)
    ]
}

enum MessageType {
    case text, photo, video, audio
}

enum MessageDirection {
    case sent, received
    
    static var random: MessageDirection {
        return [MessageDirection.sent, .received].randomElement() ?? .sent
    }
}
