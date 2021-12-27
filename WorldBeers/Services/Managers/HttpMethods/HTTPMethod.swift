//
//  HTTPMethod.swift
//  WorldBeers
//
//  Created by Pavlos Simas on 15/12/21.
//

import Foundation

public struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    public static let get = HTTPMethod(rawValue: "GET")
    public static let post = HTTPMethod(rawValue: "POST")

    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
