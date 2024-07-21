//
//  PokeCell.swift
//  PokeMasters
//
//  Created by Admin on 20/07/2024.
//

import SwiftUI
import Kingfisher


struct PokeCell: View {
    var pokemon: Pokemon
    var viewModel: PokemonListViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            if let id = viewModel.getPokemonID(from: pokemon.url) {
                let imgURLString = viewModel.getPokemonImageURL(for: id)
                let imgURL = URL(string: imgURLString)
                KFImage(imgURL)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
            Text(pokemon.name.capitalized)
                .font(.caption)
                .padding(.top, 5)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
//        .buttonStyle(PlainButtonStyle())
    }
}


//struct PokeCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PokeCell()
//    }
//}
