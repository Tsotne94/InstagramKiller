//
//  UITestsBaseRunner.swift
//  InstsagramKillerUITests
//
//  Created by Nkhorbaladze on 25.11.24.
//

import XCTest

class UITestsBaseRunner: XCTestCase {
    private(set) var app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app.terminate()
        app = XCUIApplication()
        app.launchArguments = ["UI-Testing"]
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
    }
}

