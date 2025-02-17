import Foundation
/*:
### Simple Objects
*/
let person1JSON = """
{
   "name": "James",
   "age": 45,
   "gender": "Male",
   "sign": "Sagitarius",
   "partner": "Emily",
   "isEmployed": true
}
"""

struct Person: Decodable {
   let name: String
   let age: Int
   let gender: String
//   let sign: String
   let partner: String?
   let isEmployed: Bool
}

let decoder = JSONDecoder()
let person1JSONData = person1JSON.data(using: .utf8)!
let person1 = try! decoder.decode(Person.self, from: person1JSONData)
print(person1.name)
print(type(of: Person.self))
print(person1.partner ?? "No partner")


let person2JSON = """
{
   "name": "Mary",
   "age": 45,
   "gender": "Female",
   "sign": "Taurus",
   "isEmployed": false
}
"""

let person2JSONData = person2JSON.data(using: .utf8)!
let person2 = try! decoder.decode(Person.self, from: person2JSONData)
print(person2.name)
print(person2.partner ?? "No partner")
if let partnerName = person2.partner {
    print("\(partnerName) is also a \(person2.gender)")
}



/*:
### Arrays
*/
let personsJSON = """
[
   {
       "name": "James",
       "age": 45,
       "gender": "Male",
       "sign": "Sagitarius",
       "partner": "Emily",
       "isEmployed": true
   },
   {
       "name": "Mary",
       "age": 45,
       "gender": "Female",
       "sign": "Taurus",
       "isEmployed": false
   }
]
"""

let personsJSONData = personsJSON.data(using: .utf8)!
//let persons = try! decoder.decode([Person].self, from: personsJSONData)
//print(persons[0].isEmpty)
//print(persons[1].isEmpty)
let personsArray: [Person] = try! JSONDecoder().decode([Person].self, from: personsJSONData)
for person in personsArray {
    print("\(person.name)'s partner is \(person.partner ?? "none")")
}


/*:
#### More Complex Objects
*/
let familyJSON = """
{
   "familyName": "Smith",
   "members": [
       {
           "name": "James",
           "age": 45,
           "gender": "Male",
           "sign": "Sagitarius",
           "partner": "Emily",
           "isEmployed": true
       },
       {
           "name": "Mary",
           "age": 45,
           "gender": "Female",
           "sign": "Taurus",
           "isEmployed": false
       }
   ]
}
"""
struct Family: Decodable {
    let familyName: String
    let members: [Person]
}

let familyJSONData = familyJSON.data(using: .utf8)!
let myfamily = try! decoder.decode(Family.self, from: familyJSONData)
print(myfamily.familyName)
for member in myfamily.members {
//    print(member.name)
}


/*:
## A Better model
*/

struct Family2: Decodable {
    
    enum Gender: String, Decodable {
        case Male, Female, Other
    }
    
    struct Person: Decodable {
       let name: String
       let age: Int
       let gender: Gender
       let partner: String?
       let isEmployed: Bool
    }
    let familyName: String
    let members:[Person]
}


let myfamily2 = try! decoder.decode(Family2.self, from: familyJSONData)
print(myfamily2.familyName)
for member in myfamily2.members {
    print(member.name)
    print(member.gender)
}


/*:
 


[< Previous](@previous)           [Home](Introduction)           [Next >](@next)
*/


struct ColorPalette: Decodable {
    struct ParletteColor: Decodable {
        let sort_order: Int
        let description: String
        let red: Int
        let green: Int
        let blue: Int
        let alpha: Double
    }
    let parlette_name: String
    let parlette_info: String
    let parlette_colors: [ParletteColor]
}

print(Bundle.main.url(forResource: "FlatColors", withExtension: "json"))

guard let sourceURL = Bundle.main.url(forResource: "FlatColors", withExtension: "json") else {
    fatalError("Couldn't find FlatColors.json in bundle.")
}
print(sourceURL)

guard let colorData = try? Data(contentsOf: sourceURL) else {
    fatalError("Couldn't read data from URL.")
}
//print(colorData)
guard let flatColors = try? decoder.decode(ColorPalette.self, from: colorData) else {
    fatalError( "Couldn't decode JSON into ColorPalette.")
}
//
//print(flatColors.parlette_name)



