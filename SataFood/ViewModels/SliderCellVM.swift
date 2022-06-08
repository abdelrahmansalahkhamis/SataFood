//
//  SliderVM.swift
//  SataFood
//
//  Created by abdrahman on 07/06/2022.
//

import Foundation

class SliderCellVM{
    private let slider: Sliders
    
    init(_ slider: Sliders) {
        self.slider = slider
    }
    var photo:String{
        return self.slider.photo ?? ""
    }
}

class SliderListVM{

    private(set) var cells: [SliderCellVM] = []
    
    private let networkService: NetworkServicesProtocol
    
    init(networkService: NetworkServicesProtocol = NetworkServices()) {
        self.networkService = networkService
    }
    
    func numberOfRows() -> Int{
        return cells.count
    }
    
    
    func cell(at indexPath: IndexPath) -> SliderCellVM{
        return cells[indexPath.row]
    }
}

extension SliderListVM{
    func loadSliders(_ completion: @escaping([SliderCellVM]?, Error?) -> Void){

        networkService.load(resource: HomeResponse.getAllHomeResponse()) { result in
            switch result{
            case .success(let homeData):
                self.cells += (homeData.sliders?.map({ sliders in
                    let sliderCellVM = SliderCellVM(sliders)
                    return sliderCellVM
                }))!
                completion(self.cells, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
