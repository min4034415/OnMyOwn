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
//let booksJSON = """
//[
//  {
//    "feed": {
//      "publisher": "Penguin",
//      "country": "ca"
//    },
//    "entry": [
//      {
//        "author": "Margaret Atwood",
//        "nationality": "Canadian"
//      },
//      {
//        "author": "Dan Brown",
//        "nationality": "American"
//      }
//    ]
//  },
//  {
//    "feed": {
//      "publisher": "Penguin",
//      "country": "ca"
//    },
//    "entry": {
//      "author": "Pierre Burton",
//      "nationality": "Canadian"
//    }
//  }
//]
//"""
//
//struct Book: Decodable {
//    enum CodingKeys: String, CodingKey {
//        case feed, entry
//    }
//    struct Feed: Decodable {
//        let publisher: String
//        let country: String
//    }
//    struct Entry: Decodable {
//        let author: String
//        let nationality: String
//    }
//    let feed: Feed
//    var entry: [Entry]
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.feed = try container.decode(Book.Feed.self, forKey: .feed)
//        do {
//            entry = try container.decode([Book.Entry].self, forKey: .entry)
//            //entry 복수 인경우
//        } catch {
//            let newValue = try container.decode(Book.Entry.self, forKey: .entry)
//            entry = [newValue]
//            // 엔트리 하나 인 경우
//        }
//    }
//}
//
//
//let decoder = JSONDecoder()
//let bookJSONData = booksJSON.data(using: .utf8)!
//let books = try! decoder.decode([Book].self, from: bookJSONData)
//
//for book in books {
//    print("Publisher: \(book.feed.publisher)")
//    for entry in book.entry {
//        print("Author: \(entry.author), Nationality: \(entry.nationality)")
//    }
//    print("---")
//}
//
//
//class User: ObservableObject, Decodable {
//    enum CodingKeys: String, CodingKey {
//        case name, age
//    }
//    @Published var name = "Aidan Lynch"
//    var age = 27
//    
//    
//    //유저가 클래스이기때문에 required 를 쓴다고
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        name = try container.decode(String.self, forKey: .name)
//        age = try container.decode(Int.self, forKey: .age)
//    }
//    
//}
