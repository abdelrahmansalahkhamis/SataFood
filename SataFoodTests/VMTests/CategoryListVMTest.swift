//
//  CategoryListVMTest.swift
//  SataFoodTests
//
//  Created by abdrahman on 08/06/2022.
//

import Foundation

import XCTest
@testable import SataFood

class CategoryListVMTest: XCTestCase{
    var categoriesviewModel: CategoryListVM!
    var mockNetworkService: MockNetworkService!
    override func setUp() {
        mockNetworkService = MockNetworkService()
        categoriesviewModel = .init(networkService: mockNetworkService)
    }
    
    override func tearDown() {
        categoriesviewModel = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    func test_loadSuccess(){
        let expectaion = self.expectation(description: "repos returned successfuly from api")
        categoriesviewModel.loadCategories() { cells, error in
            XCTAssertNotNil(cells)
            XCTAssertNil(error)
            expectaion.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
