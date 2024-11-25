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
    var notificationsTab: XCUIElement { app.buttons["notificationsTab"] }
    var newNotificationsStaticText: XCUIElement { app.staticTexts["New"] }
    var likedYourPhotoStaticText: XCUIElement {
        app.staticTexts.matching(NSPredicate(format: "label CONTAINS[c] %@", "liked your photo")).firstMatch
    }
    var notificationsTableView: XCUIElement { app.tables["notificationsTableView"] }
    var profileDetailsTab: XCUIElement { app.buttons["profileDetailsTab"] }
    var followersStaticText: XCUIElement { app.staticTexts["Followers"] }
    var followingStaticText: XCUIElement { app.staticTexts["Following"] }
    var postsStaticText: XCUIElement { app.staticTexts["Posts"] }
    var editProfileButton: XCUIElement { app.buttons["Edit Profile"] }
    var editProfilePageTitle: XCUIElement { app.staticTexts["Edit Profile"] }
    var changeProfilePhotoButton: XCUIElement { app.buttons["Change profile photo"] }
    var nameTextField: XCUIElement { app.textFields["Enter your name"] }
    var nicknameTextField: XCUIElement { app.textFields["Enter your nickname"] }
    var pronounsTextField: XCUIElement { app.textFields["Enter your pronouns"] }
    var bioStaticText: XCUIElement { app.staticTexts["Bio:"] }
    var linksStaticText: XCUIElement { app.staticTexts["Links:"] }
}
