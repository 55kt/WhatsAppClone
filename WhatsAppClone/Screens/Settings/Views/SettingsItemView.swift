//
//  SettingsItemView.swift
//  WhatsAppClone
//
//  Created by Vlad on 19/7/24.
//

import SwiftUI

struct SettingsItemView: View {
    
    let item: SettingsItem
    
    var body: some View {
        HStack {
            iconImageView()
                .frame(width: 30, height: 30)
                .padding(3)
                .foregroundStyle(.white)
                .background(item.backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
            
            Text(item.title)
                .font(.system(size: 18))
            
            Spacer()
        }
    }
    
    @ViewBuilder
    private func iconImageView() -> some View {
        
        switch item.imageType {
        case .systemImage:
            Image(systemName: item.imageName)
                .bold()
                .font(.callout)
        case .assetImage:
            Image(item.imageName)
                .renderingMode(.template)
            .padding(3)        }
    }
}

#Preview {
    SettingsItemView(item: .broadCastLists)
}
