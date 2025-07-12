//
//  FavoriteBreedRepository.swift
//  BreedsData
//
//  Created by MacPro on 12/07/25.
//

import Foundation
import BreedsDomain

public final class FavoriteBreedRepository: FavoriteBreedRepositoryProtocol {
    private let userDefaults: UserDefaults
    private let key = "favoriteBreeds"
    private var favorites: [FavoriteBreed] = []
    
    public init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        favorites = loadFavorites()
    }
    
    public func addFavorite(_ favoriteBreed: FavoriteBreed) {
        favorites.append(favoriteBreed)
        saveFavorites()
    }
    
    public func removeFavorite(_ favoriteBreed: FavoriteBreed) {
        favorites.removeAll { $0.breedName == favoriteBreed.breedName }
        saveFavorites()
    }
    
    public func getFavorite(_ breedName: String) -> FavoriteBreed? {
        return favorites.first { $0.breedName == breedName }
    }
    
    public func loadFavorites() -> [FavoriteBreed] {
        let data = userDefaults.data(forKey: key) ?? Data()
        let result =  try? JSONDecoder().decode([FavoriteBreed].self, from: data)
        return result ?? []
    }
    
    private func saveFavorites() {
        if let data = try? JSONEncoder().encode(favorites) {
            userDefaults.set(data, forKey: key)
        }
    }
}
