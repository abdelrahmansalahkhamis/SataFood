//
//  HomeElements.swift
//  SataFood
//
//  Created by abdrahman on 07/06/2022.
//

import Foundation

struct HomeResponse: Codable{
    let categories: [Categories]?
    let sliders: [Sliders]?
    let newoffers: [Newoffers]?
}
struct Categories: Codable{
    var name: String?
    var photo: String?
    var id: Int?
}

struct Sliders: Codable{
    let photo: String?
}
struct Newoffers: Codable{
    let name: String?
    let RestauranthId: Int?
    let description: String?
    let cover: String?
    let cuisines: [Cuisines]?
    struct Cuisines: Codable{
        let name: String?
    }
}

extension HomeResponse{
    static func getAllHomeResponse() -> Resource<HomeResponse>?{
        guard let url = URL(string: URLs.url) else{
            //fatalError("incorrect url")
            return nil
        }
        return Resource<HomeResponse>(url: url)
    }
}

extension Categories{
    static func getAllCategories() -> Resource<[Categories]>?{
        guard let url = URL(string: URLs.url) else{
            //fatalError("incorrect url")
            return nil
        }
        return Resource<[Categories]>(url: url)
    }
}

extension Sliders{
    static func getAllSliders() -> Resource<[Sliders]>?{
        guard let url = URL(string: URLs.url) else{
            //fatalError("incorrect url")
            return nil
        }
        return Resource<[Sliders]>(url: url)
    }
}

extension Newoffers{
    static func getAllNewoffers() -> Resource<[Newoffers]>?{
        guard let url = URL(string: URLs.url) else{
            return nil
        }
        return Resource<[Newoffers]>(url: url)
    }
}


