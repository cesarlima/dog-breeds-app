//
//  LoadFavoritesUseCaseProtocol.swift
//  BreedsDomain
//
//  Created by MacPro on 12/07/25.
//

import Foundation

public protocol LoadFavoritesUseCaseProtocol {
    func execute() -> [FavoriteBreed]
}

public final class LoadFavoritesUseCase: LoadFavoritesUseCaseProtocol {
    private let favoriteBreedRepository: FavoriteBreedRepositoryProtocol
    
    public init(favoriteBreedRepository: FavoriteBreedRepositoryProtocol) {
        self.favoriteBreedRepository = favoriteBreedRepository
    }
    
    public func execute() -> [FavoriteBreed] {
        favoriteBreedRepository.loadFavorites()
    }
}
