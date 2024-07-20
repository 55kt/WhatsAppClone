//
//  BubbleTextView.swift
//  WhatsAppClone
//
//  Created by Vlad on 20/7/24.
//

import SwiftUI

struct BubbleTextView: View {
    
    let item: MessageItem
    
    var body: some View {
        VStack(alignment: item.horizontalAlignment, spacing: 3) {
            Text("Hello, World! How are you doing")
                .padding(10)
                .background(item.backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .applyTail(item.direction)
            
            timeStampTextView()
        }
        .shadow(color: Color(.systemGray3).opacity(0.1), radius: 5, x: 0, y: 20)
        .frame(maxWidth: .infinity, alignment: item.alignment)
        .padding(.leading, item.direction == .received ? 5 : 100)
        .padding(.trailing, item.direction == .received ? 100 : 5)
    }
    
    private func timeStampTextView() -> some View {
        HStack {
            Text("3:05 PM")
                .font(.system(size: 13))
                .foregroundStyle(.gray)
            
            if item.direction == .sent {
                Image(.seen)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 15, height: 15)
                    .foregroundStyle(Color(.systemBlue))
            }
        }
    }
}

#Preview {
    ScrollView {
        BubbleTextView(item: .sentPlaceholder)
        BubbleTextView(item: .receivedPlaceholder)
    }
    .frame(maxWidth: .infinity)
    .background(Color.gray.opacity(0.3))
}
