//
//  AuthTextField.swift
//  WhatsAppClone
//
//  Created by Vlad on 21/7/24.
//

import SwiftUI

struct AuthTextField: View {
    // MARK: - Properties
    let type: InputType
    @Binding var text: String
    @State private var isSecure: Bool = true
    var autocapitalization: TextInputAutocapitalization = .sentences
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: type.imageName)
                .fontWeight(.semibold)
                .frame(width: 30)
            
            switch type {
            case .password:
                SecureField(type.placeholder, text: $text)
                    .textInputAutocapitalization(autocapitalization)
                    
            default:
                TextField(type.placeholder, text: $text)
                    .textInputAutocapitalization(autocapitalization)
                    .keyboardType(type.keyboardType)
            }
        }
        .foregroundStyle(.white)
        .padding()
        .background(Color.white.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.horizontal, 32)
    }
}

// Input Area
extension AuthTextField {
    
    // MARK: - Properties
    enum InputType {
        case email
        case password
        case custom(_ plaseholder: String, _ iconName: String)
        
        var placeholder: String {
            switch self {
            case .email:
                return "Email"
            case .password:
                return "password"
            case .custom(let placeholder, _):
                return placeholder
            }
        }
        
        // Image
        var imageName: String {
            switch self {
            case .email:
                return "envelope"
            case .password:
                return "lock"
            case .custom(_, let iconName):
                return iconName
            }
        }
        
        var keyboardType: UIKeyboardType {
            switch self {
            case .email:
                return .emailAddress
            default:
                return .default
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ZStack {
        Color.teal
        VStack {
            AuthTextField(type: .email, text: .constant(""))
            AuthTextField(type: .password, text: .constant(""))
            AuthTextField(type: .custom("BirthDay", "birthday.cake"), text: .constant(""))
        }
    }
}
