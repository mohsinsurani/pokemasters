//
//  PokemonImagesView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//

import SwiftUI
import Kingfisher

struct PokemonImagesView: View {
    var details: PokemonSpecsModel

    var body: some View {
        HStack {
            let height: CGFloat = 120
            let shinyImgURL = PokemonSpriteType.frontShiny(details.id).url
            let normalImgURL = PokemonSpriteType.frontShiny(details.id).url

            // Front Shiny Image
            KFAnimatedImage(URL(string: PokemonSpriteType.frontShiny(details.id).gifUrl))
                .frame(width: height, height: height)
                .brightness(0.1) // Adjust brightness
                .shadow(color: Color(.green).opacity(0.2), radius: 20, x: 0, y: 5) // Add shadow
                .padding()
            
            KFAnimatedImage(URL(string: PokemonSpriteType.frontDefault(details.id).gifUrl))
                .frame(width: height, height: height)
                .brightness(0.1) // Adjust brightness
                .shadow(color: Color(.blue).opacity(0.4), radius: 20, x: 0, y: 5) // Add shadow
                .padding()
        }
        .frame(maxWidth: .infinity) // Center the content horizontally
        .padding(.horizontal, 20) // Apply horizontal padding
        .background(Color.clear) // Transparent background
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}



struct SparkleView: View {
    @State private var animate = false

    var body: some View {
        ZStack {
            ForEach(0..<10) { _ in
                Circle()
                    .fill(Color.white)
                    .frame(width: 5, height: 5)
                    .opacity(animate ? 0 : 1)
                    .offset(x: CGFloat.random(in: -40...40), y: CGFloat.random(in: -40...40))
                    .animation(Animation.easeInOut(duration: 1).repeatForever().delay(Double.random(in: 0...1)))
            }
        }
        .onAppear {
            animate = true
        }
    }
}


//
//struct PokemonImagesView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonImagesView()
//    }
//}
