//
//  LoadBreedRamndonImageUseCase.swift
//  BreedsDomain
//
//  Created by MacPro on 12/07/25.
//

import Foundation

public protocol LoadBreedRamndonImageUseCase {
    func execute(for breed: Breed) async throws -> Data
}

public final class LoadBreedRamndonImage: LoadBreedRamndonImageUseCase {
    private let imageLoader: RamndonImageLoaderProtocol
    
    public init(imageLoader: RamndonImageLoaderProtocol) {
        self.imageLoader = imageLoader
    }
    
    public func execute(for breed: Breed) async throws -> Data {
        try await imageLoader.loadRandomImage(for: breed)
    }
}
