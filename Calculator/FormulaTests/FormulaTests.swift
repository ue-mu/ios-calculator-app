//
//  FormulaTests.swift
//  FormulaTests
//
//  Created by uemu on 2023/10/16.
//

import XCTest
@testable import Calculator

final class FormulaTests: XCTestCase {
    var sut: Formula!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Formula(operands: CalculatorItemQueue<Double>(), operators: CalculatorItemQueue<Operator>())
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_2점1에_5점5를add하면_7점6이나오는지() {
        // given
        sut.operands.enqueue(value: 2.1)
        sut.operators.enqueue(value: .add)
        sut.operands.enqueue(value: 5.5)
        
        // when
        let result = try! sut.result()
        
        // then
        XCTAssertEqual(result, 7.6)
    }
    
    func test_8점0에_5점5를subtract하면_2점5가나오는지() {
        // given
        sut.operands.enqueue(value: 8.0)
        sut.operators.enqueue(value: .subtract)
        sut.operands.enqueue(value: 5.5)
        
        // when
        let result = try! sut.result()
        
        // then
        XCTAssertEqual(result, 2.5)
    }
    
    func test_12점2에_2점2를multiply하면_17점6이나오는지() {
        // given
        sut.operands.enqueue(value: 8.0)
        sut.operators.enqueue(value: .multiply)
        sut.operands.enqueue(value: 2.2)
        
        // when
        let result = try! sut.result()
        
        // then
        XCTAssertEqual(result, 17.6)
    }
    
    func test_8점0에_2를divide하면_4가나오는지() {
        // given
        sut.operands.enqueue(value: 8.0)
        sut.operators.enqueue(value: .divide)
        sut.operands.enqueue(value: 2)
        
        // when
        let result = try! sut.result()
        
        // then
        XCTAssertEqual(result, 4)
    }
}
