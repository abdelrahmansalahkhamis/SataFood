//
//  SlidersListVMTest.swift
//  SataFoodTests
//
//  Created by abdrahman on 08/06/2022.
//

import Foundation

import XCTest
@testable import SataFood

class SlidersListVMTest: XCTestCase{
    var slidersViewModel: SliderListVM!
    var mockNetworkService: MockNetworkService!
    override func setUp() {
        mockNetworkService = MockNetworkService()
        slidersViewModel = .init(networkService: mockNetworkService)
    }
    
    override func tearDown() {
        slidersViewModel = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    func test_loadSuccess(){
        let expectaion = self.expectation(description: "repos returned successfuly from api")
        slidersViewModel.loadSliders() { cells, error in
            XCTAssertNotNil(cells)
            XCTAssertNil(error)
            expectaion.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
