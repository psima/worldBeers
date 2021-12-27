//
//  BaseViewModel.swift
//  WorldBeers
//
//  Created by Pavlos Simas on 15/12/21.
//

import UIKit

class BaseViewModel: NSObject {
    override init() {
        super.init()
        callService()
    }

    public func callService() {
        // childs should implement this
    }
}
