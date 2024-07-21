//
//  EffectsView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//

import SwiftUI

struct EffectsView: View {
    var effectEntries: [EffectEntry]
    
    var body: some View {
        let shorteffect = effectEntries.first(where: { $0.language.name == "en" })?.shortEffect ?? ""
        let longEffect = effectEntries.first(where: { $0.language.name == "en" })?.effect ?? ""
        
        let effectText = "Detail: \(longEffect)"
        let shortText = "Abstract: \(shorteffect)"
        
        SingleAxisGeometryReader { width in
            VStack {
                Text(shortText)
                    .font(PokeFonts.bodyFont)
                    .foregroundColor(Color.black)
                    .padding()
                    .frame(width: abs(width - 30)) // Set fixed width
                    .background(Color.orange.opacity(1.0))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .multilineTextAlignment(.leading) // Align text to the leading edge
                    .lineLimit(nil) // Allow multiple lines
                
                Text(effectText)
                    .font(PokeFonts.bodyFont)
                    .foregroundColor(Color.black)
                    .padding()
                    .frame(width: abs(width - 30)) // Set fixed width
                    .background(Color.orange.opacity(1.0))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .multilineTextAlignment(.leading) // Align text to the leading edge
                    .lineLimit(nil) // Allow multiple lines
            }.padding(.bottom)
        }
    }
}



//struct EffectsView_Previews: PreviewProvider {
//    static var previews: some View {
//        EffectsView()
//    }
//}
