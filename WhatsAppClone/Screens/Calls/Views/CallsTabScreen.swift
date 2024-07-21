//
//  CallTabScreen.swift
//  WhatsAppClone
//
//  Created by Vlad on 18/7/24.
//

import SwiftUI

struct CallsTabScreen: View {
    
    // MARK: - Properties
    @State private var searcText = ""
    @State private var callHistory = CallHistory.all
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                Section {
                    CreateCallLinkSection()
                }
                
                Section {
                    ForEach(0..<120) { _ in
                        RecentCallItemView()
                    }
                } header: {
                    Text("Recent")
                        .textCase(nil)
                        .font(.headline)
                        .bold()
                        .foregroundStyle(.whatsAppBlack)
                }
            }
            .navigationTitle("Calls")
            .searchable(text: $searcText)
            .toolbar {
                leadingNavItem()
                trailingNavItem()
                principalNavItem()
            }
        }
    }
}

extension CallsTabScreen {
    
    // Phone Button
    @ToolbarContentBuilder
    private func trailingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                // Some action
            } label: {
                Image(systemName: "phone.arrow.up.right")
            }
        }
    }
    
    // Edit Button
    @ToolbarContentBuilder
    private func leadingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button("Edit") { }
        }
    }
    
    @ToolbarContentBuilder
    private func principalNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Picker("", selection: $callHistory) {
                ForEach(CallHistory.allCases) { item in
                    Text(item.rawValue.capitalized)
                        .tag(item)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 150)
        }
    }
    
    // Call History
    private enum CallHistory: String, CaseIterable, Identifiable {
        case all, missed
        
        var id: String {
            return rawValue
        }
    }
}

// Call link Area
private struct CreateCallLinkSection: View {
    var body: some View {
        HStack {
            Image(systemName: "link")
                .padding(8)
                .background(Color(.systemGray6))
                .clipShape(Circle())
                .foregroundStyle(.blue)
            
            VStack(alignment: .leading) {
                Text("Create Call Link")
                    .foregroundStyle(.blue)
                
                Text("Share a link for your WhatsApp call")
                    .foregroundStyle(.gray)
                    .font(.caption)
            }
        }
    }
}

// Date of call
private struct RecentCallItemView: View {
    var body: some View {
        HStack {
            Circle()
                .frame(width: 45, height: 45)
            
            recentCallsTextView()
            
            Spacer()
            
            Text("Yesterday")
                .foregroundStyle(.gray)
                .font(.system(size: 16))
            
            Image(systemName: "info.circle")
        }
    }
    
    // Caller
    private func recentCallsTextView() -> some View {
        VStack(alignment: .leading) {
            Text("John Smith")
            
            HStack(spacing: 5) {
                Image(systemName: "phone.arrow.up.right.fill")
                Text("Outgoing")
            }
            .font(.system(size: 14))
            .foregroundStyle(.gray)
        }
    }
}

// MARK: - Preview
#Preview {
    CallsTabScreen()
}
