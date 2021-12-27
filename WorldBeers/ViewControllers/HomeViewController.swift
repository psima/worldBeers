//
//  HomeViewController.swift
//  WorldBeers
//
//  Created by Pavlos Simas on 15/12/21.
//

import UIKit

class HomeViewController: BaseViewController {

    private var beersViewModel = BeersViewModel()
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        showLoader()
        self.beersViewModel.beersLoaded = { [weak self] (_, success) in
            self?.hideLoader()
            if success {
                self?.tableView.reloadData()
            } else {

            }
        }
    }

    private func setupUI() {
        self.tableView.registerCell(type: BeerTableViewCell.self)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.beersViewModel.numberOrRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueCell(withType: BeerTableViewCell.self, for: indexPath) as? BeerTableViewCell, let beerData = self.beersViewModel.getBeer(index: indexPath.row) else {
            return UITableViewCell()
        }
        cell.setBeerData(beerData: beerData)
        return cell
    }

}
