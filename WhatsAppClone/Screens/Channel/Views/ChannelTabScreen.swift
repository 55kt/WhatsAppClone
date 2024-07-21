//
//  ChannelTabScreen.swift
//  WhatsAppClone
//
//  Created by Vlad on 18/7/24.
//

import SwiftUI

struct ChannelTabScreen: View {
    
    // MARK: - Properties
    @State private var searchText = ""
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                archivedButton()
                
                ForEach(0..<12) { _ in
                    NavigationLink {
                        ChatRoomScreen()
                    } label: {
                        ChannelItemView()
                    }
                }
                inboxFooterView()
                    .listRowSeparator(.hidden)
            }
            .navigationTitle("Chats")
            .searchable(text: $searchText)
            .listStyle(.plain)
            // Navbar content
            .toolbar {
                leadingNavItems()
                trailingNavItems()
            }
        }
    }
}

extension ChannelTabScreen {
    @ToolbarContentBuilder
    private func leadingNavItems() -> some ToolbarContent {
        
        // Popup Button left side
        ToolbarItem(placement: .topBarLeading) {
            Menu {
                Button {
                    // Some action
                } label: {
                    Label("Select Chats", systemImage: "checkmark.circle")
                }
            } label: {
                Image(systemName: "ellipsis.circle")
            }
        }
    }
    
    // Nav Bar Items
    @ToolbarContentBuilder
    private func trailingNavItems() -> some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing) {
            aiButton()
            newChatButton()
            cameraButton()
        }
    }
    
    // MARK: - Buttons
    private func aiButton() -> some View {
        Button {
            // Some action
        } label: {
            Image(.circle)
        }
    }
    
    private func newChatButton() -> some View {
        Button {
            // Some action
        } label: {
            Image(.plus)
        }
    }
    
    private func cameraButton() -> some View {
        Button {
            // Some action
        } label: {
            Image(systemName: "camera")
        }
    }
    
    private func archivedButton() -> some View {
        Button {
            // Some action
        } label: {
            Label("Archived", systemImage: "archivebox.fill")
                .bold()
                .padding()
                .foregroundStyle(.gray)
        }
    }
    
    // End footer function
    private func inboxFooterView() -> some View {
        HStack {
            Image(systemName: "lock.fill")
            
            (
                Text("Your personal message are ")
                +
                Text("end-to-end encrypted")
                    .foregroundStyle(.blue)
            )
        }
        .foregroundStyle(.gray)
        .font(.caption)
        .padding(.horizontal)
    }
}

#Preview {
    ChannelTabScreen()
}
