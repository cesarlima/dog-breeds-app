//
//  FavoriteBreed.swift
//  BreedsDomain
//
//  Created by MacPro on 12/07/25.
//

import Foundation

public struct FavoriteBreed: Codable {
    public let breedName: String
    public let imageData: Data
    
    public init(breedName: String, imageData: Data) {
        self.breedName = breedName
        self.imageData = imageData
    }
}
