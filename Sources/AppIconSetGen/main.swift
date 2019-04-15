//
//  AppIconSet.swift
//  AppIconSetGen
//
//  Created by Attila Bencze on 11/05/2017.
//
//

import AppIconSetGenCore
import Cocoa
import Commander
import Foundation

let version = "0.0.2"
let main = command(
    Argument<String>("input file", description: "Path to an image file (.pdf, .png, etc)"),
    Flag("iOS", description: "Generates app icons for iOS"),
    Flag("watchOS", description: "Generates app icons for watchOS"),
    Flag("macOS", description: "Generates app icons for macOS"),
    Option("output", default: ".", description: "Output folder of the generated App Icon set"),
    Option("appIconSetName", default: "AppIcon", description: "App icon set name")
) { inputFile, iOS, watchOS, macOS, output, appIconSetName in

    guard iOS || watchOS || macOS else {
        throw "At least one of --iOS, --watchOS or --macOS flag must be specified!"
    }

    guard let image = NSImage(byReferencingFile: inputFile), image.isValid else {
        throw "Unable to open file: \(inputFile)!"
    }

    var iconInfoItems = [IconInfo]()

    if iOS {
        iconInfoItems += iconInfoItemsIOS
    }

    if watchOS {
        iconInfoItems += iconInfoItemsWatchOS
    }

    if macOS {
        iconInfoItems += iconInfoItemsMacOS
    }

    print("Generating app icons...")
    let appIconSet = AppIconSet(iconInfoItems: iconInfoItems)
    try appIconSet.createOnDisk(sourceImage: image, outputFolderPath: output, appIconSetName: appIconSetName)

    print("Done!")
}

main.run(version)
