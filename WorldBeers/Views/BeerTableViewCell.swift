//
//  BeerTableViewCell.swift
//  WorldBeers
//
//  Created by Pavlos Simas on 15/12/21.
//

import UIKit
import SDWebImage

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var ibuLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.containerView.layer.cornerRadius = 8
        self.containerView.layer.masksToBounds = true
        applyShadow(cornerRadius: 8)
    }

    func setBeerData(beerData: BeerResponse) {
        if let url = URL(string: beerData.image_url ?? "") {
            icon.sd_setImage(with: url, completed: nil)
        }
        titleLabel.text = beerData.name
        descriptionLabel.text = beerData.tagline
        abvLabel.text = "ABV: \(beerData.abv ?? 0)%"
        ibuLabel.text = "IBU: \(beerData.ibu ?? 0)"
    }
}
