//
//  PokemonListViewModel.swift
//  PokeMasters
//
//  Created by Admin on 19/07/2024.
//

import Foundation
import Combine
import Alamofire

class PokemonListViewModel: ObservableObject {
    @Published var pokemonList: [Pokemon] = []
    @Published var searchText: String = ""
    
    let url = "https://pokeapi.co/api/v2/pokemon?limit=10"
    let spriteBaseURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchPokemonList()
    }
    
    func fetchPokemonList() {
        
        AF.request(url)
            .publishData()
            .map { response -> Data in
                if let error = response.error {
                    print("Error: \(error)")
                }
                return response.data ?? Data()
            }
            .decode(type: PokemonResponse.self, decoder: JSONDecoder())
            .map { response -> [Pokemon] in
                print("Decoded Response: \(response)")
                return response.results
            }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] pokemons in
                print("Pokemons: \(pokemons)")
                self?.pokemonList = pokemons
            })
            .store(in: &cancellables)
    }
    
    func getPokemonImageURL(for id: Int) -> String {
        return "\(spriteBaseURL)/\(id).png"
    }
    
    func getPokemonID(from url: String) -> Int? {
        guard let id = url.split(separator: "/").last.flatMap({ Int($0) }) else { return nil }
        return id
    }
    
    
    var filteredPokemon: [Pokemon] {
        if searchText.isEmpty {
            return pokemonList
        } else {
            return pokemonList.filter { $0.name.contains(searchText.lowercased()) }
        }
    }
}

struct PokemonResponse: Codable {
    let results: [Pokemon]
}
