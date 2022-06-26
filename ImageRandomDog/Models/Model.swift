//
//  Model.swift
//  ImageRandomDog
//
//  Created by Daniil Oreshenkov on 26.06.2022.
//

import Foundation

enum Link: String {
    case url = "https://random.dog/woof.json"
}

struct Model: Decodable {
    let url: String
}
