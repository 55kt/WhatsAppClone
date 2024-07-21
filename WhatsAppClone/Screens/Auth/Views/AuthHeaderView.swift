//
//  AuthHeaderView.swift
//  WhatsAppClone
//
//  Created by Vlad on 21/7/24.
//

import SwiftUI

struct AuthHeaderView: View {
    var body: some View {
        HStack {
            Image(.whatsapp)
                .resizable()
                .frame(width: 40, height: 40)
            
            Text("WhatsApp")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .fontWeight(.bold)
            
        }
    }
}

#Preview {
    AuthHeaderView()
}
