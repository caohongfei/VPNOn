//
//  VPNOnTests.swift
//  VPNOnTests
//
//  Created by Lex Tang on 1/20/15.
//  Copyright (c) 2015 LexTang.com. All rights reserved.
//

import UIKit
import XCTest
import VPNOnKit
import CoreData

class VPNOnTests: XCTestCase {
    
    var dataManager = VPNDataManager.sharedManager
    var manager = VPNManager.sharedManager()
    
    override func setUp() {
        super.setUp()
        for vpn in dataManager.allVPN() {
            dataManager.deleteVPN(vpn as VPN)
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreateVPN() {
        XCTAssert(dataManager.createVPN("hello", server: "world", account: "aaa", password: "asdf", group: "asdf", secret: "asdf", alwaysOn: true), "VPN must be created.")
    }
    
    func testActivatedVPN() {
        manager.activatedVPNID = dataManager.allVPN().last!.ID
        XCTAssert(dataManager.activatedVPN != nil, "Activated VPN must not be nil.")
    }
    
    func testDeleteVPN() {
        let lastVPN = dataManager.allVPN().last!
        XCTAssert(dataManager.deleteVPN(lastVPN), "This VPN must be deleted.")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
