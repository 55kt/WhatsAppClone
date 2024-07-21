//
//  LoginScreen.swift
//  WhatsAppClone
//
//  Created by Vlad on 21/7/24.
//

import SwiftUI

struct LoginScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                AuthHeaderView()
                
                AuthTextField(type: .email, text: .constant(""))
                AuthTextField(type: .password, text: .constant(""))
                
                forgotPasswordButton()
                
                AuthButton(title: "Login") {
                    //
                }
                
                Spacer()
                
                signUpButton()
                    .padding(.bottom, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.teal.gradient)
            .ignoresSafeArea()
        }
    }
    
    private func forgotPasswordButton() -> some View {
        Button {
            // Some action
        } label: {
            Text("Forgot Password ?")
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 32)
                .bold()
                .padding(.vertical)
        }
    }
    
    private func signUpButton() -> some View {
        NavigationLink {
            Text("SIGN UP View Placeholder")
        } label: {
            HStack {
                Image(systemName: "sparkles")
                
                (
                    Text("Don`t have an account ? ")
                    +
                    Text("Create one").bold()
                )
                
                Image(systemName: "sparkles")
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    LoginScreen()
}
