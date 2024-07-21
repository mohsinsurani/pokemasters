//
//  StatView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//

import SwiftUI

struct StatView: View {
    var stat: Stat

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(stat.stat.name.capitalized)
                    .font(PokeFonts.bodyFont)
                    .foregroundColor(.gray)
                Spacer()
                Text("\(stat.baseStat)")
                    .font(PokeFonts.bodyFont)
                    .foregroundColor(.gray)
            }
            ProgressView(value: Double(stat.baseStat) / 200)
                .progressViewStyle(RoundedRectProgressViewStyle())
//                .padding(.horizontal)
        }
    }
}


struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(stat: Stat(baseStat: 0, effort: 0, stat: StatDetail(name: "df", url: "dfdf")))
    }
}
