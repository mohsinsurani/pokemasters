//
//  ViewExt.swift
//  PokeMasters
//
//  Created by Admin on 24/07/2024.
//

import Foundation
import SwiftUI

// customize the navigation title view
extension View {
    func navigationTitleView<Content: View>(_ content: () -> Content) -> some View {
        self.navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    content()
                }
            }
    }
}
