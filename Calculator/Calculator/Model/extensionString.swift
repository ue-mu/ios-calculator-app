//
//  extensionString.swift
//  Calculator
//
//  Created by uemu on 2023/10/16.
//

extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
}
