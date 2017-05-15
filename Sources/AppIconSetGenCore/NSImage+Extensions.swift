//
//  NSImage+Extensions.swift
//  AppIconSetGenCore
//
//  Created by Attila Bencze on 11/05/2017.
//
//

import Foundation
import Cocoa

extension NSImage {
    func imagePNGRepresentation() -> NSData? {
        if let imageTiffData = self.tiffRepresentation, let imageRep = NSBitmapImageRep(data: imageTiffData) {
            let imageProps: [String: Any] = [:]
            let imageData = imageRep.representation(using: NSBitmapImageFileType.PNG, properties: imageProps) as NSData?
            return imageData
        }
        return nil
    }

    // TODO: change this if there is an other way to produce better quality resized image
    func resized(width: CGFloat, height: CGFloat) -> NSImage {
        let image = NSImage(size: CGSize(width: width, height: height))

        image.lockFocus()
        let ctx = NSGraphicsContext.current()
        ctx?.imageInterpolation = .high
        draw(in: NSMakeRect(0, 0, width, height), from: NSMakeRect(0, 0, size.width, size.height), operation: .copy, fraction: 1)
        image.unlockFocus()
        return image
    }
}
