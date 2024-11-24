//
//  InstagramUIElements.swift
//  InstsagramKillerUITests
//
//  Created by Nkhorbaladze on 25.11.24.
//

import XCTest

class InstagramUIElements: UITestsBaseRunner {
    var firstPostOnFeed: XCUIElement { app.scrollViews.firstMatch }
    var pageIndicatorOnFirstPost: String { app.pageIndicators.firstMatch.value as? String ?? "page 1 of 3" }
    var popupWindowOnShareButton: XCUIElement { app.navigationBars["UIActivityContentView"] }
    var shareIcon: XCUIElement { app.buttons["shareIcon"].firstMatch }
    var discoverTab: XCUIElement { app.buttons["discoverTab"] }
    var searchFieldOnDiscoverTab: XCUIElement { app.searchFields.firstMatch }
}
