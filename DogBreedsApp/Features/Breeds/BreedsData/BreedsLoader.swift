//
//  BreedsLoader.swift
//  BreedsData
//
//  Created by MacPro on 12/07/25.
//

import Foundation
import BreedsDomain

public final class BreedsLoader: BreedsLoaderProtocol {
    private let urlSession: URLSession
    private let baseURL = "https://dog.ceo/api/breeds/list/all"
    
    public init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    public func loadBreeds() async throws -> [Breed] {
        guard let url = URL(string: baseURL) else {
            throw BreedsError.invalidURL
        }
        
        let (data, _) = try await urlSession.data(from: url)
        let decodedResponse = try JSONDecoder().decode(BreedsResponse.self, from: data)
        debugPrint(decodedResponse.message)
        return convertToBreeds(decodedResponse)
    }
    
    private func convertToBreeds(_ response: BreedsResponse) -> [Breed] {
        return response.message.keys.map { breedName in
            Breed(name: breedName)
        }.sorted { $0.name < $1.name }
    }
}
