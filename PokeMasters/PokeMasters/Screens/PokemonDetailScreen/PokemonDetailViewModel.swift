//
//  PokemonDetailViewModel.swift
//  PokeMasters
//
//  Created by Admin on 20/07/2024.
//
// Purpose: This viewModel will do all the data related work for PokeMonDetailScreen

import Foundation
import Alamofire
import Combine

class PokemonDetailViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var error: PokeError?
    @Published var pokemonDetails: PokemonSpecsModel?
    @Published var pokAbilities: AbilityEffectModel?
    @Published var pokStats: PokeStats?
    
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
    
    // Function to fetch pokemon data from the 3 APIs (fetchPokemonStats fails for many pokemon)
    func fetchPokemonDetails(pokemonId: String) {
        let detailsPublisher = pokemonService.fetchPokemonDetails(pokemonId: pokemonId)
        let abilitiesPublisher = pokemonService.fetchPokemonAbility(pokemonId: pokemonId)
        let pokeStatsPublisher = pokemonService.fetchPokemonStats(pokemonId: pokemonId)
        
        Publishers.CombineLatest3(detailsPublisher, abilitiesPublisher, pokeStatsPublisher)
            .subscribe(on: DispatchQueue.global(qos: .userInitiated)) // serial thread
            .receive(on: DispatchQueue.main) // Switch to the main thread to update UI
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.error = PokeError(message: error.localizedDescription)
                }
            }, receiveValue: { [weak self] (details, abilitiesData, pokeStats) in
                // Sending the data back to View
                self?.pokemonDetails = details
                self?.pokAbilities = abilitiesData
                self?.pokStats = pokeStats
            })
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.removeAll()
    }
}

struct PokeError: Identifiable {
    var id = UUID()
    var message: String
}
