//
//  HTTPError.swift
//  WorldBeers
//
//  Created by Pavlos Simas on 15/12/21.
//

import Foundation

enum HTTPError: Error {
    case urlFailed
    case noData
    case requestError
    case parsingFailed
}
