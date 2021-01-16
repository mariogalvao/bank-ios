//
//  ProfileHomeViewControllerTests.swift
//  BankTests
//
//  Created by Mário Galvao on 16/01/21.
//

import XCTest
@testable import Bank

class ProfileHomeViewControllerTests: XCTestCase {
    
    var viewController: ProfileHomeViewController!
    var viewModelDelegate: ProfileHomeViewModelProtocolMock!

    override func setUpWithError() throws {
        super.setUp()
        
        viewController = ProfileHomeViewController()
        viewModelDelegate = ProfileHomeViewModelProtocolMock()
        viewController.viewModelDelegate = viewModelDelegate
        viewController.view.awakeFromNib()
    }

    override func tearDownWithError() throws {
        // Code
        
        super.tearDown()
    }

    func test_viewDidLoad() throws {
        viewController.viewDidLoad()
        XCTAssertEqual(viewController.title, "Perfil")
        checkLabelsVisible(false)
    }
    
    private func checkLabelsVisible(_ visible: Bool) {
        XCTAssertEqual(viewController.nameLabel.isHidden, !visible)
        XCTAssertEqual(viewController.emailLabel.isHidden, !visible)
        XCTAssertEqual(viewController.cpfLabel.isHidden, !visible)
        XCTAssertEqual(viewController.phoneLabel.isHidden, !visible)
        XCTAssertEqual(viewController.bankLabel.isHidden, !visible)
        XCTAssertEqual(viewController.agencyLabel.isHidden, !visible)
        XCTAssertEqual(viewController.accountLabel.isHidden, !visible)
    }
    
    func test_viewWillAppear() throws {
        viewController.viewWillAppear(true)
        XCTAssertEqual(viewModelDelegate.count_getMyInfo, 1)
    }
    
    func test_needHelp() throws {
        viewController.needHelp(viewController.needHelpButton)
        XCTAssertEqual(viewModelDelegate.count_needHelp, 1)
    }
    
    func test_logout() throws {
        viewController.logout(viewController.logoutButton)
        XCTAssertEqual(viewModelDelegate.count_logout, 1)
    }
    
    func test_setMyInfo() throws {
        viewController.setMyInfo(MyInfoMock().mock)
        XCTAssertEqual(viewController.nameLabel.text, "Nome: Mario Galvão")
        XCTAssertEqual(viewController.emailLabel.text, "E-mail: mhcgalvao@gmail.com")
        XCTAssertEqual(viewController.cpfLabel.text, "CPF: 123.456.789-00")
        XCTAssertEqual(viewController.phoneLabel.text, "Celular: (99) 99999-9999")
        XCTAssertEqual(viewController.bankLabel.text, "Banco: 999")
        XCTAssertEqual(viewController.agencyLabel.text, "Agência: 0001")
        XCTAssertEqual(viewController.accountLabel.text, "Conta: 12345-6")
    }

}
