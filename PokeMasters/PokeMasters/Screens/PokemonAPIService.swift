//
//  PokemonAPIService.swift
//  PokeMasters
//
//  Created by Admin on 20/07/2024.
//

import Foundation
import Combine
import Alamofire

struct PokemonService {
    private let baseURL = "https://pokeapi.co/api/v2/"
    private var cancellables = Set<AnyCancellable>()

    func fetchPokemonDetails(pokemonId: String) -> AnyPublisher<PokemonSpecsModel, AFError> {
        let url = "\(baseURL)pokemon/\(pokemonId)"
        
        return AF.request(url)
            .validate() // Ensure response status is in the 200-299 range
            .publishDecodable(type: PokemonSpecsModel.self, decoder: JSONDecoder())
            .value() // Extracts the decoded value
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchPokemonAbility(pokemonId: String) -> AnyPublisher<AbilityEffectModel, AFError> {
        let url = "\(baseURL)ability/\(pokemonId)"
        
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
        let url = "\(baseURL)stat/\(pokemonId)"
        
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

