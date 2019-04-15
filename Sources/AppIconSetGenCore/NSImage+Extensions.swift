//
//  NSImage+Extensions.swift
//  AppIconSetGenCore
//
//  Created by Attila Bencze on 11/05/2017.
//
//

import Cocoa
import Foundation

extension NSImage {
    func imagePNGRepresentation(widthInPixels: CGFloat, heightInPixels: CGFloat) -> NSData? {
        let imageRep = NSBitmapImageRep(bitmapDataPlanes: nil,
                                        pixelsWide: Int(widthInPixels),
                                        pixelsHigh: Int(heightInPixels),
                                        bitsPerSample: 8,
                                        samplesPerPixel: 4,
                                        hasAlpha: true,
                                        isPlanar: false,
                                        colorSpaceName: NSColorSpaceName.calibratedRGB,
                                        bytesPerRow: 0,
                                        bitsPerPixel: 0)
        imageRep?.size = NSMakeSize(widthInPixels, heightInPixels)

        NSGraphicsContext.saveGraphicsState()
        NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: imageRep!)
        draw(in: NSMakeRect(0, 0, widthInPixels, heightInPixels), from: NSZeroRect, operation: .copy, fraction: 1.0)
        NSGraphicsContext.restoreGraphicsState()

        let imageProps: [NSBitmapImageRep.PropertyKey: Any] = [:]
        let imageData = imageRep?.representation(using: NSBitmapImageRep.FileType.png, properties: imageProps) as NSData?
        return imageData
    }
}
