//
//  PokemonImagesView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//
/* Purpose of PokemonImagesView is to display Pokemon Gifs and pokemon name and type */

import SwiftUI
import Kingfisher

struct PokemonImagesView: View {
    var details: PokemonSpecsModel
    var pokemon: Pokemon

    var body: some View {
        HStack {
            let height: CGFloat = 120
            // Front Shiny Image
            KFAnimatedImage(URL(string: PokemonSpriteType.frontShiny(pokemon.pid).gifUrl))
                .frame(width: height, height: height)
                .brightness(0.1) // Adjust brightness
                .shadow(color: Color(.green).opacity(0.2), radius: 20, x: 0, y: 5) // Add shadow
                .padding()
                .accessibilityLabel("Shiny front image of \(pokemon.name.capitalized)")
                .accessibilityHint("Displays the shiny front sprite of the Pokémon")
            
            KFAnimatedImage(URL(string: PokemonSpriteType.frontDefault(pokemon.pid).gifUrl))
                .frame(width: height, height: height)
                .brightness(0.1) // Adjust brightness
                .shadow(color: Color(.blue).opacity(0.4), radius: 20, x: 0, y: 5) // Add shadow
                .padding()
                .accessibilityLabel("Default front image of \(pokemon.name.capitalized)")
                .accessibilityHint("Displays the default front sprite of the Pokémon")
        }
        .frame(maxWidth: .infinity) // Center the content horizontally
        .padding(.horizontal, 20) // Apply horizontal padding
        .background(Color.clear) // Transparent background
        .cornerRadius(10)
        .shadow(radius: 10)
        .accessibilityElement(children: .combine) // Combine images into one accessible element
    }
}


//
//struct PokemonImagesView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonImagesView()
//    }
//}
