//
//  PokeCell.swift
//  PokeMasters
//
//  Created by Admin on 20/07/2024.
//
/* Purpose of this Cell is to display in Pokemon list */

import SwiftUI
import Kingfisher

struct PokeCell: View {
    var pokemon: Pokemon
    var viewModel: PokemonListViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            let imgURLString = PokemonSpriteType.frontDefault(pokemon.pid).url
            
            let imgURL = URL(string: imgURLString)
            //Caching the image here using Kingfisher
            KFImage(imgURL)
                .resizable()
                .frame(width: 100, height: 100)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .accessibilityLabel("\(pokemon.name.capitalized) Pokémon image")
                .accessibilityHint("Image of \(pokemon.name.capitalized) Pokémon")
            
            //Pokemon name
            Text(pokemon.name.capitalized)
                .font(PokeFonts.smallFont)
                .padding(.top, 5)
                .accessibilityLabel("Name: \(pokemon.name.capitalized)")
                .accessibilityHint("The name of the Pokémon")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black.opacity(1.0), lineWidth: 1)
        )
    }
}


struct PokeCell_Previews: PreviewProvider {
    static var previews: some View {
        let dummyPokemon = Pokemon(url: "https://pokeapi.co/api/v2/pokemon/2/", name: "ivysaur")
        let dummyViewModel = PokemonListViewModel() // or a mock view model if needed
        
        // Return a preview of PokeCell with dummy data
        PokeCell(pokemon: dummyPokemon, viewModel: dummyViewModel)
            .previewLayout(.sizeThatFits) // Adjusts the preview to fit the view's size
            .padding()
    }
}
