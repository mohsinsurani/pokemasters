//
//  StatDetailView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//
/* Purpose of StatDetailView is to AffectingMoves with +ve nad -ve effects for the pokemon */

import SwiftUI

struct StatDetailView: View {
    var affectingMoves: AffectingMoves
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Top Affecting Moves \(affectingMoves.name ?? "")")
                    .font(PokeFonts.subtitleFontBold)
                    .padding(.bottom, 8)
                    .accessibilityLabel("Top Affecting Moves")
                    .accessibilityValue(affectingMoves.name ?? "Unknown")
                    .accessibilityHint("Displays the top affecting moves for this stat.")
                
                
                if let increase = affectingMoves.increase, !increase.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Increase moves")
                            .font(PokeFonts.subtitleFontItalic)
                            .padding(.bottom, 4)
                            .accessibilityLabel("Increase Moves Header")
                            .accessibilityHint("Lists moves that increase the stat.")
                        
                        
                        let topIncreaseMoves = increase.sorted(by: { $0.change > $1.change })
                        
                        // displaying Top impact moves with stages
                        LazyVStack {
                            ForEach(topIncreaseMoves.indices, id: \.self) { index in
                                let increaseMove = topIncreaseMoves[index]
                                HStack {
                                    Text(increaseMove.move?.name.capitalized ?? "")
                                        .font(PokeFonts.bodyFont)
                                        .accessibilityLabel("Increase Move")
                                        .accessibilityValue(increaseMove.move?.name.capitalized ?? "Unknown")
                                        .accessibilityHint("Move that increases the stat by \(increaseMove.change) stages.")
                                    
                                    Spacer()
                                    Text("+\(increaseMove.change) stages")
                                        .font(PokeFonts.bodyFont)
                                        .foregroundColor(.green)
                                        .accessibilityLabel("Increase Amount")
                                        .accessibilityValue("+\(increaseMove.change) stages")
                                    
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                    .padding(.bottom, 8)
                }
                
                // displaying Top impact decrease moves with reducing stages
                if let decrease = affectingMoves.decrease, !decrease.isEmpty {
                    let topDecMoves = decrease.sorted(by: { $0.change < $1.change })
                    
                    VStack(alignment: .leading) {
                        Text("Decrease moves")
                            .font(PokeFonts.subtitleFontItalic)
                            .padding(.bottom, 4)
                            .accessibilityLabel("Decrease Moves Header")
                            .accessibilityHint("Lists moves that decrease the stat.")
                        
                        
                        LazyVStack {
                            ForEach(topDecMoves.indices, id: \.self) { index in
                                let decreaseMove = topDecMoves[index]
                                HStack {
                                    Text(decreaseMove.move?.name.capitalized ?? "")
                                        .font(PokeFonts.bodyFont)
                                        .accessibilityLabel("Decrease Move")
                                        .accessibilityValue(decreaseMove.move?.name.capitalized ?? "Unknown")
                                        .accessibilityHint("Move that decreases the stat by \(decreaseMove.change) stages.")
                                    
                                    Spacer()
                                    Text("\(decreaseMove.change) stages")
                                        .font(PokeFonts.bodyFont)
                                        .foregroundColor(.red)
                                        .accessibilityLabel("Decrease Amount")
                                        .accessibilityValue("\(decreaseMove.change) stages")
                                    
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}


struct StatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StatDetailView(affectingMoves: DummyData.dummyPokeStats.affectingMoves!)
    }
}
