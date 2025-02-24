////
////  main.swift
////  OnMyOwn
////
////  Created by Ouimin Lee on 2/24/25.
////
//
//import Foundation
//let currentPath = "/Users/ouiminlee/Downloads/OnMyOwn/OnMyOwn/Resources"
//let fileManager = FileManager.default
//
////let fileManager = FileManager.default
////let currentPath = fileManager.currentDirectoryPath
//
//var filePath = "\(currentPath)/FlatColors.json"
//
//if fileManager.fileExists(atPath: filePath) {
//    let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
//    print(fileContents)
//} else {
//    print("File not found!")
//}
//
//struct ColorPalette: Decodable {
//    enum CodingKeys: String, CodingKey {
//        case name = "palette_name"
//        case info = "palette_info"
//        case colors = "palette_colors"
//    }
//   struct PaletteColor: Decodable {
//       enum CodingKeys: String, CodingKey {
//           case order = "sort_order"
//           case description = "description"
//           case red = "red"
//           case green = "green"
//           case blue = "blue"
//           case alpha = "alpha"
//       }
//       let order: Int
//       let description: String
//       let red: Int
//       let green: Int
//       let blue: Int
//       let alpha: Double
//    }
//    let name: String
//    let info: String
//    let colors: [PaletteColor]
//}
//
//let decoder = JSONDecoder()
////decoder.keyDecodingStrategy = .convertFromSnakeCase
//
//guard let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)) else {
//    fatalError("Couldn't load data from \(filePath)")
//}
//
//guard let colorPalette = try? decoder.decode(ColorPalette.self, from: data) else {
//    fatalError( "Couldn't decode JSON")
//}
//
//for color in colorPalette.colors {
//    print(color.description)
//}
//
//
//
