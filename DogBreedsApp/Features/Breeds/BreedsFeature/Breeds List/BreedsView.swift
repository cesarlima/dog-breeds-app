//
//  BreedsView.swift
//  BreedsFeature
//
//  Created by MacPro on 12/07/25.
//

import SwiftUI

struct BreedsView: View {
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
    ]
    
    private let viewModel: BreedsViewModel
    
    init(viewModel: BreedsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        if let errorMessage = viewModel.errorMessage {
            ErrorView(errorMessage: errorMessage,
                      onRetry: viewModel.loadBreeds)
        } else {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.breeds) { breed in
                        NavigationLink(value: breed) {
                            BreedCardView(breed: breed)
                        }
                    }
                }
                .padding()
            }
            .refreshable {
                await viewModel.loadBreeds()
            }
            .task {
                await viewModel.loadBreeds()
            }
        }
    }
}

#Preview {
    BreedsView(viewModel: .preview)
}
