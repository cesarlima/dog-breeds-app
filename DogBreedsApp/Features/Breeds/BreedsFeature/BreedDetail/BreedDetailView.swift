//
//  BreedDetailView.swift
//  BreedsFeature
//
//  Created by MacPro on 12/07/25.
//

import SwiftUI
import BreedsDomain

struct BreedDetailView: View {
    let breed: Breed = Breed(name: "lakeland")
    var isLoadingImage: Bool
    var isFavorite: Bool
    let loadImage: () -> Void
    let image = UIImage(named: "dog-image")
    
    var body: some View {
        VStack {
            Text(breed.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.primary)
            
            DogImageView(isLoadingImage: isLoadingImage,
                         image: image,
                         onLoadImage: loadImage)
            
            FavoriteButton(isFavorite: isFavorite, onToggleFavorite: loadImage)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var isLoadingImage: Bool = false
    @Previewable @State var isFavorite: Bool = false
    BreedDetailView(isLoadingImage: isLoadingImage, isFavorite: isFavorite) {
        isLoadingImage.toggle()
        isFavorite.toggle()
    }
}
