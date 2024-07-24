//
//  PokemonDetailContentView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//
/* Purpose of PokemonDetailContentView is to display Pokemon Gifs and other tabs */

import SwiftUI

struct PokemonDetailContentView: View {
    var details: PokemonSpecsModel
    var ability: AbilityEffectModel
    var stats: PokeStats
    var pokemon: Pokemon
    
    @State private var selectedView: ViewType = .affectingMove
    
    var body: some View {
        VStack {
            VStack {
                PokemonImagesView(details: details, pokemon: pokemon)
                
                // Pokémon Name and Type
                VStack {
                    Text(pokemon.name.capitalized)
                        .font(PokeFonts.titleFontBold)
                        .foregroundColor(Color.black)
                        .accessibilityLabel("Name: \(pokemon.name.capitalized)")
                    
                    Text("\(details.types?.first?.type.name.capitalized ?? "Unknown")")
                        .font(PokeFonts.subtitleFont)
                        .foregroundColor(Color.gray)
                        .accessibilityLabel("Type: \(details.types?.first?.type.name.capitalized ?? "Unknown")")
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
                                    .accessibilityLabel(viewType.title)
                                    .accessibilityHint("Tap to view \(viewType.title) details")
                            }
                        }
                    }
                    .padding()
                }
                
                switch selectedView {
                case .about:
                    AboutView(details: details, pokemon: pokemon)
                        .accessibilityLabel("About \(pokemon.name.capitalized)")
                case .effects:
                    if let effectEntries = ability.effectEntries, !effectEntries.isEmpty {
                        EffectsView(effectEntries: effectEntries)
                            .accessibilityLabel("Effects for \(pokemon.name.capitalized)")
                    }
                case .stats:
                    if let stats = details.stats {
                        StatsView(stats: stats)
                            .accessibilityLabel("Stats for \(pokemon.name.capitalized)")
                    }
                case .moves:
                    if let moves = details.moves {
                        MovesView(moves: moves)
                            .accessibilityLabel("Moves for \(pokemon.name.capitalized)")
                    } else {
                        Text("No data found on moves!").font(PokeFonts.bodyFontItalic)
                            .accessibilityLabel("No data found on moves for \(pokemon.name.capitalized)")
                    }
                case .affectingMove:
                    if let affectingMoves = stats.affectingMoves, let inc = affectingMoves.increase, let dec = affectingMoves.decrease, !inc.isEmpty, !dec.isEmpty {
                        StatDetailView(affectingMoves: affectingMoves)
                            .accessibilityLabel("Affecting moves for \(pokemon.name.capitalized)")
                    } else {
                        Text("No data found on affecting moves!").font(PokeFonts.bodyFontItalic)
                            .accessibilityLabel("No data found on affecting moves for \(pokemon.name.capitalized)")
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure the inner VStack takes up full space
            .accessibilityElement(children: .combine) // Combine the inner views into one accessible element
        }
        .accessibilityElement(children: .contain) // Combine the entire view into one accessible element
    }
}


//struct PokemonDetailContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailContentView()
//    }
//}
