//
//  AddRemoveFavoriteUseCase.swift
//  BreedsDomain
//
//  Created by MacPro on 12/07/25.
//

import Foundation

public protocol AddRemoveFavoriteUseCaseProtocol {
    func execute(isFavorite: Bool, breedName: String, imageData: Data)
}

public protocol CheckFavoriteUseCaseProtocol {
    func execute(breedName: String) -> Bool
}

public final class AddRemoveFavoriteUseCase: AddRemoveFavoriteUseCaseProtocol, CheckFavoriteUseCaseProtocol {
    private let favoriteRepository: FavoriteBreedRepositoryProtocol
    
    public init(favoriteRepository: FavoriteBreedRepositoryProtocol) {
        self.favoriteRepository = favoriteRepository
    }
    
    public func execute(isFavorite: Bool, breedName: String, imageData: Data) {
        let favorite = FavoriteBreed(breedName: breedName, imageData: imageData)
        
        if isFavorite {
            favoriteRepository.addFavorite(favorite)
        } else {
            favoriteRepository.removeFavorite(favorite)
        }
    }
    
    public func execute(breedName: String) -> Bool {
        favoriteRepository.getFavorite(breedName) != nil
    }
}
