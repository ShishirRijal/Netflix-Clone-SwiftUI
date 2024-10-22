//
//  NewAndHotView.swift
//  Netflix
//
//  Created by Shishir Rijal on 23/10/2024.
//

import SwiftUI
import SDWebImageSwiftUI

// Main View
struct NewAndHotView: View {
    @State private var activeTag: String = "upcoming" // Track the active tag
    @Namespace var animation // Namespace for the matchedGeometryEffect

    var tags = ["upcoming", "hot", "released", "trending", "favourite"]

    var body: some View {
        VStack {
            TagListView(tags: tags, activeTag: $activeTag, animation: animation)
                .padding(.bottom, 20)

            ScrollView {
                RecommendationView()
                RecommendationView()
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
  NewAndHotView()
    .preferredColorScheme(.light)
}




// Tag List View
struct TagListView: View {
    var tags: [String]
    @Binding var activeTag: String
    var animation: Namespace.ID

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(tags, id: \.self) { tag in
                    TagView(tag: tag, isActive: tag == activeTag, animation: animation)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                activeTag = tag // Update the active tag on tap
                            }
                        }
                }
            }
            .padding(.horizontal, 20)
        }
        .scrollIndicators(.hidden)
    }
}


// Recommendation View
struct RecommendationView: View {
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            VStack {
                HStack(alignment: .top, spacing: 10) {
                    DateView(date: "2024-10-23")
                    Spacer()
                    WebImage(url: URL(string: "https://image.tmdb.org/t/p/w500/hPIWQT70wQK6akqfLXByEvr62u0.jpg"))
                        .resizable()
                        .scaledToFill()
                        .frame(height: size.height - 20)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 20)
        }
        .frame(height: 450)
    }
}

// Date View
struct DateView: View {
    var date: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("March") // Static month for demonstration
                .font(.footnote)
                .fontWeight(.semibold)
            Text("01") // Static day for demonstration
                .font(.title)
                .fontWeight(.semibold)
        }
        .padding(.top, 5)
    }
}




struct TagView: View {
    let tag: String
    let isActive: Bool
    var animation: Namespace.ID

    var body: some View {
        Text(tag.capitalized)
            .font(.body)
            .fontWeight(.semibold)
            .foregroundColor(isActive ? .white :  .primaryFontColor)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background {
                if isActive {
                    Capsule()
                    .fill(.redDark)
                        .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                } else {
                    Capsule()
                    .stroke(.gray, lineWidth: 2.0)
                }
            }
    }
}
