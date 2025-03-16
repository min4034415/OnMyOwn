//
//  main.swift
//  OnMyOwn
//
//  Created by Ouimin Lee on 3/6/25.
//

import Foundation

//struct Person: Decodable {
//    let name: String
//    let age: Int
//    var gender: String
//    var partner: String?
//    var isEmployed: Bool
//}

/*
디코딩만 할 경우 Decodable
인코딩만 할 경우 Encodable
둘다 할 경우 Codable
*/
struct Person: Codable {
    let name: String
    let age: Int
    var gender: String
    var partner: String?
    var isEmployed: Bool
}
//create random people
var people = [
    Person(name: "James", age: 45, gender: "Male", partner: "Emily", isEmployed: true),
    Person(name: "Elizabeth", age: 45, gender: "Other", isEmployed: false)
]

let encoder = JSONEncoder()
let peopleJSONData = try! encoder.encode(people)

//print(String(data: peopleJSONData, encoding: .utf8)!)

struct Family: Codable {
    enum Gender: String, Codable {
        case Male, Female, Other
    }
    struct Person: Codable {
        let name: String
        let age: Int
        let gender: Gender
        let partner: String?
        let isEmployed: Bool
    }
    var familyName: String
    var members: [Person]
}

let myFamily = Family(familyName: "Smith",
                      members: [
                        Family.Person(name: "James", age: 45, gender: .Male, partner: "Emily", isEmployed: true),
                        Family.Person(name: "Elizabeth", age: 45, gender: .Other, partner: nil, isEmployed: false)
                      ])

let encoder2 = JSONEncoder()
let myFamilyJSONData = try! encoder2.encode(myFamily)
print(String(data: myFamilyJSONData, encoding: .utf8)!)

struct Event: Codable {
    let name: String
    let date: Date
    let website: URL
}

let myEvents = [
    Event(name: "Vancouver Envent", date: Date(), website: URL(string: "https://www.vancouverconventioncentre.com")!),
    Event(name: "Los Angelas", date: Date() + 30, website: URL(string: "https://www.staplescenter.com")!)
]

let encoder3 = JSONEncoder()
encoder3.dateEncodingStrategy = .millisecondsSince1970
let myEventsJSONData = try! encoder3.encode(myEvents)
print(String(data: myEventsJSONData, encoding: .utf8)!)
var greeting = "Hello, playground"




