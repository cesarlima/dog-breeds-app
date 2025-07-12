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
    
    @State private var viewModel: BreedsViewModel
    
    init(viewModel: BreedsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.breeds) { breed in
                    BreedCardView(breed: breed)
                }
            }
            .padding()
        }
        .task {
            await viewModel.loadBreeds()
        }
    }
}

#Preview {
    BreedsView(viewModel: .preview)
}
