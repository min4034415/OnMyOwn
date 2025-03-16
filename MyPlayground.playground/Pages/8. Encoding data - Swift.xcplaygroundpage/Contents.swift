
import Foundation

var greeting = "Hello, playground"


class User: Codable, ObservableObject {
    enum CodingKeys: String, CodingKey {
        case name
        case age_in_years
    }
    @Published var name: String = "Aidan Lynch"
    var age = 27
    
    init(name : String, age: Int) {
        self.name = name
        self.age = age
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        age = try container.decode(Int.self, forKey: .age_in_years)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age_in_years)
    }
}

let Terry = User(name: "Terry", age: 27)
let encoder4 = JSONEncoder()
let TerryJSONData = try! encoder4.encode(Terry)
print(String(data: TerryJSONData, encoding: .utf8)!)

