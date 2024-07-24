//
//  APIServiceProtocol.swift
//  PokeMasters
//
//  Created by Admin on 24/07/2024.
//
/* Purpose of this protocol is to know about all the services used by this app */

import Foundation
import Combine
import Alamofire

protocol APIServiceProtocol {
    func fetchPokemonLists(limit: Int, page: Int) -> AnyPublisher<PokemonResponse, AFError>
    func fetchPokemonDetails(pokemonId: String) -> AnyPublisher<PokemonSpecsModel, AFError>
    func fetchPokemonAbility(pokemonId: String) -> AnyPublisher<AbilityEffectModel, AFError>
    func fetchPokemonStats(pokemonId: String) -> AnyPublisher<PokeStats, AFError>
}
