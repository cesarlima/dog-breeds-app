//
//  BreedsLoaderProtocol.swift
//  BreedsDomain
//
//  Created by MacPro on 12/07/25.
//

import Foundation

public protocol BreedsLoaderProtocol {
    func loadBreeds() async throws -> [Breed]
}
