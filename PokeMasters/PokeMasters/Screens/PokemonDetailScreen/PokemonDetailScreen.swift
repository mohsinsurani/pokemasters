//
//  PokemonDetailScreen.swift
//  PokeMasters
//
//  Created by Admin on 20/07/2024.
//
/* Purpose of PokemonDetailScreen is to display various features and statistics of the selected pokemon */

import SwiftUI
import Combine
import Kingfisher

struct PokemonDetailScreen: View {
    var pokemon: Pokemon
    @ObservedObject private var viewModel = PokemonDetailViewModel()
    @State private var errorMessage: String?
    @State private var isRefreshing = false
    @Environment(\.presentationMode) var presentationMode
    @State private var isNavigationBarHidden = false // Set default to false
        
    var body: some View {
        ZStack {
            ScrollView {
                ZStack {
                    if let details = viewModel.pokemonDetails,
                       let ability = viewModel.pokAbilities,
                       let pokStats = viewModel.pokStats {
                        PokemonDetailContentView(details: details, ability: ability, stats: pokStats, pokemon: pokemon)
                            .accessibilityLabel("Pokémon details for \(pokemon.name.capitalized)")
                            .accessibilityHint("Displays detailed information about \(pokemon.name.capitalized).")
                        
                    }
                }
            }
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self, value: proxy.frame(in: .named("scroll")).origin.y)
                }
                    .frame(height: 0)
            )
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                withAnimation {
                    isNavigationBarHidden = value < -50
                }
            }
            .onAppear {
                viewModel.fetchPokemonDetails(pokemonId: pokemon.pid)
            }
            .coordinateSpace(name: "scroll")
            
            // Custom back button
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .padding()
                            .background(Color.white)
                            .foregroundColor(Color.black)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                    .accessibilityLabel("Back")
                    .accessibilityHint("Returns to the previous screen")
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
        .background(
            viewModel.pokemonDetails == nil ? AnyView(
                VStack {
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.orange))
                        .padding()
                        .accessibilityLabel("Loading Pokémon details")
                        .accessibilityHint("Fetching details for \(pokemon.name.capitalized). Please wait.")
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            ) : AnyView(EmptyView())
        )
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .alert(item: $viewModel.error) { error in
            Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")) {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

// Example implementation of ScrollOffsetPreferenceKey
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct PokemonDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        let demoModel = Pokemon(url: "http://www.dummy.com", name: "abc")
        PokemonDetailScreen(pokemon: demoModel)
    }
}
