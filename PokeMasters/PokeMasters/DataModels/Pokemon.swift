//
//  Pokemon.swift
//  PokeMasters
//
//  Created by Admin on 19/07/2024.
//

import Foundation

struct Pokemon: Codable, Equatable, Hashable {
    let url: String
    let name: String
    
    var pid: String {
        return url.components(separatedBy: "/").filter { !$0.isEmpty }.last ?? name
    }
}

