//
//  Font.swift
//  Netflix
//
//  Created by Shishir Rijal on 22/10/2024.
//

import SwiftUI

enum FontWeight {
    case light
    case regular
    case medium
    case bold
}

enum CustomFont: String {
    case netflixLight = "NetflixSans-Light"
    case netflixRegular = "NetflixSans-Regular"
    case netflixMedium = "NetflixSans-Medium"
    case netflixBold = "NetflixSans-Bold"
}

extension Font {
    // Corrected closure with proper return values and syntax
    static let customFont: (FontWeight, CGFloat) -> Font = { fontType, size in
        switch fontType {
        case .light:
            return Font.custom(CustomFont.netflixLight.rawValue, size: size)
        case .regular:
            return Font.custom(CustomFont.netflixRegular.rawValue, size: size)
        case .medium:
            return Font.custom(CustomFont.netflixMedium.rawValue, size: size)
        case .bold:
            return Font.custom(CustomFont.netflixBold.rawValue, size: size)
        }
    }
}


