//
//  PokemonDetailContentView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//

import SwiftUI

struct PokemonDetailContentView: View {
    var details: PokemonSpecsModel
    var ability: AbilityEffectModel
    var stats: PokeStats
    @State private var selectedView: ViewType = .affectingMove
    
    var body: some View {
        VStack {
            VStack {
                PokemonImagesView(details: details)
                
                // Pokémon Name and Type
                VStack {
                    Text(details.name.capitalized)
                        .font(PokeFonts.titleFontBold)
                        .foregroundColor(Color.black)
                    
                    Text("\(details.types?.first?.type.name.capitalized ?? "Unknown")")
                        .font(PokeFonts.subtitleFont)
                        .foregroundColor(Color.gray)
                }
                .padding(.bottom, 10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(ViewType.allCases, id: \.self) { viewType in
                            Button(action: {
                                selectedView = viewType
                            }) {
                                Text(viewType.title)
                                    .font(PokeFonts.bodyFontBold)
                                    .padding()
                                    .frame(height: 40)
                                    .background(selectedView == viewType ? Color.black : Color.mint)
                                    .foregroundColor(selectedView == viewType ? Color.white : Color.black)
                                    .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20.0, style: .continuous)
                                            .stroke(selectedView == viewType ? Color.green : Color.mint, lineWidth: 2)
                                    )
                            }
                        }
                    }
                    .padding()
                }
                
                switch selectedView {
                case .about:
                    AboutView(details: details)
                case .effects:
                    if let effectEntries = ability.effectEntries, !effectEntries.isEmpty {
                        EffectsView(effectEntries: effectEntries)
                    }
                case .stats:
                    if let stats = details.stats {
                        StatsView(stats: stats)
                    }
                case .moves:
                    MovesView(moves: details.moves ?? [])
                case .affectingMove:
                    if let affectingMoves = stats.affectingMoves, let inc = affectingMoves.increase, let dec = affectingMoves.decrease, !inc.isEmpty, !dec.isEmpty {
                        StatDetailView(affectingMoves: affectingMoves)
                    }
                }
                
                //                if let baseExp = details.baseExperience {
                //                    AboutView(details: details)
                //                }
                //
                //                if let stats = details.stats {
                //                    StatsView(stats: stats)
                //                }
                //
                //                AdditionalDetailsView(details: details)
                //
                //                if let moves = details.moves, !moves.isEmpty {
                //                    MovesView(moves: moves)
                //                }
                //
                //                if let effectEntries = ability.effectEntries, !effectEntries.isEmpty {
                //                    EffectsView(effectEntries: effectEntries)
                //                }
                //
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure the inner VStack takes up full space
            //            .background(Color)
            //            .background(Color(red: 15 / 255, green: 15 / 255, blue: 15 / 255))
        }
    }
}


//struct PokemonDetailContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailContentView()
//    }
//}
