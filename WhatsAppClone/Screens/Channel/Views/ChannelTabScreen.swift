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
    
    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Chats")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    ChannelTabScreen()
}
