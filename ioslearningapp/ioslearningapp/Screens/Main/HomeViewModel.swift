//
//  HomeViewModel.swift
//  ioslearningapp
//
//  Created by Dhruv on 13/12/2023.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func dataDidUpdate()
}

class HomeViewModel {
    weak var delegate: HomeViewModelDelegate?
    private let apiService: ApiServiceProtocol

    var items: [CoworkingSpace] = [] {
        didSet {
            delegate?.dataDidUpdate()
        }
    }

    init(apiService: ApiServiceProtocol = ApiService.shared) {
        self.apiService = apiService
    }

    func fetchData() {
        apiService.fetchData { result in
            switch result {
            case .success(let items):
                self.items = items
            case .failure:
                let jsonString = "coworkingSpaces".loadJsonData()
                let data: [CoworkingSpace]? = jsonString?.convertToModel()
                self.items = data!
            }
        }
    }
}
