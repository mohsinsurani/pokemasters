//
//  PokemonDetailScreen.swift
//  PokeMasters
//
//  Created by Admin on 20/07/2024.
//

import SwiftUI
import Combine
import Kingfisher

struct PokemonDetailScreen: View {
    var pokemon: Pokemon
    @ObservedObject private var viewModel = PokemonDetailViewModel()
    @State private var errorMessage: String?
    @State private var isRefreshing = false
    @State private var cancellable: AnyCancellable?
    @Environment(\.presentationMode) var presentationMode
    @State private var isNavigationBarHidden = false // Set default to false
    
    private let progressColor = Color.blue
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView {
                VStack {
                    if let details = viewModel.pokemonDetails,
                       let ability = viewModel.pokAbilities,
                       let pokStats = viewModel.pokStats {
                        PokemonDetailContentView(details: details, ability: ability, stats: pokStats)
                    } else {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            .padding()
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
                // Toggle the navigation bar visibility based on scroll offset
                withAnimation {
                    isNavigationBarHidden = value < -50
                }
            }
            .onAppear {
                viewModel.fetchPokemonDetails(pokemonId: pokemon.pid)
            }
            .coordinateSpace(name: "scroll")
            
            // Custom back button
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(radius: 5)
            }
            .padding()
        }
        .navigationTitle("") // Clear title when hidden
        .navigationBarHidden(isNavigationBarHidden) // Control the navigation bar visibility
    }
    
    // Clean up the subscription when the view disappears
    private func cleanup() {
        cancellable?.cancel()
    }
}

// Example implementation of ScrollOffsetPreferenceKey
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


//struct ScrollOffsetPreferenceKey: PreferenceKey {
//    typealias Value = CGFloat
//    static var defaultValue: CGFloat = 0
//    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
//        value = nextValue()
//    }
//}


struct PokemonDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        let demoModel = Pokemon(url: "http://www.dummy.com", name: "abc")
        PokemonDetailScreen(pokemon: demoModel)
    }
}
