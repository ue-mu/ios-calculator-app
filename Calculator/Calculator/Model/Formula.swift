//
//  Formula.swift
//  Calculator
//
//  Created by uemu on 2023/10/16.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var calculationResult = operands.dequeue() else {
            throw ClaculatorError.inappropriateOperation
        }
        
        while let myOperand = operands.dequeue(), let myOperator = operators.dequeue() {
            calculationResult = myOperator.calculate(lhs: calculationResult, rhs: myOperand)
        }
        return calculationResult
    }
}
