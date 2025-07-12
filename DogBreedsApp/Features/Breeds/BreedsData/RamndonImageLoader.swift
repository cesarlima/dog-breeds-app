//
//  RamndonImageLoader.swift
//  BreedsData
//
//  Created by MacPro on 12/07/25.
//

import Foundation
import BreedsDomain

public final class RamndonImageLoader: RamndonImageLoaderProtocol {
    private let urlSession: URLSession
    
    public init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    public func loadRandomImage(for breed: Breed) async throws -> Data {
        let imageURL = try await loadImageName(for: breed)
        return try await loadImage(for: imageURL)
    }
    
    private func loadImage(for imageURL: String) async throws -> Data {
        guard let url = URL(string: imageURL) else {
            throw BreedsError.invalidURL
        }
        
        let (data, _) = try await urlSession.data(from: url)
        return data
    }
    
    private func loadImageName(for breed: Breed) async throws -> String {
        guard let url = URL(string: "https://dog.ceo/api/breed/\(breed.name)/images/random") else {
            throw BreedsError.invalidURL
        }
        
        let (data, _) = try await urlSession.data(from: url)
        let imageResponse = try JSONDecoder().decode(ImageResponse.self, from: data)
        
        return imageResponse.message
    }
}
