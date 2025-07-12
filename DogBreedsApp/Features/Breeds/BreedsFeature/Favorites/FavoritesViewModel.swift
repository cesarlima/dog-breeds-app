//
//  FavoritesViewModel.swift
//  BreedsFeature
//
//  Created by MacPro on 12/07/25.
//

import SwiftUI
import BreedsDomain

@Observable
final class FavoritesViewModel {
    private(set) var favorites: [FavoriteBreed] = []
    private let loadFavoritesUseCase: LoadFavoritesUseCaseProtocol
    
    init(loadFavoritesUseCase: LoadFavoritesUseCaseProtocol) {
        self.loadFavoritesUseCase = loadFavoritesUseCase
    }
    
    func loadFavorites() {
        favorites = loadFavoritesUseCase.execute()
    }
}
