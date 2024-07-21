//
//  AdditionalDetailsView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//

import SwiftUI

struct AdditionalDetailsView: View {
    var details: PokemonSpecsModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Base Experience: \(details.baseExperience ?? 0)")
                .padding(.horizontal)
            Text("Height: \(details.height ?? 0)")
                .padding(.horizontal)
            Text("Weight: \(details.weight ?? 0)")
                .padding(.horizontal)
            
            if let heldItems = details.heldItems, !heldItems.isEmpty {
                Text("Held Items: \(heldItems.first?.item.name ?? "")")
                    .padding(.horizontal)
            }
        }
    }
}

//
//struct AdditionalDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AdditionalDetailsView()
//    }
//}
