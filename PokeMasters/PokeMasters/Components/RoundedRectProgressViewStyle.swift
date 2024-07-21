//
//  RoundProgressView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//

import SwiftUI
struct RoundedRectProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 14)
                .frame(height: 28)
                .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9)) // Light gray background
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.gray, lineWidth: 1) // Gray border
                )
            
            RoundedRectangle(cornerRadius: 14)
                .frame(width: (configuration.fractionCompleted ?? 0) * 250, height: 28)
                .foregroundColor(Color.orange.opacity(1.0)) // Yellow progress bar
                .animation(.linear, value: configuration.fractionCompleted) // Smooth animation
        }
        .padding(.vertical, 4)
    }
}


struct RoundProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView("Loading…", value: 34, total: 100)
            .progressViewStyle(RoundedRectProgressViewStyle())
    }
}
