//
//  BreedDetailView.swift
//  BreedsFeature
//
//  Created by MacPro on 12/07/25.
//

import SwiftUI
import BreedsDomain

public struct BreedDetailView: View {
    @State private var viewModel: BreedDetailViewModel
    
    init(viewModel: BreedDetailViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            Text(viewModel.breedName)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.primary)
            
            DogImageView(isLoadingImage: viewModel.isLoadingImage,
                         image: viewModel.image,
                         onLoadImage: viewModel.loadRandomImage)
            
            FavoriteButton(isFavorite: viewModel.isFavorite,
                           onToggleFavorite: viewModel.toggleFavorite)
            
            Spacer()
        }
        .padding()
        .task {
            await viewModel.loadRandomImage()
        }
    }
}

#Preview {
//    @Previewable @State var isLoadingImage: Bool = false
//    @Previewable @State var isFavorite: Bool = false
//    BreedDetailView(isLoadingImage: isLoadingImage, isFavorite: isFavorite) {
//        isLoadingImage.toggle()
//        isFavorite.toggle()
//    }
}

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

public protocol RamndonImageLoaderProtocol {
    func loadRandomImage(for breed: Breed) async throws -> Data
}

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

struct ImageResponse: Decodable {
    let message: String
    let status: String
}
