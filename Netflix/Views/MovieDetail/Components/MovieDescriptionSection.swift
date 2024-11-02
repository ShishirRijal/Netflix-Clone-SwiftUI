//
//  MovieDescriptionSection.swift
//  Netflix
//
//  Created by Shishir Rijal on 02/11/2024.
//

import SwiftUI

struct MovieDescriptionSection: View {
    let description: String
    let cast: String
    let creator: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(description)
            Text("Cast: \(cast)")
            Text("Creator: \(creator)")
        }
        .font(.customFont(.regular, 14))
        .foregroundColor(.primaryFontColor)
    }
}
