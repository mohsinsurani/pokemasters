//
//  PokeMoneListScreen.swift
//  PokeMasters
//
//  Created by Admin on 19/07/2024.
//

import SwiftUI

struct PokeMoneListScreen: View {
    @StateObject private var viewModel = PokemonListViewModel()
    @State private var searchText = ""
    @State var shouldPresentContactMainView = false
    @State private var selectedPokemon: Pokemon? = nil

    var filteredPokemon: [Pokemon] {
        if searchText.isEmpty {
            return viewModel.pokemonList
        } else {
            return viewModel.pokemonList.filter { $0.name.contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(filteredPokemon, id: \.name) { pokemon in
                        Button(action: {
                            selectedPokemon = pokemon
                        }) {
                            PokeCell(pokemon: pokemon, viewModel: viewModel)
                        }
                        .buttonStyle(PlainButtonStyle()) // Removes button styling
                        .background(
                            NavigationLink(
                                destination: PokemonDetailScreen(pokemon: selectedPokemon ?? pokemon),
                                isActive: Binding(
                                    get: { selectedPokemon == pokemon },
                                    set: { isActive in if !isActive { selectedPokemon = nil } }
                                ),
                                label: {Text("Navigate Link")}
                            )
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("Pokémon List")
            .searchable(text: $searchText, prompt: "Search Pokémon")
        }
    }
    
    struct SearchBar: UIViewRepresentable {
        @Binding var text: String
        
        class Coordinator: NSObject, UISearchBarDelegate {
            @Binding var text: String
            
            init(text: Binding<String>) {
                _text = text
            }
            
            func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
                text = searchText
            }
        }
        
        func makeCoordinator() -> Coordinator {
            return Coordinator(text: $text)
        }
        
        func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
            let searchBar = UISearchBar(frame: .zero)
            searchBar.delegate = context.coordinator
            return searchBar
        }
        
        func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
            uiView.text = text
        }
    }
    
    struct PokeMoneListScreen_Previews: PreviewProvider {
        static var previews: some View {
            PokeMoneListScreen()
        }
    }
}
