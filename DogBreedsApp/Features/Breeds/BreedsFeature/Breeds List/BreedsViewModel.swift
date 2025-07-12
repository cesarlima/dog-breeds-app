//
//  BreedsViewModel.swift
//  BreedsFeature
//
//  Created by MacPro on 12/07/25.
//

import SwiftUI
import BreedsDomain

@Observable
final class BreedsViewModel {
    private(set) var breeds: [Breed] = []
    private let loadBreedsUsecase: LoadBreedsUsecaseProtocol
    private(set) var errorMessage: String?
    
    init(loadBreedsUsecase: LoadBreedsUsecaseProtocol) {
        self.loadBreedsUsecase = loadBreedsUsecase
    }
    
    func loadBreeds() async {
        do {
            breeds = try await loadBreedsUsecase.execute()
        } catch {
            errorMessage = error.localizedDescription
            debugPrint(error)
        }
    }
}
