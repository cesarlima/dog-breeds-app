//
//  DogBreedsAppApp.swift
//  DogBreedsApp
//
//  Created by MacPro on 12/07/25.
//

import SwiftUI
import BreedsFeature
import BreedsDomain
import BreedsData

@main
struct DogBreedsAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Breeds", systemImage: "dog.fill") {
                    NavigationStack {
                        AppComposer.composeBreedsFeature()
                            .navigationDestination(for: Breed.self) { breed in
                                AppComposer.composeBreedDetailView(breed: breed)
                            }
                    }
                }
                
                Tab("Favorites", systemImage: "heart.fill") {
                    NavigationStack {
                        AppComposer.composeFavoritesFeature()
                            .navigationDestination(for: Breed.self) { breed in
                                AppComposer.composeBreedDetailView(breed: breed)
                            }
                    }
                }
            }
        }
    }
}

enum AppComposer {
    private static let urlSession = URLSession(configuration: .ephemeral)
    
    static func composeBreedsFeature() -> some View {
        let breedsLoader = BreedsLoader(urlSession: urlSession)
        let loadBreedsUsecase = LoadBreedsUsecase(breedsLoader: breedsLoader)
        return BreedsComposer.composeBreedsView(loadBreedsUsecase: loadBreedsUsecase)
    }
    
    static func composeBreedDetailView(breed: Breed) -> some View {
        let favoriteRepository = FavoriteBreedRepository()
        let ramndonImageLoader = RamndonImageLoader(urlSession: urlSession)
        let loadBreedRamndonImageUseCase = LoadBreedRamndonImage(imageLoader: ramndonImageLoader)
        let favoriteUseCase = AddRemoveFavoriteUseCase(favoriteRepository: favoriteRepository)
        return BreedsComposer.compseBreedDetailView(breed: breed,
                                                    loadBreedRamndonImageUseCase: loadBreedRamndonImageUseCase,
                                                    addRemoveFavoriteUseCase: favoriteUseCase,
                                                    checkFavoriteUseCase: favoriteUseCase)
    }
    
    static func composeFavoritesFeature() -> some View {
        let favoriteRepository = FavoriteBreedRepository()
        let loadFavoritesUseCase = LoadFavoritesUseCase(favoriteBreedRepository: favoriteRepository)
        return BreedsComposer.composeFavoritesView(loadFavoritesUseCaseProtocol: loadFavoritesUseCase)
    }
}
