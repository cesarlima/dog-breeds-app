//
//  Breed.swift
//  BreedsDomain
//
//  Created by MacPro on 12/07/25.
//

import Foundation

public struct Breed: Identifiable, Hashable {
    public var id: String { name }
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
}
