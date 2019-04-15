//
//  Utils.swift
//  AppIconSetGenCore
//
//  Created by Attila Bencze on 11/05/2017.
//
//

import Cocoa
import Foundation

extension String: Error {}

extension CGFloat {
    var cleanValue: String {
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(describing: self)
    }
}
