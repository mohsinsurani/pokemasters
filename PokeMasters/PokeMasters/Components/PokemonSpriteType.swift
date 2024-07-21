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
        let imgType = ".png"
        switch self {
        case .backDefault(let id):
            return "\(defUrl)back/\(id)\(imgType)"
        case .backShiny(let id):
            return "\(defUrl)back/shiny/\(id)\(imgType)"
        case .frontDefault(let id):
            return "\(defUrl)\(id)\(imgType)"
        case .frontShiny(let id):
            return "\(defUrl)shiny/\(id)\(imgType)"
        }
    }
    
    var gifUrl: String {
        let defUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/"
        switch self {
        case .backDefault(let id):
            return "\(defUrl)back/\(id).gif"
        case .backShiny(let id):
            return "\(defUrl)back/shiny/\(id).gif"
        case .frontDefault(let id):
            return "\(defUrl)\(id).gif"
        case .frontShiny(let id):
            return "\(defUrl)shiny/\(id).gif"
        }
    }
}
