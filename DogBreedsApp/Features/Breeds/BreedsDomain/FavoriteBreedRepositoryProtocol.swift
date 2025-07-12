//
//  FavoriteBreedRepositoryProtocol.swift
//  BreedsDomain
//
//  Created by MacPro on 12/07/25.
//

import Foundation

public protocol FavoriteBreedRepositoryProtocol {
    func addFavorite(_ favoriteBreed: FavoriteBreed)
    func removeFavorite(_ favoriteBreed: FavoriteBreed)
    func getFavorite(_ breedName: String) -> FavoriteBreed?
}
