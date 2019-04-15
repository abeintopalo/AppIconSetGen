//
//  IconInfo.swift
//  AppIconSetGenCore
//
//  Created by Attila Bencze on 11/05/2017.
//
//

import Foundation

public protocol ContentsJSONStringConvertible {
    var contentJSONFormat: String { get }
}

// MARK: - Idiom

public enum Idiom: String {
    case iPhone
    case iPad
    case mac
    case watch
    case iosMarketing = "ios-marketing"
    case watchMarketing = "watch-marketing"
}

extension Idiom: ContentsJSONStringConvertible {
    public var contentJSONFormat: String {
        return rawValue.lowercased()
    }
}

// MARK: - Role

public enum Role: String {
    case any
    case notificationCenter
    case companionSettings
    case appLauncher
    case quickLook
}

extension Role: ContentsJSONStringConvertible {
    public var contentJSONFormat: String {
        return rawValue
    }
}

// MARK: - Subtype

public enum Subtype: String {
    case any
    case mm38
    case mm42
    case mm40
    case mm44
}

extension Subtype: ContentsJSONStringConvertible {
    public var contentJSONFormat: String {
        switch self {
        case .mm38: return "38mm"
        case .mm42: return "42mm"
        case .mm40: return "40mm"
        case .mm44: return "44mm"
        default: return rawValue
        }
    }
}

// MARK: - IconInfo

public struct IconInfo {
    let idiom: Idiom
    // size in points
    let size: CGFloat
    let role: Role
    let subtype: Subtype
    let scale: CGFloat

    var sizeInPixels: CGFloat {
        return size * scale
    }
}

public extension IconInfo {
    init(idiom: Idiom, size: CGFloat, scale: CGFloat) {
        self.idiom = idiom
        self.size = size
        self.scale = scale
        role = .any
        subtype = .any
    }
}

// MARK: - Icon sets for platforms

public let iconInfoItemsIOS = [
    IconInfo(idiom: .iPhone, size: 20, scale: 2),
    IconInfo(idiom: .iPhone, size: 20, scale: 3),
    IconInfo(idiom: .iPhone, size: 29, scale: 2),
    IconInfo(idiom: .iPhone, size: 29, scale: 3),
    IconInfo(idiom: .iPhone, size: 40, scale: 2),
    IconInfo(idiom: .iPhone, size: 40, scale: 3),
    IconInfo(idiom: .iPhone, size: 60, scale: 2),
    IconInfo(idiom: .iPhone, size: 60, scale: 3),
    IconInfo(idiom: .iPad, size: 20, scale: 1),
    IconInfo(idiom: .iPad, size: 20, scale: 2),
    IconInfo(idiom: .iPad, size: 29, scale: 1),
    IconInfo(idiom: .iPad, size: 29, scale: 2),
    IconInfo(idiom: .iPad, size: 40, scale: 1),
    IconInfo(idiom: .iPad, size: 40, scale: 2),
    IconInfo(idiom: .iPad, size: 76, scale: 1),
    IconInfo(idiom: .iPad, size: 76, scale: 2),
    IconInfo(idiom: .iPad, size: 83.5, scale: 2),
    IconInfo(idiom: .iosMarketing, size: 1024, scale: 1),
]

public let iconInfoItemsWatchOS = [
    IconInfo(idiom: .watch, size: 24, role: .notificationCenter, subtype: .mm38, scale: 2),
    IconInfo(idiom: .watch, size: 27.5, role: .notificationCenter, subtype: .mm42, scale: 2),
    IconInfo(idiom: .watch, size: 29, role: .companionSettings, subtype: .any, scale: 2),
    IconInfo(idiom: .watch, size: 29, role: .companionSettings, subtype: .any, scale: 3),
    IconInfo(idiom: .watch, size: 40, role: .appLauncher, subtype: .mm38, scale: 2),
    IconInfo(idiom: .watch, size: 44, role: .appLauncher, subtype: .mm40, scale: 2),
    IconInfo(idiom: .watch, size: 50, role: .appLauncher, subtype: .mm44, scale: 2),
    IconInfo(idiom: .watch, size: 86, role: .quickLook, subtype: .mm38, scale: 2),
    IconInfo(idiom: .watch, size: 98, role: .quickLook, subtype: .mm42, scale: 2),
    IconInfo(idiom: .watch, size: 108, role: .quickLook, subtype: .mm44, scale: 2),
    IconInfo(idiom: .watchMarketing, size: 1024, scale: 1),
]

public let iconInfoItemsMacOS = [
    IconInfo(idiom: .mac, size: 16, scale: 1),
    IconInfo(idiom: .mac, size: 16, scale: 2),
    IconInfo(idiom: .mac, size: 32, scale: 1),
    IconInfo(idiom: .mac, size: 32, scale: 2),
    IconInfo(idiom: .mac, size: 128, scale: 1),
    IconInfo(idiom: .mac, size: 128, scale: 2),
    IconInfo(idiom: .mac, size: 256, scale: 1),
    IconInfo(idiom: .mac, size: 256, scale: 2),
    IconInfo(idiom: .mac, size: 512, scale: 1),
    IconInfo(idiom: .mac, size: 512, scale: 2),
]
