//
//  PokemonDetailModel.swift
//  PokeMasters
//
//  Created by Admin on 20/07/2024.
//

import Foundation

// Main model representing Pokémon details
struct PokemonSpecsModel: Decodable {
    let id: Int
    let name: String
    let baseExperience: Int?
    let height: Int?
    let isDefault: Bool
    let order: Int?
    let weight: Int?
    let abilities: [Ability]?
    let gameIndices: [GameIndex]?
    let heldItems: [HeldItem]?
    let locationAreaEncounters: String?
    let moves: [Move]?
    let species: Species?
    let cries: Cries?
    let stats: [Stat]?
    let types: [TypeElement]?

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case baseExperience = "base_experience"
        case height
        case isDefault = "is_default"
        case order
        case weight
        case abilities
        case gameIndices = "game_indices"
        case heldItems = "held_items"
        case locationAreaEncounters = "location_area_encounters"
        case moves
        case species
        case cries
        case stats
        case types
    }
}

// Ability model
struct Ability: Decodable {
    let isHidden: Bool
    let slot: Int
    let ability: AbilityDetail

    private enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case slot
        case ability
    }
}

struct AbilityDetail: Decodable {
    let name: String
    let url: String
}

// GameIndex model
struct GameIndex: Decodable {
    let gameIndex: Int
    let version: Version

    private enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }
}

struct Version: Decodable {
    let name: String
    let url: String
}

// HeldItem model
struct HeldItem: Decodable {
    let item: Item
    let versionDetails: [VersionDetail]

    private enum CodingKeys: String, CodingKey {
        case item
        case versionDetails = "version_details"
    }
}

struct Item: Decodable {
    let name: String
    let url: String
}

struct VersionDetail: Decodable {
    let rarity: Int
    let version: Version
}

// Move model
struct Move: Decodable {
    let move: MoveDetail
    let versionGroupDetails: [VersionGroupDetail]

    private enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

struct MoveDetail: Decodable {
    let name: String
    let url: String
}

struct VersionGroupDetail: Decodable {
    let levelLearnedAt: Int
    let versionGroup: VersionGroup
    let moveLearnMethod: MoveLearnMethod

    private enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case versionGroup = "version_group"
        case moveLearnMethod = "move_learn_method"
    }
}

struct VersionGroup: Decodable {
    let name: String
    let url: String
}

struct MoveLearnMethod: Decodable {
    let name: String
    let url: String
}

// Species model
struct Species: Decodable {
    let name: String
    let url: String
}

// Cries model
struct Cries: Decodable {
    let latest: String
    let legacy: String
}

// Stat model
struct Stat: Decodable {
    let baseStat: Int
    let effort: Int
    let stat: StatDetail

    private enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
}

struct StatDetail: Decodable {
    let name: String
    let url: String
}

// TypeElement model
struct TypeElement: Decodable {
    let slot: Int
    let type: TypeDetail
}

struct TypeDetail: Decodable {
    let name: String
    let url: String
}
