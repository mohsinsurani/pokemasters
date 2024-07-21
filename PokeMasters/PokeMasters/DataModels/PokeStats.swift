import Foundation

struct PokeStats: Codable {
    let id: Int
    let name: String
    let gameIndex: Int
    let isBattleOnly: Bool
    let affectingMoves: AffectingMoves?
    let affectingNatures: AffectingNatures?
    let characteristics: [Characteristic]?
    let moveDamageClass: MoveDamageClass?
    let names: [Name]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case gameIndex = "game_index"
        case isBattleOnly = "is_battle_only"
        case affectingMoves = "affecting_moves"
        case affectingNatures = "affecting_natures"
        case characteristics
        case moveDamageClass = "move_damage_class"
        case names
    }
}

struct AffectingMoves: Codable {
    let name: String?
    let increase: [AffectingMove]?
    let decrease: [AffectingMove]?
}

struct AffectingMove: Codable {
    let change: Int
    let move: NamedResource?
}

struct AffectingNatures: Codable {
    let increase: [NamedResource]?
    let decrease: [NamedResource]?
}

struct Characteristic: Codable {
    let url: String
}

struct MoveDamageClass: Codable {
    let name: String
    let url: String
}

struct Name: Codable {
    let name: String
    let language: NamedResource?
}

struct NamedResource: Codable {
    let name: String
    let url: String
}
