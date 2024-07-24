//
//  AdditionalDetailsView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//
/* Purpose of AdditionalDetailsView is Held items, base exp, height and weight */

import SwiftUI

struct AdditionalDetailsView: View {
    var details: PokemonSpecsModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Base Experience: \(details.baseExperience ?? 0)")
                .padding(.horizontal)
                .accessibilityLabel("Base Experience")
                .accessibilityValue("\(details.baseExperience ?? 0)")
            Text("Height: \(details.height ?? 0)")
                .padding(.horizontal)
                .accessibilityLabel("Height")
                .accessibilityValue("\(details.height ?? 0)")
            Text("Weight: \(details.weight ?? 0)")
                .padding(.horizontal)
                .accessibilityLabel("Weight")
                .accessibilityValue("\(details.weight ?? 0)")
            
            if let heldItems = details.heldItems, !heldItems.isEmpty {
                Text("Held Items: \(heldItems.first?.item.name ?? "")")
                    .padding(.horizontal)
                    .accessibilityLabel("Held Items")
                    .accessibilityValue(heldItems.first?.item.name ?? "None")
                    .accessibilityHint("Displays the first held item if available.")
                
            }
        }    .accessibilityElement(children: .combine) // Combine all text elements into one accessibility element
    }
}

//
//struct AdditionalDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AdditionalDetailsView()
//    }
//}
