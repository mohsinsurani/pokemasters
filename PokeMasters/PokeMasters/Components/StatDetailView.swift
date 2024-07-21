//
//  StatDetailView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//

import SwiftUI

struct StatDetailView: View {
    var affectingMoves: AffectingMoves

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Top Affecting Moves \(affectingMoves.name ?? "")")
                    .font(PokeFonts.subtitleFontBold)
                    .padding(.bottom, 8)

                if let increase = affectingMoves.increase, !increase.isEmpty {
                    VStack(alignment: .leading) {
                        Text("Increase moves")
                            .font(PokeFonts.subtitleFontItalic)
                            .padding(.bottom, 4)
                        
                        let topIncreaseMoves = increase.sorted(by: { $0.change > $1.change })
                        
                        LazyVStack {
                            ForEach(topIncreaseMoves.indices, id: \.self) { index in
                                let increaseMove = topIncreaseMoves[index]
                                HStack {
                                    Text(increaseMove.move?.name.capitalized ?? "")
                                        .font(PokeFonts.bodyFont)
                                    Spacer()
                                    Text("+\(increaseMove.change) stages")
                                        .font(PokeFonts.bodyFont)
                                        .foregroundColor(.green)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                    .padding(.bottom, 8)
                }

                if let decrease = affectingMoves.decrease, !decrease.isEmpty {
                    let topDecMoves = decrease.sorted(by: { $0.change < $1.change })

                    VStack(alignment: .leading) {
                        Text("Decrease moves")
                            .font(PokeFonts.subtitleFontItalic)
                            .padding(.bottom, 4)
                        
                        LazyVStack {
                            ForEach(topDecMoves.indices, id: \.self) { index in
                                let decreaseMove = topDecMoves[index]
                                HStack {
                                    Text(decreaseMove.move?.name.capitalized ?? "")
                                        .font(PokeFonts.bodyFont)
                                    Spacer()
                                    Text("\(decreaseMove.change) stages")
                                        .font(PokeFonts.bodyFont)
                                        .foregroundColor(.red)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}


//struct StatDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatDetailView(affectingMoves: <#AffectingMoves#>)
//    }
//}
