//
//  FavoritesView.swift
//  BreedsFeature
//
//  Created by MacPro on 12/07/25.
//

import SwiftUI
import BreedsDomain

public struct FavoritesView: View {
    @State private var viewModel: FavoritesViewModel
    
    init(viewModel: FavoritesViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        List(viewModel.favorites, id: \.breedName) { favorite in
            NavigationLink(value: viewModel.createBreed(from: favorite)) {
                HStack {
                    if let image = UIImage(data: favorite.imageData) {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    
                    Text(favorite.breedName.capitalized)
                }
            }
        }
        .onAppear {
            viewModel.loadFavorites()
        }
    }
}

//#Preview {
//    FavoritesView()
//}



