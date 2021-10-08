//
//  ScrollStackKitTests.swift
//  ScrollStackKitTests
//
//  Created by Marco Del Giudice on 10/09/21.
//

import XCTest
@testable import ScrollStackKit

class ScrollStackKitTests: XCTestCase {
    
    func testInsertRow() throws {
        let scrollStack = ScrollStackView()
        let view = UIView()
        scrollStack.insertRow(view)
        
        XCTAssertEqual(scrollStack.rows.count, 1)
    }
    
    func testInsertControllerRow() throws {
        let vc = UIViewController()
        let scrollStack = ScrollStackView()
        vc.view.addSubview(scrollStack)
        let controller = UIViewController()
        scrollStack.insertRow(controller, withFixedHeight: 400)
        
        XCTAssertEqual(scrollStack.rows.count, 1)
    }
    
    func testInsertRowAtIndex() throws {
        let scrollStack = ScrollStackView()
        let view = UIView()
        scrollStack.insertRow(view)
        
        let view2 = UIView()
        scrollStack.insertRow(view2)
        
        let view3 = UIView()
        scrollStack.insertRow(view3, at: .atIndex(1))
        
        XCTAssertEqual(scrollStack.rows.count, 3)
        
        let index = scrollStack.getIndex(of: view3)
        
        XCTAssertEqual(index, 1)
    }
    
    func testRemoveRow() throws {
        let vc = UIViewController()
        let scrollStack = ScrollStackView()
        vc.view.addSubview(scrollStack)
        let view = UIView()
        scrollStack.insertRow(view)
        
        XCTAssertEqual(scrollStack.rows.count, 1)
        
        scrollStack.removeRow(view)
        
        XCTAssertEqual(scrollStack.rows.count, 0)
        
        let view2 = UIView()
        scrollStack.insertRow(view2)

        scrollStack.removeRow(at: .atIndex(0))
        XCTAssertEqual(scrollStack.rows.count, 0)
        
        let controller = UIViewController()
        scrollStack.insertRow(controller, withFixedHeight: 400)
        
        XCTAssertEqual(scrollStack.rows.count, 1)
        
        scrollStack.removeRow(controller)
        XCTAssertEqual(scrollStack.rows.count, 0)
    }
    
    func testRemoveRows() throws {
        let scrollStack = ScrollStackView()
        let view = UIView()
        scrollStack.insertRow(view)
        
        let view2 = UIView()
        scrollStack.insertRow(view2)
        
        XCTAssertEqual(scrollStack.rows.count, 2)
        
        scrollStack.removeAllRows()
        XCTAssertEqual(scrollStack.rows.count, 0)
    }
    
    func testGetIndexOf() throws {
        let vc = UIViewController()
        let scrollStack = ScrollStackView()
        vc.view.addSubview(scrollStack)
        let controller = UIViewController()
        scrollStack.insertRow(controller, withFixedHeight: 400)
        
        XCTAssertEqual(scrollStack.rows.count, 1)
        XCTAssertEqual(scrollStack.getIndex(of: controller), 0)
        
        let view = UIView()
        scrollStack.insertRow(view)
        XCTAssertEqual(scrollStack.rows.count, 2)
        XCTAssertEqual(scrollStack.getIndex(of: view), 1)
    }

}

