//
//  BreedCardView.swift
//  BreedsFeature
//
//  Created by MacPro on 12/07/25.
//

import SwiftUI

struct BreedCardView: View {
    let breed: Breed
    
    var body: some View {
        VStack(spacing: 8) {
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    LinearGradient(colors: [
                        Color.blue.opacity(0.2),
                        Color.blue.opacity(0.4),
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                    
                )
                .frame(height: 100)
                .overlay {
                    Image(systemName: "dog")
                        .font(.largeTitle)
                }
            
            Text(breed.name)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.1), radius: 12, x: 0, y: 4)
    }
}

#Preview {
    BreedCardView(breed: Breed(name: "schnauzer"))
}
