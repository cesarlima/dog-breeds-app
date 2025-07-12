//
//  BreedDetailViewModel.swift
//  BreedsDomain
//
//  Created by MacPro on 12/07/25.
//

import SwiftUI
import BreedsDomain

@Observable
final class BreedDetailViewModel {
    private let breed: Breed
    private let loadBreedRamndonImageUseCase: LoadBreedRamndonImageUseCase
    private let addRemoveFavoriteUseCase: AddRemoveFavoriteUseCaseProtocol
    private let checkFavoriteUseCase: CheckFavoriteUseCaseProtocol
    private(set) var image: UIImage?
    private(set) var isLoadingImage = false
    private(set) var isFavorite = false
    
    var breedName: String {
        breed.name.capitalized
    }
    
    init(breed: Breed,
         loadBreedRamndonImageUseCase: LoadBreedRamndonImageUseCase,
         addRemoveFavoriteUseCase: AddRemoveFavoriteUseCaseProtocol,
         checkFavoriteUseCase: CheckFavoriteUseCaseProtocol) {
        self.breed = breed
        self.loadBreedRamndonImageUseCase = loadBreedRamndonImageUseCase
        self.addRemoveFavoriteUseCase = addRemoveFavoriteUseCase
        self.checkFavoriteUseCase = checkFavoriteUseCase
    }
    
    func loadRandomImage() async {
        defer {
            isLoadingImage = false
        }
        
        do {
            isLoadingImage = true
            let imageData = try await loadBreedRamndonImageUseCase.execute(for: breed)
            self.image = UIImage(data: imageData)
        } catch {
            debugPrint(error)
        }
    }
    
    func loadFavorite() {
        isFavorite = checkFavoriteUseCase.execute(breedName: breed.name)
    }
    
    func toggleFavorite() {
        guard let imageData = image?.pngData() else { return }
        isFavorite.toggle()
        addRemoveFavoriteUseCase.execute(isFavorite: isFavorite,
                                         breedName: breed.name,
                                         imageData: imageData)
    }
}
