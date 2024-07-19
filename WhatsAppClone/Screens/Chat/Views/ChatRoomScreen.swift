//
//  ChatRoomScreen.swift
//  WhatsAppClone
//
//  Created by Vlad on 19/7/24.
//

import SwiftUI

struct ChatRoomScreen: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<12) { _ in
                    Text("Placeholde")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color.gray.opacity(0.1))
                }
            }
            .toolbar(.hidden, for: .tabBar)
            .toolbar {
                leadingNavItems()
                trailingNavItems()
            }
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
