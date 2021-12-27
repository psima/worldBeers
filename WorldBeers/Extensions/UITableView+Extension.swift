//
//  UITableView+Extension.swift
//  WorldBeers
//
//  Created by Pavlos Simas on 15/12/21.
//

import Foundation
import UIKit

extension UITableView {

    /**
     Register nibs faster by passing the type - if for some reason the `identifier` is different then it can be passed
     - Parameter type: UITableViewCell.Type
     - Parameter identifier: String?
     */
    func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
        let cellId = String(describing: type)
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
    }

    func registerHeaderOrFooter(type: UITableViewHeaderFooterView.Type, identifier: String? = nil) {
        let headerId = String(describing: type)
        register(UINib(nibName: headerId, bundle: nil), forHeaderFooterViewReuseIdentifier: identifier ?? headerId)
    }

    /**
     DequeueCell by passing the type of UITableViewCell
     - Parameter type: UITableViewCell.Type
     */
    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier) as? T
    }

    /**
     DequeueCell by passing the type of UITableViewCell and IndexPath
     - Parameter type: UITableViewCell.Type
     - Parameter indexPath: IndexPath
     */
    func dequeueCell<T: UITableViewCell>(withType type: UITableViewCell.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? T
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
