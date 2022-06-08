//
//  NewOfferVM.swift
//  SataFood
//
//  Created by abdrahman on 07/06/2022.
//

import Foundation

class NewOfferCellVM{
    private let newOffer: Newoffers
    
    init(_ newOffer: Newoffers) {
        self.newOffer = newOffer
    }
    var name:String{
        return self.newOffer.name ?? ""
    }
    var restauranthID:Int{
        return self.newOffer.RestauranthId ?? 0
    }
    var newofferDescription:String{
        return self.newOffer.description ?? ""
    }
    var cover:String{
        return self.newOffer.cover ?? ""
    }
    var cuisines:[Newoffers.Cuisines]{
        return self.newOffer.cuisines!
    }
}

class NewOffersListVM{

    private(set) var cells: [NewOfferCellVM] = []
    
    private let networkService: NetworkServicesProtocol
    
    init(networkService: NetworkServicesProtocol = NetworkServices()) {
        self.networkService = networkService
    }
    
    func numberOfRows() -> Int{
        return cells.count
    }
    
    
    func cell(at indexPath: IndexPath) -> NewOfferCellVM{
        return cells[indexPath.row]
    }
}

extension NewOffersListVM{
    func loadNewOffers(_ completion: @escaping([NewOfferCellVM]?, Error?) -> Void){

        networkService.load(resource: HomeResponse.getAllHomeResponse()) { result in
            switch result{
            case .success(let homeData):
                self.cells += (homeData.newoffers?.map({ newOffers in
                    let newOffersCellVM = NewOfferCellVM(newOffers)
                    return newOffersCellVM
                }))!
                completion(self.cells, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
