//
//  BaseViewController.swift
//  WorldBeers
//
//  Created by Pavlos Simas on 15/12/21.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showLoader() {
        Loader.shared.show()
    }

    func hideLoader() {
        Loader.shared.hide()
    }
}
