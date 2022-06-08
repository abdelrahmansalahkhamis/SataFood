////
////  CategoryVM.swift
////  SataFood
////
////  Created by abdrahman on 07/06/2022.
////
//
import Foundation
//
class CategoryCellVM{
    private let category: Categories
    
    init(_ category: Categories) {
        self.category = category
    }
    var name:String{
        return self.category.name ?? ""
    }
    var photo:String{
        return self.category.photo ?? ""
    }
    var id:Int{
        return self.category.id ?? 0
    }
}
class CategoryListVM{
//
    private(set) var cells: [CategoryCellVM] = []
//    
    private let networkService: NetworkServicesProtocol
    
    init(networkService: NetworkServicesProtocol = NetworkServices()) {
        self.networkService = networkService
    }
    
    func numberOfRows() -> Int{
        return cells.count
    }
    
    
    func cell(at indexPath: IndexPath) -> CategoryCellVM{
        return cells[indexPath.row]
    }
}

extension CategoryListVM{
    func loadCategories(_ completion: @escaping([CategoryCellVM]?, Error?) -> Void){

        networkService.load(resource: HomeResponse.getAllHomeResponse()) { result in
            switch result{
            case .success(let homeData):
                self.cells += (homeData.categories?.map({ categories in
                    let categoryCellVM = CategoryCellVM(categories)
                    return categoryCellVM
                }))!
                completion(self.cells, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
