//
//  TracksumoTests.swift
//  TracksumoTests
//
//  Created by Krystian Gontarek on 26/12/2016.
//  Copyright © 2016 Kreskow&Karrmarr DevHeroes. All rights reserved.
//

import XCTest
@testable import Tracksumo

class DateHelperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testTimeStringToDate() {
        let result = DateHelper.timeStringToDate(string: "08:25")
        var components = DateComponents()
        components.hour = 8
        components.minute = 25
        let calendar = Calendar(identifier: .gregorian)
        XCTAssertNotNil(result)
        if result != nil {
            XCTAssert(calendar.date(result!, matchesComponents: components))

        }
    }
    
    func testTimeStringToDate2() {
        let result = DateHelper.timeStringToDate(string: "17:39")
        var components = DateComponents()
        components.hour = 17
        components.minute = 39
        let calendar = Calendar(identifier: .gregorian)
        XCTAssertNotNil(result)
        if result != nil {
            XCTAssert(calendar.date(result!, matchesComponents: components))
            
        }
    }

    
    

}
