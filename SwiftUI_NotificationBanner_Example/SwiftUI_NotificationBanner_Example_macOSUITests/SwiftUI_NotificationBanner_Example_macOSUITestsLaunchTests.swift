//
//  SwiftUI_NotificationBanner_Example_macOSUITestsLaunchTests.swift
//  SwiftUI_NotificationBanner_Example_macOSUITests
//
//  Created by Dominik Butz on 4/7/2023.
//

import XCTest

final class SwiftUI_NotificationBanner_Example_macOSUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
