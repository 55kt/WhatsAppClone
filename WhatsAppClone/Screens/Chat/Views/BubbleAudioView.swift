//
//  BubbleAudioView.swift
//  WhatsAppClone
//
//  Created by Vlad on 21/7/24.
//

import SwiftUI

struct BubbleAudioView: View {
    
    // MARK: - Properties
    let item: MessageItem
    @State private var sliderValue: Double = 0
    @State private var sliderRange: ClosedRange<Double> = 0...20
    
    // MARK: - Body
    var body: some View {
        // Message apperance & position
        VStack(alignment: item.horizontalAlignment, spacing: 3) {
            HStack {
                playButton()
                Slider(value: $sliderValue, in: sliderRange)
                    .tint(.gray)
                
                Text("04:23")
                    .foregroundStyle(.gray)
            }
            .padding(10)
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .padding(5)
            .background(item.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .applyTail(item.direction)
            
            timeStampTextView()

        }
        .shadow(color: Color(.systemGray3).opacity(0.1), radius: 5, x: 0, y: 20)
        .frame(maxWidth: .infinity, alignment: item.alignment)
        .padding(.leading, item.direction == .received ? 5 : 45)
        .padding(.trailing, item.direction == .received ? 45 : 5)
    }
    
    // TimeStamp Function
    private func timeStampTextView() -> some View {
        HStack {
            Text("3:05 PM")
                .font(.system(size: 13))
                .foregroundStyle(.gray)
            
            if item.direction == .sent {
                Image(.seen)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 15, height: 15)
                    .foregroundStyle(Color(.systemBlue))
            }
        }
    }
    
    // Play button function
    private func playButton() -> some View {
        Button {
            // Some action
        } label: {
            Image(systemName: "play.fill")
                .padding(10)
                .background(item.direction == .received ? .green : .white)
                .clipShape(Circle())
                .foregroundStyle(item.direction == .received ? .white : .black)
        }
    }
}

#Preview {
    ScrollView {
        BubbleAudioView(item: .sentPlaceholder)
        BubbleAudioView(item: .receivedPlaceholder)
    }
    .frame(maxWidth: .infinity)
    .padding()
    .background(Color.gray.opacity(0.4))
    .onAppear {
        let thumbImage = UIImage(systemName: "circle.fill")
        UISlider.appearance().setThumbImage(thumbImage, for: .normal)
    }
        
}
