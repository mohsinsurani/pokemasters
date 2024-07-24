//
//  StatsView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//
/* Purpose of StatsView is to display Stats */

import SwiftUI

struct StatsView: View {
    var stats: [Stat]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(stats, id: \.stat.name) { stat in
                StatView(stat: stat)
            }
        }
        .padding(.horizontal).padding(.bottom)
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(stats: DummyData.dummyPokemonSpecs.stats!)
    }
}
