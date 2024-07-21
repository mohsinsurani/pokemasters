//
//  AbilityEffectModel.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//

import Foundation

struct AbilityEffectModel: Codable {
    let effectEntries: [EffectEntry]
    
    enum CodingKeys: String, CodingKey {
        case effectEntries = "effect_entries"
    }
}

struct EffectEntry: Codable {
    let effect: String
    let shortEffect: String
    let language: NamedResource
    
    enum CodingKeys: String, CodingKey {
        case effect
        case shortEffect = "short_effect"
        case language
    }
}
