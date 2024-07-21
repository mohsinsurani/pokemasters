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
    @State private var isNavigationBarHidden = true
    
    private let progressColor = Color.blue
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView {
                VStack {
                    if let details = viewModel.pokemonDetails {
                        VStack {
                            KFImage(URL(string: PokemonSpriteType.frontDefault(details.id).url))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                                .padding()
                            
                            Text(details.name.capitalized)
                                .font(.largeTitle)
                                .padding()
                            
                            Text("Type: \(details.types?.first?.type.name.capitalized ?? "Unknown")")
                                .font(.title2)
                            
                            Text(String(details.baseExperience ?? 0))
                                .padding()
                            
                            if let attackStat = details.stats?.first(where: { $0.stat.name == "attack" }) {
                                HStack {
                                    Text("Attack: \(attackStat.baseStat)")
                                    ProgressView(value: Double(attackStat.baseStat) / 100)
                                }
                                .padding(.horizontal)
                            }
                            
                            if let speedStat = details.stats?.first(where: { $0.stat.name == "speed" }) {
                                HStack {
                                    Text("Speed: \(speedStat.baseStat)")
                                    ProgressView(value: Double(speedStat.baseStat) / 100).progressViewStyle(RoundedRectProgressViewStyle())
                                }
                                .padding(.horizontal)
                            }
                            
                            if let defenseStat = details.stats?.first(where: { $0.stat.name == "defense" }) {
                                HStack {
                                    Text("Defense: \(defenseStat.baseStat)")
                                    ProgressView(value: Double(defenseStat.baseStat) / 100)
                                }
                                .padding(.horizontal)
                            }
                            
                            // Additional details
                            Text("Base Experience: \(details.baseExperience ?? 0)")
                                .padding(.horizontal)
                            Text("Height: \(details.height )")
                                .padding(.horizontal)
                            Text("Weight: \(details.weight ?? 0)")
                                .padding(.horizontal)
                        }
                    } else {
                        Text("Loading...")
                    }
                }
            }
            .onAppear {
                viewModel.fetchPokemonDetails(pokemonId: pokemon.name)
            }
            .navigationBarHidden(isNavigationBarHidden)
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self, value: proxy.frame(in: .named("scroll")).origin.y)
                }
                    .frame(height: 0)
            )
            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                withAnimation {
                    isNavigationBarHidden = value >= -50
                }
                    }
            
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
        .coordinateSpace(name: "scroll")
        .navigationTitle(isNavigationBarHidden ? "" : pokemon.name.capitalized)
    }
    
    // Clean up the subscription when the view disappears
    private func cleanup() {
        cancellable?.cancel()
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    typealias Value = CGFloat
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
