//
//  BubbleTailView.swift
//  WhatsAppClone
//
//  Created by Vlad on 20/7/24.
//

import SwiftUI

// MARK: - Bubble Tails
struct BubbleTailView: View {
    
    var direction: MessageDirection
    
    private var backgroundColor: Color {
        return direction == .received ? .bubbleWhite : .bubbleGreen
    }
    
    // Optionality
    var body: some View {
        Image(direction == .sent ? .outgoingTail : .incomingTail)
            .renderingMode(.template)
            .resizable()
            .frame(width: 10, height: 10)
            .offset(y: 3)
            .foregroundStyle(backgroundColor)
    }
}

// MARK: - Preview
#Preview {
    ScrollView {
        BubbleTailView(direction: .sent)
        BubbleTailView(direction: .received)
    }
    .frame(maxWidth: .infinity)
    .background(Color.black.opacity(0.1))
}
