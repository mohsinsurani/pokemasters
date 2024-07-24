//
//  EffectsView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//
/* Purpose of EffectsView is to display abstract and detailed effects for the pokemon */

import SwiftUI

struct EffectsView: View {
    var effectEntries: [EffectEntry]
    
    var body: some View {
        let shorteffect = effectEntries.first(where: { $0.language.name == "en" })?.shortEffect ?? ""
        let longEffect = effectEntries.first(where: { $0.language.name == "en" })?.effect ?? ""
        
        let effectText = "Detail: \(longEffect)"
        let shortText = "Abstract: \(shorteffect)"
        // SingleAxisGeometryReader to just get width (single param)
        // displaying shiort and long description of the effects
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
                    .accessibilityLabel("Effect Abstract")
                    .accessibilityValue(shortText)
                    .accessibilityHint("Describes the abstract effect of the ability or move.")
                
                Text(effectText)
                    .font(PokeFonts.bodyFont)
                    .foregroundColor(Color.black)
                    .padding()
                    .frame(width: abs(width - 30)) // Set fixed width
                    .background(Color.orange.opacity(1.0))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .multilineTextAlignment(.leading) // Align text to the leading edge
                    .lineLimit(nil) // Allow multiple lines
                    .accessibilityLabel("Effect Detail")
                    .accessibilityValue(effectText)
                    .accessibilityHint("Describes the detailed effect of the ability or move.")
                
            }.padding(.bottom)
                .accessibilityElement(children: .combine)
        }
    }
}



struct EffectsView_Previews: PreviewProvider {
    static var previews: some View {
        EffectsView(effectEntries: DummyData.dummyEffectModel.effectEntries!)
    }
}
