//
//  LoadBreedsUsecase.swift
//  BreedsDomain
//
//  Created by MacPro on 12/07/25.
//

import Foundation

public protocol LoadBreedsUsecaseProtocol {
    func execute() async throws -> [Breed]
}

public final class LoadBreedsUsecase: LoadBreedsUsecaseProtocol {
    private let breedsLoader: BreedsLoaderProtocol
    
    public init(breedsLoader: BreedsLoaderProtocol) {
        self.breedsLoader = breedsLoader
    }
    
    public func execute() async throws -> [Breed] {
        try await breedsLoader.loadBreeds()
    }
}
