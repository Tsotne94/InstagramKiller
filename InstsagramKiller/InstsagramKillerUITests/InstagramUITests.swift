//
//  InstagramUITests.swift
//  InstsagramKillerUITests
//
//  Created by Nkhorbaladze on 25.11.24.
//

import XCTest
@testable import InstsagramKiller

final class InstagramUITests: InstagramUIElements {
    func testPictureSwipeOnPost() {
        firstPostOnFeed.waitForExistence(timeout: 20)
        firstPostOnFeed.swipeLeft(velocity: .fast)
        XCTAssertTrue(pageIndicatorOnFirstPost == "page 2 of 3")
        
        firstPostOnFeed.swipeLeft(velocity: .fast)
        XCTAssertTrue(pageIndicatorOnFirstPost == "page 3 of 3")
    }
    
    func testShareButtonOnPost() {
        firstPostOnFeed.waitForExistence(timeout: 20)
        shareIcon.tap()
        popupWindowOnShareButton.waitForExistence(timeout: 20)
        XCTAssertTrue(popupWindowOnShareButton.exists)
    }
    
    func testSearchBarOnSearchTab() {
        firstPostOnFeed.waitForExistence(timeout: 20)
        discoverTab.tap()
        XCTAssertTrue(searchFieldOnDiscoverTab.exists)
    }
}
