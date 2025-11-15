//
//  AdaptiveColour.swift
//  Orbit
//
//  Created by Evan Plant on 15/11/2025.
//

import Foundation
import SwiftUI

// thank you YT tutorial!
// https://www.youtube.com/shorts/nlJpnLkLymw
// https://gist.github.com/pitt500/1958982f02641de84024d6a321a95f68
extension Color {
    func luminance() -> Double {
        // Convert SwiftUI Color to UIColor
        let uiColor = UIColor(self)
        
        // Extract RGB values
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        // Compute luminance.
        return 0.2126 * Double(red) + 0.7152 * Double(green) + 0.0722 * Double(blue)
    }
    
    func isLight() -> Bool {
        return luminance() > 0.5
    }
    
    func adaptedTextColor() -> Color {
        return isLight() ? Color.black : Color.white
    }
}
