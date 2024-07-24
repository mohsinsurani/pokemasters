//
//  AboutView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//
/* Purpose of AboutView is to display details for the pokemon */

import SwiftUI

struct AboutView: View {
    var details: PokemonSpecsModel
    var pokemon: Pokemon

    var body: some View {
        SingleAxisGeometryReader { width in
            VStack {
                // Base Experience
                if let baseExp = details.baseExperience {
                    let description = PokemonExpEnum.experienceDetail(for: baseExp)
                    let baseExperienceText = "Base Experience of \(pokemon.name.capitalized) is \(baseExp)"
                    let baseText = "\(baseExperienceText)\n\(description)"

                    // displaying Base experience
                    Text(baseText)
                        .font(PokeFonts.bodyFont)
                        .foregroundColor(Color.black)
                        .padding()
                        .frame(width: max(0, width - 30)) // Set fixed width
                        .background(Color.orange.opacity(1.0))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .accessibilityLabel("Base Experience")
                        .accessibilityValue(baseExperienceText)
                        .accessibilityHint("Describes the base experience and additional details of the Pokémon.")
                }

                // Height and Weight
                if let height = details.height, let weight = details.weight {
                    let heightText = "Height: \(height) decimetres"
                    let weightText = "Weight: \(weight) hectograms"
                    let physicalStatsText = "\(weightText)\n\(heightText)"

                    // displaying height and weight
                    Text(physicalStatsText)
                        .frame(width: max(0, width - 60)) // Set fixed width
                        .font(PokeFonts.bodyFont)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color.orange.opacity(1.0))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .accessibilityLabel("Physical Stats")
                        .accessibilityValue("\(weightText), \(heightText)")
                        .accessibilityHint("Displays the weight and height of the Pokémon.")
                }

                // Held Items
                if let heldItems = details.heldItems, !heldItems.isEmpty {
                    let heldItemsList = heldItems.map { $0.item.name }.joined(separator: ", ")
                    let heldItemsText = "Total held items are \(heldItemsList)"

                    Text(heldItemsText)
                        .frame(width: max(0, width - 60)) // Set fixed width
                        .font(PokeFonts.bodyFont)
                        .foregroundColor(Color.black)
                        .padding()
                        .background(Color.orange.opacity(1.0))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .accessibilityLabel("Held Items")
                        .accessibilityValue(heldItemsList)
                        .accessibilityHint("Lists all held items for the Pokémon.")
                }
            }
        }
    }
}


struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView(details: DummyData.dummyPokemonSpecs, pokemon: DummyData.dummypokemon)
    }
}

struct SingleAxisGeometryReader<Content: View>: View {
    private struct SizeKey: PreferenceKey {
        static var defaultValue: CGFloat { 10 }
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = max(value, nextValue())
        }
    }
    
    @State private var size: CGFloat = SizeKey.defaultValue
    var axis: Axis = .horizontal
    var alignment: Alignment = .center
    let content: (CGFloat)->Content
    
    var body: some View {
        content(size)
            .frame(maxWidth:  axis == .horizontal ? .infinity : nil,
                   maxHeight: axis == .vertical   ? .infinity : nil,
                   alignment: alignment)
            .background(GeometryReader {
                proxy in
                Color.clear.preference(key: SizeKey.self, value: axis == .horizontal ? proxy.size.width : proxy.size.height)
            }).onPreferenceChange(SizeKey.self) { size = $0 }
    }
}
