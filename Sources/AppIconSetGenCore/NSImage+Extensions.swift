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
    func imagePNGRepresentation(widthInPixels: CGFloat, heightInPixels: CGFloat) -> NSData? {
        let imageRep = NSBitmapImageRep(bitmapDataPlanes: nil,
                                        pixelsWide: Int(widthInPixels),
                                        pixelsHigh: Int(heightInPixels),
                                        bitsPerSample: 8,
                                        samplesPerPixel: 4,
                                        hasAlpha: true,
                                        isPlanar: false,
                                        colorSpaceName: NSCalibratedRGBColorSpace,
                                        bytesPerRow: 0,
                                        bitsPerPixel: 0)
        imageRep?.size = NSMakeSize(widthInPixels, heightInPixels)

        NSGraphicsContext.saveGraphicsState()
        NSGraphicsContext.setCurrent(NSGraphicsContext(bitmapImageRep: imageRep!))
        draw(in: NSMakeRect(0, 0, widthInPixels, heightInPixels), from: NSZeroRect, operation: .copy, fraction: 1.0)
        NSGraphicsContext.restoreGraphicsState()

        let imageProps: [String: Any] = [:]
        let imageData = imageRep?.representation(using: NSBitmapImageFileType.PNG, properties: imageProps) as NSData?
        return imageData
    }
}


