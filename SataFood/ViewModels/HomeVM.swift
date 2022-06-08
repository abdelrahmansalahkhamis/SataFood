//
//  HomeVM.swift
//  SataFood
//
//  Created by abdrahman on 07/06/2022.
//

import Foundation

class HomeListVM{
    
    private(set) var cells: [HomeVM] = []
    
    private let networkService: NetworkServicesProtocol
    
    init(networkService: NetworkServicesProtocol = NetworkServices()) {
        self.networkService = networkService
    }
    
    func numberOfRows() -> Int{
        return cells.count
    }
    func cell(at indexPath: IndexPath) -> HomeVM{
        return cells[indexPath.row]
    }
}

class HomeVM{
    private let homeResponse: HomeResponse
    init(_ homeResponse: HomeResponse) {
        self.homeResponse = homeResponse
    }
    var categories : [Categories] {
        return self.homeResponse.categories!
    }
    
    var sliders:[Sliders]{
        return self.homeResponse.sliders!
    }
    
    var newOffers:[Newoffers]{
        return self.homeResponse.newoffers!
    }
}

extension HomeListVM{
    func loadHomeData(completion: @escaping(HomeListVM?, Error?) -> Void){
        networkService.load(resource: HomeResponse.getAllHomeResponse()) { result in
//            switch result{
//            case .success(let homeResponse):
//                let homeVM = HomeVM(homeResponse)
//
//                self.cells += homeResponse.categories.map{
//                    let categoryCellViewModel = CategoryCellVM($0)
//                    return categoryCellViewModel
//                }!
//                completion(homeVM, nil)
//            case .failure(let error):
//                completion(nil, error)
//            }
        }
    }
    
}
