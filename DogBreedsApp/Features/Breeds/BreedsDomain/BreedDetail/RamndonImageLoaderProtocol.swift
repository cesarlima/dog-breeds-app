//
//  RamndonImageLoaderProtocol.swift
//  BreedsDomain
//
//  Created by MacPro on 12/07/25.
//

import Foundation

public protocol RamndonImageLoaderProtocol {
    func loadRandomImage(for breed: Breed) async throws -> Data
}
