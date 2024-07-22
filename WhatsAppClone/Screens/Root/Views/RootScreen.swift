//
//  RootScreen.swift
//  WhatsAppClone
//
//  Created by Vlad on 22/7/24.
//

import SwiftUI

struct RootScreen: View {
    
    @StateObject private var viewModel = RootScreenModel()
    
    var body: some View {
        switch viewModel.authState {
        case .pending:
            ProgressView()
                .controlSize(.large)
            
        case .loggedIn(_):
            MainTabView()
            
        case .loggedOut:
            LoginScreen()
                .hideKeyboardOnTap()
        }
    }
}

#Preview {
    RootScreen()
}
