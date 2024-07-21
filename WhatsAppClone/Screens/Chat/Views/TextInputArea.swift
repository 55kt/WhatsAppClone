//
//  TextInputArea.swift
//  WhatsAppClone
//
//  Created by Vlad on 19/7/24.
//

import SwiftUI

struct TextInputArea: View {
    
    // MARK: - Properties
    @State private var text = ""
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .bottom, spacing: 5) {
            imagePickerButton()
                .padding(3)
            audioRecorderButton()
            messageTextField()
            sendMessageButton()
        }
        .padding(.bottom)
        .padding(.horizontal, 8)
        .padding(.top, 10)
        .background(.whatsAppWhite)
    }
    
    // TextField Function
    private func messageTextField() -> some View {
        TextField("", text: $text, axis: .vertical)
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.thinMaterial)
            )
            .overlay(textViewBorder())
    }
    
    // Field Borders
    private func textViewBorder() -> some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke(Color(.systemGray5), lineWidth: 1)
    }
    
    // MARK: - Buttons
    private func imagePickerButton() -> some View {
        Button {
            // Some action
        } label: {
            Image(systemName: "photo.on.rectangle")
                .font(.system(size: 22))
        }
    }
    
    private func audioRecorderButton() -> some View {
        Button {
            // Some action
        } label: {
            Image(systemName: "mic.fill")
                .fontWeight(.heavy)
                .imageScale(.small)
                .foregroundStyle(.white)
                .padding(6)
                .background(.blue)
                .clipShape(Circle())
        }
    }
    
    private func sendMessageButton() -> some View {
        Button {
            // Some action
        } label: {
            Image(systemName: "arrow.up")
                .fontWeight(.heavy)
                .foregroundStyle(.white)
                .padding(6)
                .background(Color.blue)
                .clipShape(Circle())
        }
    }
}

// MARK: - Preview
#Preview {
    TextInputArea()
}
