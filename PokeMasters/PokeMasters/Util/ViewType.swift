//
//  ViewType.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//

import Foundation

enum ViewType: String, CaseIterable {
    case about, effects, stats, moves, affectingMove
    
    var title: String {
        switch self {
        case .about: return "About"
        case .effects: return "Effects"
        case .stats: return "Stats"
        case .moves: return "Moves"
        case .affectingMove: return "Affecting Moves"
        }
    }
}
