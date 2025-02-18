import Foundation
let currentPath = "/Users/ouiminlee/Downloads/OnMyOwn/OnMyOwn/Resources"
let fileManager = FileManager.default

//let fileManager = FileManager.default
//let currentPath = fileManager.currentDirectoryPath

if fileManager.fileExists(atPath: filePath) {
    let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
    print(fileContents)
} else {
    print("File not found!")
}


let personJson = """
{
  "id" : 7,
  "name" : "Aidan Lynch",
  "birthday" : "27-03-1993",
}
"""

struct Person: Decodable {
    let id: Int
    let name: String
    let birthday: Date
}

let formatter = DateFormatter()
formatter.dateFormat = "dd-MM-yyyy"

let personJSONData = personJson.data(using: .utf8)!
let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .formatted(formatter)
let thisPerson = try! decoder.decode(Person.self, from: personJSONData)
print(thisPerson.birthday)

struct Event: Decodable {
    let name: String
    let date: Date
    let website: URL
}



//guard let sourceURL = Bundle.main.url(forResource: "FlatColors", withExtension: "json") else {
//    fatalError("Could not find JSON file!")
//}

let filePath = "\(currentPath)/Events.json"

//guard let sourceURL = fileManager.fileExists(atPath: filePath) ? URL(fileURLWithPath: filePath) : nil else {
guard let sourceURL = fileManager.fileExists(atPath: filePath) ? URL(fileURLWithPath: filePath) : nil else {
    fatalError( "Could not find JSON file!")
}
//let url = URL(forResource: "FlatColors", withExtension: "json", subdirectory: nil, in: .module)


guard let sourcesURL = Bundle.main.url(forResource: "Events", withExtension: "json") else {
    fatalError("Could not find JSON file!")
}

print(Bundle.main.resourcePath!)

guard let eventJSONData = try? Data(contentsOf: sourceURL) else {
    fatalError("Could not read JSON file!")
}

let decoder2 = JSONDecoder()
decoder2.dateDecodingStrategy = .secondsSince1970

guard let events = try? decoder2.decode([Event].self, from: eventJSONData) else {
    fatalError("Could not decode JSON!")
}

for event in events {
    print(event.name)
    print(event.date)
    print(event.website)
    print("---")
}

