//
//  ExpressionParser.swift
//  Calculator
//
//  Created by uemu on 2023/10/16.
//

enum ExpressionParser {
    func parse(from input: String) -> Formula {
        var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
        var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
        
        let components = componentsByOperators(from: input)
        
        components.compactMap { Double($0) }.forEach { operands.enqueue(value: $0) }
        
        input.compactMap { Operator(rawValue: $0) }.forEach{ operators.enqueue(value: $0) }
        
        return Formula(operands: operands, operators: operators)
    }
    
    private func componentsByOperators(from input: String) -> [String] {
        let operators = Operator.allCases.map { $0.rawValue }
        
        let componets = operators.reduce([input]) { partialResult, operatorItem in partialResult.flatMap { $0.split(with: operatorItem) }
        }
        
        return componets
    }
}
