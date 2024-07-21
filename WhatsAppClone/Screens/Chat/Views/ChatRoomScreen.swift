//
//  ChatRoomScreen.swift
//  WhatsAppClone
//
//  Created by Vlad on 19/7/24.
//

import SwiftUI

struct ChatRoomScreen: View {
    
    // MARK: - Body
    var body: some View {
        MessageListView()
            .toolbar(.hidden, for: .tabBar)
            .toolbar {
                leadingNavItems()
                trailingNavItems()
            }
            .navigationBarTitleDisplayMode(.inline)
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
                Circle()  // User Avatar
                    .frame(width: 35, height: 35)
                
                Text("Username Here")
                    .bold()
            }
        }
    }
    
    @ToolbarContentBuilder
    private func trailingNavItems() -> some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing) {
            
            // Video Button
            Button {
                // Some action
            } label: {
                Image(systemName: "video")
            }
            
            // Phone Button
            Button {
                // Some action
            } label: {
                Image(systemName: "phone")
            }
        }
    }
    
    
}

// MARK: - Preview
#Preview {
    NavigationStack {
        ChatRoomScreen()
    }
}
