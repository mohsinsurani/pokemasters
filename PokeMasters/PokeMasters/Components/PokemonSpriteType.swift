//
//  PokemonSprites.swift
//  PokeMasters
//
//  Created by Admin on 20/07/2024.
//

import Foundation

enum PokemonSpriteType {
    case backDefault(Int)
    case backShiny(Int)
    case frontDefault(Int)
    case frontShiny(Int)
    
    var url: String {
        let defUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
        switch self {
        case .backDefault(let id):
            return "\(defUrl)back/\(id).png"
        case .backShiny(let id):
            return "\(defUrl)back/shiny/\(id).png"
        case .frontDefault(let id):
            return "\(defUrl)\(id).png"
        case .frontShiny(let id):
            return "\(defUrl)shiny/\(id).png"
        }
    }
}
