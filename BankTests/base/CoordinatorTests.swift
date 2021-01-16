//
//  CoordinatorTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class CoordinatorTests: XCTestCase {
    
    var coordinator: Coordinator!

    override func setUpWithError() throws {
        super.setUp()
        // Code
        coordinator = Coordinator()
    }

    override func tearDownWithError() throws {
        // Code
        super.tearDown()
    }

    func test_comingSoon() throws {
        let comingSoonViewController = coordinator.comingSoon(title: "Teste")
        XCTAssertTrue(comingSoonViewController is ComingSoonViewController)
    }

}
