//
//  main.swift
//  OnMyOwn
//
//  Created by Ouimin Lee on 2/24/25.
//

import Foundation
let currentPath = "/Users/ouiminlee/Downloads/OnMyOwn/OnMyOwn/Resources"
let fileManager = FileManager.default

//let fileManager = FileManager.default
//let currentPath = fileManager.currentDirectoryPath

let filePath = "\(currentPath)/FlatColors.json"

if fileManager.fileExists(atPath: filePath) {
    let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
    print(fileContents)
} else {
    print("File not found!")
}

struct ColorPalette: Decodable {
   struct PaletteColor: Decodable {
       let sortOrder: Int
       let description: String
       let red: Int
       let green: Int
       let blue: Int
       let alpha: Double
    }
    let paletteName: String
    let paletteInfo: String
    let paletteColors: [PaletteColor]
}

let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase

guard let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)) else {
    fatalError("Couldn't load data from \(filePath)")
}

guard let colorPalette = try? decoder.decode(ColorPalette.self, from: data) else {
    fatalError( "Couldn't decode JSON")
}

for color in colorPalette.paletteColors {
    print(color.description)
}



