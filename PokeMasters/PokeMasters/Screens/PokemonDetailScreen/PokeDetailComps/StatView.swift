//
//  StatView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//
/* Purpose of StatView is to display Stats */

import SwiftUI

struct StatView: View {
    var stat: Stat

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(stat.stat.name.capitalized)
                    .font(PokeFonts.bodyFont)
                    .foregroundColor(.black)
                    .accessibilityLabel("\(stat.stat.name.capitalized) stat name")
                Spacer()
                Text("\(stat.baseStat)")
                    .font(PokeFonts.bodyFont)
                    .foregroundColor(.black)
                    .accessibilityLabel("\(stat.stat.name.capitalized) stat value")
                    .accessibilityValue("\(stat.baseStat)")
                    .accessibilityHint("This is the base value of the stat.")
            }
            ProgressView(value: Double(stat.baseStat) / 200)
                .progressViewStyle(RoundedRectProgressViewStyle())
                .accessibilityLabel("Progress for \(stat.stat.name.capitalized) stat")
                .accessibilityValue("\(stat.baseStat) out of 200")
                .accessibilityHint("Shows how close the stat is to its maximum value.")
        }
    }
}


struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(stat: Stat(baseStat: 0, effort: 0, stat: StatDetail(name: "df", url: "dfdf")))
    }
}
