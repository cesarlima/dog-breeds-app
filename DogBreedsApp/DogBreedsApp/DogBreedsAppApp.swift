//
//  DogBreedsAppApp.swift
//  DogBreedsApp
//
//  Created by MacPro on 12/07/25.
//

import SwiftUI
import BreedsFeature
import BreedsDomain
import BreedsData

@main
struct DogBreedsAppApp: App {
    var body: some Scene {
        WindowGroup {
            AppComposer.composeBreedsFeature()
        }
    }
}

enum AppComposer {
    private static let urlSession = URLSession(configuration: .ephemeral)
    static func composeBreedsFeature() -> some View {
        let breedsLoader = BreedsLoader(urlSession: urlSession)
        let loadBreedsUsecase = LoadBreedsUsecase(breedsLoader: breedsLoader)
        return BreedsComposer.composeBreedsView(loadBreedsUsecase: loadBreedsUsecase)
    }
}
