//
//  Collection+Extensions.swift
//  AppIconSetGenCore
//
//  Created by Attila Bencze on 11/05/2017.
//
//

import Foundation

extension Collection {
    /// A version of `reduce` that uses inout parameter for its partial result
    public func reduce<Result>(_ initial: Result, _ combine: (inout Result, Iterator.Element) throws -> Void) rethrows -> Result {
        var result = initial
        for element in self {
            try combine(&result, element)
        }
        return result
    }
}
