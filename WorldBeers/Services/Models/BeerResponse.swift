//
//  BeerResponse.swift
//  WorldBeers
//
//  Created by Pavlos Simas on 15/12/21.
//

import Foundation

class BeerResponse: Decodable {
    let name: String?
    let tagline: String?
    let image_url: String?
    let abv: Double?
    let ibu: Double?
}
