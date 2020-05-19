//
//  ConfigTests.swift
//  RijksMuseumAppTests
//
//  Created by Alexandre Mantovani Tavares on 17/05/20.
//

@testable import RijksMuseum
import XCTest

class ConfigTests: XCTestCase {
    func testLocalizedHost() throws {
        let config = Config.fromBundle()
        XCTAssertTrue(config.localizedHost(from: Locale(identifier: "en")).hasSuffix("/en"))
        XCTAssertTrue(config.localizedHost(from: Locale(identifier: "nl")).hasSuffix("/nl"))
        XCTAssertTrue(config.localizedHost(from: Locale(identifier: "pt")).hasSuffix("/en"))
    }
}
