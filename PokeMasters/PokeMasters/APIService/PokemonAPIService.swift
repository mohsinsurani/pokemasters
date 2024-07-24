//
//  PokemonAPIService.swift
//  PokeMasters
//
//  Created by Admin on 20/07/2024.

/* Purpose of this services is handling of all the services used by this app */

import Foundation
import Combine
import Alamofire

struct PokemonService: APIServiceProtocol {
    private var cancellables = Set<AnyCancellable>()

    func fetchPokemonLists(limit: Int, page: Int) -> AnyPublisher<PokemonResponse, AFError> {
        let url = PokeBase.pokemonList(limit: limit, page: page)
        
        return AF.request(url)
            .publishData()
            .tryMap { response in
                if let error = response.error {
                    throw error
                }
                return response.data ?? Data()
            }
            .decode(type: PokemonResponse.self, decoder: JSONDecoder())
            .mapError { error in
                error as? AFError ?? AFError.responseValidationFailed(reason: .customValidationFailed(error: error))
            }
            .eraseToAnyPublisher()
    }
    
    func fetchPokemonDetails(pokemonId: String) -> AnyPublisher<PokemonSpecsModel, AFError> {
        let url = PokeBase.pokemon(pokemonId: pokemonId)

        return AF.request(url)
            .publishData()
            .tryMap { response in
                if let error = response.error {
                    throw error
                }
                return response.data ?? Data()
            }
            .decode(type: PokemonSpecsModel.self, decoder: JSONDecoder())
            .mapError { error in
                error as? AFError ?? AFError.responseValidationFailed(reason: .customValidationFailed(error: error))
            }
            .eraseToAnyPublisher()
    }
    
    func fetchPokemonAbility(pokemonId: String) -> AnyPublisher<AbilityEffectModel, AFError> {
        let url = PokeBase.ability(pokemonId: pokemonId)

        return AF.request(url)
            .publishData()
            .tryMap { response in
                if let error = response.error {
                    throw error
                }
                return response.data ?? Data()
            }
            .decode(type: AbilityEffectModel.self, decoder: JSONDecoder())
            .mapError { error in
                error as? AFError ?? AFError.responseValidationFailed(reason: .customValidationFailed(error: error))
            }
            .eraseToAnyPublisher()
    }
    
    func fetchPokemonStats(pokemonId: String) -> AnyPublisher<PokeStats, AFError> {
        let url = PokeBase.stat(pokemonId: pokemonId)

        return AF.request(url)
            .publishData()
            .tryMap { response in
                if let error = response.error {
                    throw error
                }
                return response.data ?? Data()
            }
            .decode(type: PokeStats.self, decoder: JSONDecoder())
            .mapError { error in
                error as? AFError ?? AFError.responseValidationFailed(reason: .customValidationFailed(error: error))
            }
            .eraseToAnyPublisher()
    }
}

