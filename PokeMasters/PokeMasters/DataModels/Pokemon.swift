//
//  Pokemon.swift
//  PokeMasters
//
//  Created by Admin on 19/07/2024.
//
/* Purpose of this data model is to bind the data coming from api */

import Foundation

struct Pokemon: Codable, Equatable, Hashable {
    let url: String
    let name: String
    
    // fetching pid based on the url's last component
    var pid: String {
        return url.components(separatedBy: "/").filter { !$0.isEmpty }.last ?? name
    }
}

struct PokemonListResponse: Codable {
    let count: Int
    let pokemon: [Pokemon]
}

