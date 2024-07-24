//
//  MockPokemonService.swift
//  PokeMasters
//
//  Created by Admin on 24/07/2024.
//

import Foundation
import Combine

class MockPokemonService {
    var mockPublisher: AnyPublisher<PokemonResponse, Error>?
    
    func fetchPokemonLists(limit: Int, page: Int) -> AnyPublisher<PokemonResponse, Error> {
        return mockPublisher ?? Fail(error: URLError(.badServerResponse)).eraseToAnyPublisher()
    }
}
