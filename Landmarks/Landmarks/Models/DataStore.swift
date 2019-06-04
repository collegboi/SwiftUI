//
//  DataStore.swift
//  Landmarks
//
//  Created by Timothy Barnard on 04/06/2019.
//  Copyright © 2019 Timothy Barnard. All rights reserved.
//

import UIKit
import SwiftUI
import CoreLocation

let landMarkData: [Landmark] = load("landmarkData.json")
let hikeData: [Hike] = load("hikeData.json")


func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Could parse \(filename) as \(T.self):\n\(error)")
    }
}

final class ImageStore {
    fileprivate typealias _ImageDictionary = [String: [Int: CGImage]]
    fileprivate var images: _ImageDictionary = [:]
    
    fileprivate static var originalSize = 250
    fileprivate static var scale = 2
    
    static var share = ImageStore()
    
    func image(name: String, size: Int) -> Image {
        let index = _guaranteeInitialIamge(name: name)
        
        let sizedImage = images.values[index][size] ??
            _sizeImage(images.values[index][ImageStore.originalSize]!, to: size * ImageStore.scale)
        
        return Image(sizedImage, scale: Length(ImageStore.scale), label: Text(verbatim: name))
        
    }
    
    fileprivate func _sizeImage(_ image: CGImage, to size: Int) -> CGImage {
        guard
            let colorSpace = image.colorSpace,
            let context = CGContext(
                data: nil,
                width: size,
                height: size,
                bitsPerComponent: image.bitsPerComponent,
                bytesPerRow: image.bytesPerRow,
                space: colorSpace,
                bitmapInfo: image.bitmapInfo.rawValue) else {
                    fatalError("Could not create graphics context.")
        }
        
        context.interpolationQuality = .high
        context.draw(image, in: CGRect(x: 0, y: 0, width: size, height: size))
        
        guard let sizeImage = context.makeImage() else {
            fatalError("Could not resize image")
        }
        return sizeImage
    }
    
    fileprivate func _guaranteeInitialIamge(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) {return index}
        guard let url = Bundle.main.url(forResource: name, withExtension: ".jpg"),
        let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil) else {
                fatalError("Could not load image \(name).jpg from main bundle")
        }
        
        images[name] = [ImageStore.originalSize: image]
        return images.index(forKey: name)!
    }
}
