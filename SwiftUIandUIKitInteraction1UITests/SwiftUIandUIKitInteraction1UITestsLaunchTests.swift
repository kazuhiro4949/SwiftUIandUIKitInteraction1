//
//  SwiftUIandUIKitInteraction1UITestsLaunchTests.swift
//  SwiftUIandUIKitInteraction1UITests
//
//  Created by kazuhiro4949 on 2022/06/06.
//

import XCTest

class SwiftUIandUIKitInteraction1UITestsLaunchTests: XCTestCase {

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
