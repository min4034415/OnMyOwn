import Cocoa

var greeting = "Hello, playground"



//let url = URL(fileURLWithPath: "/Users/jason/Desktop/test.txt")
//let url = URL(string: "https://www.naver.com")

//print(url ?? "url error")

let url = URL(string: "https://dog.ceo/api/breeds/image/random")

struct DogImage: Decodable  {
    let message: String
    let status: String
}
let jsonDecoder = JSONDecoder()

let jsonData = try! Data(contentsOf: url!)
let dogImage = try! jsonDecoder.decode(DogImage.self, from: jsonData)

dogImage.message
dogImage.status
