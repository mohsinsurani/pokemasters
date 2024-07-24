//
//  theme.swift
//  PokeMasters
//
//  Created by Admin on 21/07/2024.
//
/* Purpose of this theme is to configure theme of color and fonts used by this app */

import Foundation
import SwiftUI

// Define Pokémon Color Theme
struct PokeColors {
    static let primary = Color(red: 0.5, green: 0.8, blue: 0.4) // Example Pokémon green
    static let secondary = Color(red: 1.0, green: 0.8, blue: 0.2) // Example Pokémon yellow
    static let accent = Color(red: 1.0, green: 0.4, blue: 0.4) // Example Pokémon red
    static let background = Color(red: 0.9, green: 0.9, blue: 0.9) // Light gray background
}

// define fonts
struct PokeFonts {
    static let fontFamilyname = "Chalkboard SE"
    // Primary font for titles and headers
    static let titleFont: Font = .custom(fontFamilyname, size: 24)
    
    // Italic version of title font
    static let titleFontItalic: Font = .custom(fontFamilyname, size: 24).italic()
    
    // Bold version of title font
    static let titleFontBold: Font = .custom(fontFamilyname, size: 24).bold()
    
    // Secondary font for subheaders and body text
    static let subtitleFont: Font = .custom(fontFamilyname, size: 20)
    
    // Italic version of subtitle font
    static let subtitleFontItalic: Font = .custom(fontFamilyname, size: 20).italic()
    
    // Bold version of subtitle font
    static let subtitleFontBold: Font = .custom(fontFamilyname, size: 20).bold()
    
    // Font for regular body text
    static let bodyFont: Font = .custom(fontFamilyname, size: 16)
    
    // Italic version of body font
    static let bodyFontItalic: Font = .custom(fontFamilyname, size: 16).italic()
    
    // Bold version of body font
    static let bodyFontBold: Font = .custom(fontFamilyname, size: 16).bold()
    
    // Font for smaller text elements
    static let smallFont: Font = .custom(fontFamilyname, size: 14)
    
    // Italic version of small font
    static let smallFontItalic: Font = .custom(fontFamilyname, size: 14).italic()
    
    // Bold version of small font
    static let smallFontBold: Font = .custom(fontFamilyname, size: 14).bold()
}
