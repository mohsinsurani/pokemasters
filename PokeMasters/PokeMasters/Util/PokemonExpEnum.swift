//
//  PokemonBaseExp.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//
/* Purpose of this enum is to fetch base experience based on integer value of base experience */

import Foundation

// define Experience enum
enum PokemonExpEnum {
    case high
    case moderate
    case low

    var detail: String {
        switch self {
        case .high:
            return "High Base Experience: Legendary and fully evolved Pokémon."
        case .moderate:
            return "Moderate Base Experience: Mid-stage evolutions and some strong basic Pokémon."
        case .low:
            return "Low Base Experience: Basic and early-stage Pokémon."
        }
    }

    // assign Experience based on integer
    static func experienceDetail(for value: Int) -> String {
        switch value {
        case 200...Int.max:
            return PokemonExpEnum.high.detail
        case 100..<200:
            return PokemonExpEnum.moderate.detail
        case 0..<100:
            return PokemonExpEnum.low.detail
        default:
            return "Unknown Base Experience"
        }
    }
}

// Example usage:
//let experienceValue = 150
//let detail = PokemonExpEnum.experienceDetail(for: experienceValue)
//print(detail) // Output: High or Moderate Base Experience: This range includes both high and moderate experience Pokémon.
