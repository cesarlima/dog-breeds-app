//
//  BreedsComposer.swift
//  BreedsFeature
//
//  Created by MacPro on 12/07/25.
//

import SwiftUI
import BreedsDomain

public enum BreedsComposer {
    public static func composeBreedsView(loadBreedsUsecase: LoadBreedsUsecaseProtocol) -> some View {
        let viewModel = BreedsViewModel(loadBreedsUsecase: loadBreedsUsecase)
        return BreedsView(viewModel: viewModel)
    }
    
    public static func compseBreedDetailView(breed: Breed,
                                             loadBreedRamndonImageUseCase: LoadBreedRamndonImageUseCase,
                                             addRemoveFavoriteUseCase: AddRemoveFavoriteUseCaseProtocol,
                                             checkFavoriteUseCase: CheckFavoriteUseCaseProtocol) -> some View {
        let viewModel = BreedDetailViewModel(breed: breed,
                                             loadBreedRamndonImageUseCase: loadBreedRamndonImageUseCase,
                                             addRemoveFavoriteUseCase: addRemoveFavoriteUseCase,
                                             checkFavoriteUseCase: checkFavoriteUseCase)
        return BreedDetailView(viewModel: viewModel)
    }
    
    public static func composeFavoritesView(loadFavoritesUseCaseProtocol: LoadFavoritesUseCaseProtocol) -> some View {
        let viewModel = FavoritesViewModel(loadFavoritesUseCase: loadFavoritesUseCaseProtocol)
        return FavoritesView(viewModel: viewModel)
    }
}
