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
    private let baseURL = "https://pokeapi.co/api/v2/pokemon/"
    private var cancellables = Set<AnyCancellable>()

    func fetchPokemonDetails(pokemonId: String) -> AnyPublisher<PokemonSpecsModel, AFError> {
        let url = "\(baseURL)\(pokemonId)"
        
        return AF.request(url)
            .validate() // Ensure response status is in the 200-299 range
            .publishDecodable(type: PokemonSpecsModel.self, decoder: JSONDecoder())
            .value() // Extracts the decoded value
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

