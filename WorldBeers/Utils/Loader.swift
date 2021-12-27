//
//  Loader.swift
//  WorldBeers
//
//  Created by Pavlos Simas on 15/12/21.
//

import Foundation
import UIKit

public class Loader {

    public static let shared = Loader()
    var blurImg = UIImageView()
    var indicator = UIActivityIndicatorView()

    private init() {
        blurImg.frame = UIScreen.main.bounds
        blurImg.backgroundColor = UIColor.black
        blurImg.isUserInteractionEnabled = true
        blurImg.alpha = 0.5
        indicator.style = .whiteLarge
        indicator.center = blurImg.center
        indicator.startAnimating()
        indicator.color = .red
    }

    func show() {
        DispatchQueue.main.async( execute: {
            UIApplication.shared.keyWindow?.addSubview(self.blurImg)
            UIApplication.shared.keyWindow?.addSubview(self.indicator)
        })
    }

    func hide() {
        DispatchQueue.main.async(execute: {
            self.blurImg.removeFromSuperview()
            self.indicator.removeFromSuperview()
        })
    }
}
