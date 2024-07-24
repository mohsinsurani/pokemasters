//
//  PokeMoneListScreen.swift
//  PokeMasters
//
//  Created by Admin on 19/07/2024.
//
/* Purpose of PokeMoneListScreen is to display list of Pokemon */

import SwiftUI

struct PokeMoneListScreen: View {
    @StateObject private var viewModel = PokemonListViewModel()
    @State private var searchText = ""
    @State var shouldPresentContactMainView = false
    @State private var selectedPokemon: Pokemon? = nil
    @State private var readyToNavigate : Bool = false

    //filtering based on search
    var filteredPokemon: [Pokemon] {
        if searchText.isEmpty {
            return viewModel.pokemonList
        } else {
            return viewModel.pokemonList.filter { $0.name.contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(filteredPokemon, id: \.name) { pokemon in
                        Button(action: {
                            readyToNavigate = true
                            selectedPokemon = pokemon
                        }) {
                            PokeCell(pokemon: pokemon, viewModel: viewModel)
                                .accessibilityLabel("\(pokemon.name.capitalized) Pokémon")
                                .accessibilityHint("Select to view details about \(pokemon.name.capitalized).")
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        .task {
                            if viewModel.hasReachedEnd(of: pokemon) && !viewModel.isFetching {
                                viewModel.fetchNextSetOfItems()
                            }
                        }
                    }
                }
                .padding()
            }
            .refreshable {
                viewModel.fetchPokemonList()
            }
            .overlay(alignment: .bottom) {
                if viewModel.isFetching {
                    ProgressView()
                        .accessibilityLabel("Loading more Pokémon")
                        .accessibilityHint("Fetching additional Pokémon. Please wait.")
                    
                }
            }
            .navigationTitleView {
                Text("Pokémon List")
                    .font(PokeFonts.titleFontBold)
                    .accessibilityLabel("Pokémon List")
                    .accessibilityHint("Displays a list of Pokémon. Swipe down to refresh.")
                
            }
            .searchable(text: $searchText, prompt: "Search Pokémon").font(PokeFonts.bodyFont)
            .accessibilityLabel("Search Pokémon")
            .accessibilityHint("Type to search for Pokémon.")
            .navigationDestination(isPresented: $readyToNavigate) {
                if let selPok = selectedPokemon {
                    PokemonDetailScreen(pokemon: selPok)
                        .accessibilityLabel("Details for \(selPok.name.capitalized)")
                        .accessibilityHint("Displays detailed information about \(selPok.name.capitalized).")
                    
                }
            }
        }.onChange(of: readyToNavigate) { newValue in
            if !newValue {
                selectedPokemon = nil
            }
        }.onAppear {
            //fetch data on appear
            viewModel.fetchPokemonList()
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
