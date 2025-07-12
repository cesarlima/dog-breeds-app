//
//  BreedsResponse.swift
//  BreedsData
//
//  Created by MacPro on 12/07/25.
//

import Foundation

struct BreedsResponse: Decodable {
    let message: [String: [String]]
    let status: String
}
