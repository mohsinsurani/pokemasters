//
//  AboutView.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//

import SwiftUI

struct AboutView: View {
    var details: PokemonSpecsModel
    
    var body: some View {
        SingleAxisGeometryReader { width in
            VStack {
                if let baseExp = details.baseExperience {
                    let desc = PokemonExpEnum.experienceDetail(for: baseExp)
                    let baseText = "Base Experience of \(details.name.capitalized) is \(baseExp)"
                    
                    Text(baseText + "\n" + desc)
                        .font(PokeFonts.bodyFont)
                        .foregroundColor(Color.black)
                        .padding()
                        .frame(width: abs(width - 30)) // Set fixed width
                        .background(Color.orange.opacity(1.0))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .multilineTextAlignment(.center) // Center align text
                        .lineLimit(nil) // Allow multiple lines// Center the ZStack
                    
                    if let height = details.height, let weight = details.weight {
                        let heightTxt = "Height: \(height) decimetres"
                        let weightTxt = "Weight: \(weight) hectograms"
                        
                        Text(weightTxt + "\n" + heightTxt)
                            .frame(width: abs(width - 60)) // Set fixed width
                            .font(PokeFonts.bodyFont)
                            .foregroundColor(Color.black)
                            .padding()
                            .background(Color.orange.opacity(1.0))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .multilineTextAlignment(.center) // Center align text
                            .lineLimit(nil) // Allow multiple lines
                    }
                    
                    if let heldItems = details.heldItems, !heldItems.isEmpty {
                        let helddesc = "total held items"
                        let heldItems = heldItems.map { $0.item.name }.joined(separator: ", ")

                        Text(helddesc + " are " + heldItems)
                            .frame(width: abs(width - 60)) // Set fixed width
                            .font(PokeFonts.bodyFont)
                            .foregroundColor(Color.black)
                            .padding()
                            .background(Color.orange.opacity(1.0))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .multilineTextAlignment(.center) // Center align text
                            .lineLimit(nil) // Allow multiple lines
                    }
                }
            }
        }
    }
}


//struct AboutView_Previews: PreviewProvider {
//    static var previews: some View {
//        AboutView()
//    }
//}

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
