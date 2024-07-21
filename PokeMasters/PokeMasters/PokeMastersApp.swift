//
//  PokeMastersApp.swift
//  PokeMasters
//
//  Created by Admin on 19/07/2024.
//

import SwiftUI

@main
struct PokeMastersApp: App {
    var body: some Scene {
        WindowGroup {
            let pokemon = Pokemon(url: "https://pokeapi.co/api/v2/pokemon/2/", name: "ivysaur")
            PokemonDetailScreen(pokemon: pokemon)
        }
    }
}
