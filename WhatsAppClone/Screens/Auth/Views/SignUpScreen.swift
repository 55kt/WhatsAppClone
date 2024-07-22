//
//  SignUpScreen.swift
//  WhatsAppClone
//
//  Created by Vlad on 22/7/24.
//

import SwiftUI

struct SignUpScreen: View {
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var authScreenModel: AuthScreenModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            AuthHeaderView()
            AuthTextField(type: .email, text: $authScreenModel.email)
            AuthTextField(type: .custom("Username", "at"), text: $authScreenModel.username)
            AuthTextField(type: .password, text: $authScreenModel.password)
            
            AuthButton(title: "Create an Account") {
                //
            }
            .disabled(authScreenModel.disableSignUpButton)
            
            Spacer()
            
            backButton()
                .padding(.bottom, 30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            LinearGradient(colors: [.green, .green.opacity(0.8), .teal], startPoint: .top, endPoint: .bottom)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
    
    private func backButton() -> some View {
        Button {
            dismiss()
        } label: {
            HStack {
                Image(systemName: "sparkles")
                
                (
                    Text("Already created an account ? ")
                    +
                    Text("Log In").bold()
                )
                
                Image(systemName: "sparkles")
            }
            .foregroundStyle(.white)
        }
    }
}

// MARK: - Preview
#Preview {
    SignUpScreen(authScreenModel: AuthScreenModel())
}
