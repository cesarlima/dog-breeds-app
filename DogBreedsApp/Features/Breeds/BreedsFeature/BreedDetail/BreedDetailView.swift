//
//  BreedDetailView.swift
//  BreedsFeature
//
//  Created by MacPro on 12/07/25.
//

import SwiftUI
import BreedsDomain

public struct BreedDetailView: View {
     private let viewModel: BreedDetailViewModel
    
    init(viewModel: BreedDetailViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            Text(viewModel.breedName)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.primary)
            
            DogImageView(isLoadingImage: viewModel.isLoadingImage,
                         image: viewModel.image,
                         onLoadImage: viewModel.loadRandomImage)
            
            FavoriteButton(isFavorite: viewModel.isFavorite,
                           onToggleFavorite: viewModel.toggleFavorite)
            
            Spacer()
        }
        .padding()
        .task {
            await viewModel.loadRandomImage()
            viewModel.loadFavorite()
        }
    }
}

#Preview {
//    @Previewable @State var isLoadingImage: Bool = false
//    @Previewable @State var isFavorite: Bool = false
//    BreedDetailView(isLoadingImage: isLoadingImage, isFavorite: isFavorite) {
//        isLoadingImage.toggle()
//        isFavorite.toggle()
//    }
}
