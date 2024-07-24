//
//  PokemonListViewModel.swift
//  PokeMasters
//
//  Created by Admin on 19/07/2024.
//
/* Purpose of this VM is to support Pokemon List for data processing */

import Foundation
import Combine
import Alamofire

class PokemonListViewModel: ObservableObject {
    @Published var pokemonList: [Pokemon] = []
    @Published var searchText: String = ""
    @Published var error: Error?
    @Published private(set) var viewState: ViewState?

    private let limit = 10
    
    private var cancellables = Set<AnyCancellable>()
    private(set) var page = 0
    private(set) var totalPages: Int?
    
    var isLoading: Bool {
        viewState == .loading
    }
    
    var isFetching: Bool {
        viewState == .fetching
    }
    
    //Initial fetching of the pokemon list, fetch - background and update in main thread
    func fetchPokemonList() {
        reset()
        viewState = .loading
        
        PokemonService().fetchPokemonLists(limit: limit, page: page)
            .subscribe(on: DispatchQueue.global(qos: .userInitiated)) // serial thread
            .receive(on: DispatchQueue.main) // Switch to the main thread to update UI
            .sink(receiveCompletion: { [weak self] completion in
                self?.viewState = .finished
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.error = error
                }
            }, receiveValue: { [weak self] response in
                // Sending the data back to View
                guard let self = self else {return}
                self.totalPages = response.count / 10
                self.pokemonList += response.results
            })
            .store(in: &cancellables)
    }
    
    //Main actor to handle the concurrent ops
    @MainActor
    func fetchNextSetOfItems() {
        
        guard page != totalPages else { return }
        
        viewState = .fetching
        
        page += 1
        
        PokemonService().fetchPokemonLists(limit: limit, page: page)
            .subscribe(on: DispatchQueue.global(qos: .background)) // serial thread
            .receive(on: DispatchQueue.main) // Switch to the main thread to update UI
            .sink(receiveCompletion: { [weak self] completion in
                self?.viewState = .finished
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.error = error
                }
            }, receiveValue: { [weak self] response in
                // Sending the data back to View
                guard let self = self else {return}
                print(response.count)
                self.pokemonList += response.results
            })
            .store(in: &cancellables)
    }
    
    // to compare if it's last pokemon item
    func hasReachedEnd(of user: Pokemon) -> Bool {
        pokemonList.last?.name == user.name
    }
    
    //search item from UI
    var filteredPokemon: [Pokemon] {
        if searchText.isEmpty {
            return pokemonList
        } else {
            return pokemonList.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    //Releasing observables
    deinit {
        cancellables.removeAll()
    }
}

extension PokemonListViewModel {
    enum ViewState {
        case fetching
        case loading
        case finished
    }
    
    //resetting to default
    func reset() {
        if viewState == .finished {
            pokemonList.removeAll()
            page = 0
            totalPages = nil
            viewState = nil
        }
    }
}
