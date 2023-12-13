//
//  HomeViewController.swift
//  ioslearningapp
//
//  Created by Dhruv on 13/12/2023.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeViewModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchData()
    }
    
    func dataDidUpdate() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.delegate = self
    }

    private func fetchData() {
        viewModel.fetchData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoworkingSpaceViewCell", for: indexPath) as! CoworkingSpaceViewCell
        let data = viewModel.items[indexPath.row]
        cell.setData(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let coworkingSpace = viewModel.items[indexPath.row]
            navigateToDetailScreen(coworkingSpace: coworkingSpace)
        }

        private func navigateToDetailScreen(coworkingSpace: CoworkingSpace) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
                detailViewController.coworkingSpace = coworkingSpace
                navigationController?.pushViewController(detailViewController, animated: true)
            }
        }
}
