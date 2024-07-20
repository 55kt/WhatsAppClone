//
//  ChatRoomScreen.swift
//  WhatsAppClone
//
//  Created by Vlad on 19/7/24.
//

import SwiftUI

struct ChatRoomScreen: View {
    var body: some View {
        MessageListView()
            .toolbar(.hidden, for: .tabBar)
            .toolbar {
                leadingNavItems()
                trailingNavItems()
            }
            .safeAreaInset(edge: .bottom) {
                TextInputArea()
            }
    }
}

// MARK: - Toolbar Items
extension ChatRoomScreen {
    @ToolbarContentBuilder
    private func leadingNavItems() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            HStack {
                Circle()
                    .frame(width: 35, height: 35)
                
                Text("Username Here")
                    .bold()
            }
        }
    }
    
    @ToolbarContentBuilder
    private func trailingNavItems() -> some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing) {
            Button {
                // Some action
            } label: {
                Image(systemName: "video")
            }
            
            Button {
                // Some action
            } label: {
                Image(systemName: "phone")
            }
        }
    }
    
    
}

#Preview {
    NavigationStack {
        ChatRoomScreen()
    }
}
