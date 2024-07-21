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
                .frame(width: 250, height: 28)
                .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9)) // Light gray background
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.black, lineWidth: 2) // Black border
                )
            
            RoundedRectangle(cornerRadius: 14)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 250, height: 28)
                .foregroundColor(Color(red: 1.0, green: 0.8, blue: 0.0)) // Yellow progress bar
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.black, lineWidth: 2) // Black border
                )
        }
        .padding()
    }
}

struct RoundProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView("Loading…", value: 34, total: 100)
            .progressViewStyle(RoundedRectProgressViewStyle())
    }
}
