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
                                             loadBreedRamndonImageUseCase: LoadBreedRamndonImageUseCase) -> some View {
        let viewModel = BreedDetailViewModel(breed: breed, loadBreedRamndonImageUseCase: loadBreedRamndonImageUseCase)
        return BreedDetailView(viewModel: viewModel)
    }
}
