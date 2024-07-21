//
//  PokemonDetailViewModel.swift
//  PokeMasters
//
//  Created by Admin on 20/07/2024.
//

import Foundation
import Alamofire
import Combine

class PokemonDetailViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var error: String?
    @Published var pokemonDetails: PokemonSpecsModel?

    private var cancellables = Set<AnyCancellable>()
    private let pokeDataSubject = PassthroughSubject<PokemonSpecsModel, Error>()
    
    //publisher for transmitting data
    var pokeDataPublisher: AnyPublisher<PokemonSpecsModel, Error> {
        return pokeDataSubject.eraseToAnyPublisher()
    }

    private let pokemonService: PokemonService

    init(pokemonService: PokemonService = PokemonService()) {
        self.pokemonService = pokemonService
    }

    // Function to fetch tube data from the API
    func fetchPokemonDetails(pokemonId: String) {
        pokemonService.fetchPokemonDetails(pokemonId: pokemonId)
            .subscribe(on: DispatchQueue.global(qos: .userInitiated)) // serial thread
            .receive(on: DispatchQueue.main) // Switch to the main thread to update UI
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.pokeDataSubject.send(completion: .failure(error))
                }
            }, receiveValue: { [weak self] pokeSpecs in
                // Sending the data back to View
                self?.pokemonDetails = pokeSpecs
            })
            .store(in: &cancellables)
    }
}
