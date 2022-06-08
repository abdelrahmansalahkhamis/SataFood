//
//  NewOffersListVM.swift
//  SataFoodTests
//
//  Created by abdrahman on 08/06/2022.
//


import XCTest
@testable import SataFood


class NewOffersListVMTest: XCTestCase{
    var newOffersViewModel: NewOffersListVM!
    var mockNetworkService: MockNetworkService!
    override func setUp() {
        mockNetworkService = MockNetworkService()
        newOffersViewModel = .init(networkService: mockNetworkService)
    }
    
    override func tearDown() {
        newOffersViewModel = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    func test_loadSuccess(){
        let expectaion = self.expectation(description: "repos returned successfuly from api")
        newOffersViewModel.loadNewOffers() { cells, error in
            XCTAssertNotNil(cells)
            XCTAssertNil(error)
            expectaion.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
