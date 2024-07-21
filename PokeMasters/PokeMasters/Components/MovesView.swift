//
//  MovesView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//

import SwiftUI

struct MovesView: View {
    var moves: [Move]

    var body: some View {
        VStack(alignment: .leading) {
            // Optional header
            Text("Moves:")
                .font(PokeFonts.titleFont)
                .padding(.bottom, 5)

            // Use LazyVGrid with adaptive grid items
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
                }
            }
            .padding(.horizontal)
        }
        .padding()
    }
}



//struct MovesView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        MovesView()
    //    }
    //}
