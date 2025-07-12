//
//  DogImageView.swift
//  BreedsFeature
//
//  Created by MacPro on 12/07/25.
//

import SwiftUI

struct DogImageView: View {
    let isLoadingImage: Bool
    let image: UIImage?
    let onLoadImage: () async -> Void
    
    var body: some View {
        ZStack {
            if isLoadingImage {
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(2)
            }
            
            VStack {
                if !isLoadingImage {
                    if let image {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .transition(.scale)
                            .onTapGesture {
                                Task {
                                    await onLoadImage()
                                }
                            }
                    }
                }
            }
            .animation(.easeOut(duration: 0.5), value: !isLoadingImage)
            
        }
        .frame(width: 300, height: 300)
    }
}

#Preview {
    DogImageView(isLoadingImage: false, image: UIImage(named: "dog-image"), onLoadImage: {})
}
