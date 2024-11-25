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
    
    func testNotificationsTab() {
        guard firstPostOnFeed.waitForExistence(timeout: 20) else {
            XCTFail("Post on feed did not appear in time.")
            return
        }
        notificationsTab.tap()
        
        XCTAssertTrue(notificationsTableView.exists)
        XCTAssertTrue(newNotificationsStaticText.exists)
        XCTAssertTrue(likedYourPhotoStaticText.exists)
    }
    
    func testFollowingAndFollowersOnProfileTab() {
        guard firstPostOnFeed.waitForExistence(timeout: 20) else {
            XCTFail("Post on feed did not appear in time.")
            return
        }
        profileDetailsTab.tap()
        
        XCTAssertTrue(followersStaticText.exists)
        XCTAssertTrue(followingStaticText.exists)
        XCTAssertTrue(postsStaticText.exists)
    }
    
    func testEditProfileButtonOnProfileTab() {
        guard firstPostOnFeed.waitForExistence(timeout: 20) else {
            XCTFail("Post on feed did not appear in time.")
            return
        }
        profileDetailsTab.tap()
        editProfileButton.tap()
        
        XCTAssertTrue(editProfilePageTitle.exists)
        XCTAssertTrue(changeProfilePhotoButton.exists)
        XCTAssertTrue(nameTextField.exists)
        XCTAssertTrue(nicknameTextField.exists)
        XCTAssertTrue(pronounsTextField.exists)
        XCTAssertTrue(bioStaticText.exists)
        XCTAssertTrue(linksStaticText.exists)
    }
}
