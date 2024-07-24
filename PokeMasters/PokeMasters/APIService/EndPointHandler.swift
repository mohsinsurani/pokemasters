//
//  EndPointHandler.swift
//  PokeMasters
//
//  Created by Admin on 24/07/2024.
//
/* Purpose of this enum is to know about all the endpoints used by this app */

import Foundation
import Alamofire

enum PokeBase: URLRequestConvertible {
    static let baseURL = "https://pokeapi.co/api/v2/"

    case pokemon(pokemonId: String)
    case ability(pokemonId: String)
    case stat(pokemonId: String)
    case pokemonList(limit: Int, page: Int)

    var url: String {
        switch self {
        case .pokemon(let pokemonId):
            return "\(PokeBase.baseURL)pokemon/\(pokemonId)"
        case .ability(let pokemonId):
            return "\(PokeBase.baseURL)ability/\(pokemonId)"
        case .stat(let pokemonId):
            return "\(PokeBase.baseURL)stat/\(pokemonId)"
        case .pokemonList(let limit, let page):
            return "\(PokeBase.baseURL)pokemon?limit=\(limit)&offset=\(page * 10)"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
            guard let url = URL(string: self.url) else {
                throw AFError.invalidURL(url: self.url)
            }
            return URLRequest(url: url)
        }
}

