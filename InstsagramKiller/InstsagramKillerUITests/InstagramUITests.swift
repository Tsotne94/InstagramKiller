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
        guard firstPostOnFeed.waitForExistence(timeout: 20) else {
            XCTFail("Post on feed did not appear in time.")
            return
        }
        
        firstPostOnFeed.swipeLeft(velocity: .fast)
        XCTAssertTrue(pageIndicatorOnFirstPost == "page 2 of 3")
        
        firstPostOnFeed.swipeLeft(velocity: .fast)
        XCTAssertTrue(pageIndicatorOnFirstPost == "page 3 of 3")
    }
    
    func testShareButtonOnPost() {
        guard firstPostOnFeed.waitForExistence(timeout: 20) else {
            XCTFail("Post on feed did not appear in time.")
            return
        }
        
        shareIcon.tap()
        guard popupWindowOnShareButton.waitForExistence(timeout: 20) else {
            XCTFail("Post on feed did not appear in time.")
            return
        }
        
        XCTAssertTrue(popupWindowOnShareButton.exists)
    }
    
    func testSearchBarOnSearchTab() {
        guard firstPostOnFeed.waitForExistence(timeout: 20) else {
            XCTFail("Post on feed did not appear in time.")
            return
        }
        discoverTab.tap()
        
        XCTAssertTrue(searchFieldOnDiscoverTab.exists)
    }
}
