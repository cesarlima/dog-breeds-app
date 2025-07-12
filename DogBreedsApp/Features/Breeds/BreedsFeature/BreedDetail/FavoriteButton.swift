//
//  FavoriteButton.swift
//  BreedsFeature
//
//  Created by MacPro on 12/07/25.
//

import SwiftUI

struct FavoriteButton: View {
    let isFavorite: Bool
    let onToggleFavorite: () -> Void
    
    var body: some View {
        Button {
            onToggleFavorite()
        } label: {
            HStack {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .font(.title2)
                    .foregroundStyle(isFavorite ? .red : .gray)
                
                Text(isFavorite ? "Remove from favorites" : "Add to favorites")
                    .font(.title2)
                    .foregroundStyle(isFavorite ? .red : .primary)
            }
            .padding()
        }
    }
}

#Preview {
    FavoriteButton(isFavorite: true, onToggleFavorite: {})
}
