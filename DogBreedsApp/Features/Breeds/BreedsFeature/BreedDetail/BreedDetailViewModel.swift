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
    private(set) var image: UIImage?
    private(set) var isLoadingImage = false
    private(set) var isFavorite = false
    
    var breedName: String {
        breed.name.capitalized
    }
    
    init(breed: Breed, loadBreedRamndonImageUseCase: LoadBreedRamndonImageUseCase) {
        self.breed = breed
        self.loadBreedRamndonImageUseCase = loadBreedRamndonImageUseCase
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
    
    func toggleFavorite() {
        isFavorite.toggle()
    }
}
