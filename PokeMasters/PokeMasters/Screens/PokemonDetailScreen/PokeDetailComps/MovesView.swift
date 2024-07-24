//
//  MovesView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//
/* Purpose of MovesView is Moves and moves names in grid */

import SwiftUI

struct MovesView: View {
    var moves: [Move]

    var body: some View {
        VStack(alignment: .leading) {
            // Moves count display
            Text("Moves: \(moves.count)")
                .font(PokeFonts.titleFont)
                .padding(.bottom, 5)
                .accessibilityLabel("Total Moves")
                .accessibilityValue("\(moves.count) moves available")

            // Use LazyVGrid with adaptive grid items to display all the moves
            LazyVGrid(
                columns: [GridItem(.adaptive(minimum: 80))], // Adaptive grid with a minimum item width
                spacing: 10
            ) {
                ForEach(moves, id: \.move.name) { move in
                    Text(move.move.name.capitalized)
                        .font(PokeFonts.bodyFont)
                        .padding()
                        .background(Color.orange.opacity(1.0))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .accessibilityElement()
                        .accessibilityLabel("Move Name")
                        .accessibilityValue(move.move.name.capitalized)
                        .accessibilityHint("Double tap to select this move.")
                    
                }
            }
            .padding(.horizontal)
        }
        .padding()
        .accessibilityElement(children: .combine)
    }
}

struct MovesView_Previews: PreviewProvider {
    static var previews: some View {
        MovesView(moves: DummyData.dummyPokemonSpecs.moves!)
    }
}
