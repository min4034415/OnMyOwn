//
//  main.swift
//  OnMyOwn
//
//  Created by Ouimin Lee on 2/24/25.
//
// https://www.youtube.com/watch?v=ivFtzG8Bqkk
// 7. JSON from API - Swift
// Application Programming Interface
/*
 앱 간의 소통을 이야기 함
 서비스들을 이야기 함
 토큰을 필요로 한다
 
 https://api.github.com/users/<name>/followers
 https://api.github.com/users/twostraws/followers
 */
import Foundation

struct GHFollower: Decodable { // Fixed typo in name
    let login: String
    let id: Int
}

//func getJSON() {
//    guard let url = URL(string: "https://api.github.com/users/twostraws/followers") else {
//        print("Invalid URL")
//        return
//    }
//    
//    let request = URLRequest(url: url)
//    let semaphore = DispatchSemaphore(value: 0) // To wait for async completion
//    
//    URLSession.shared.dataTask(with: request) { (data, response, error) in
//        defer { semaphore.signal() } // Ensure semaphore is released
//        
//        if let error = error {
//            print("Error: \(error.localizedDescription)")
//            return
//        }
//        
//        
//        guard let httpResponse = response as? HTTPURLResponse else {
//            print("Invalid response")
//            return
//        }
//        
//        guard (200...299).contains(httpResponse.statusCode) else {
//            print("HTTP Error: Status code \(httpResponse.statusCode)")
//            return
//        }
//        
//        guard let data = data else {
//            print("No data received")
//            return
//        }
//        
//        do {
//            let decoder = JSONDecoder()
//            let followers = try decoder.decode([GHFollower].self, from: data)
//            if followers.isEmpty {
//                print("No followers found.")
//            } else {
//                for follower in followers {
//                    print("\(follower.login) (\(follower.id))")
//                }
//            }
//        } catch {
//            print("Decoding error: \(error.localizedDescription)")
//        }
//    }.resume()
//    
//    semaphore.wait() // Wait for the task to complete
//}
//
//getJSON()

//조금 고치기

//func getJSON(urlString: String, completion: @escaping ([GHFollower]?) -> Void) {
//    guard let url = URL(string: urlString) else {
//        print("Invalid URL")
//        return
//    }
//    
//    let request = URLRequest(url: url)
//    let semaphore = DispatchSemaphore(value: 0) // To wait for async completion
//    
//    URLSession.shared.dataTask(with: request) { (data, response, error) in
//        defer { semaphore.signal() } // Ensure semaphore is released
//        
//        if let error = error {
//            print("Error: \(error.localizedDescription)")
//            completion(nil)
//            return
//        }
//        
//        guard let data = data else {
//            print("No data received")
//            completion(nil)
//            return
//        }
//        
//        let decoder = JSONDecoder()
//        guard let decodedData = try? decoder.decode([GHFollower].self, from: data) else {
//            print("Decoding error")
//            completion(nil)
//            return
//        }
//        
//        completion(decodedData)
//    }.resume()
//    
//    semaphore.wait() // Wait for the task to complete
//}
//
//getJSON(urlString: "https://api.github.com/users/octocat/followers") { (followers) in
//    if let followers = followers {
//        for follower in followers {
//            print("\(follower.login) (\(follower.id))")
//        }
//    }
//}


// 리팩토링에 대해서 배워보는 듯해요

func getJSON<T: Decodable>(urlString: String, completion: @escaping (T?) -> Void) {
    guard let url = URL(string: urlString) else {
        print("Invalid URL")
        return
    }
    
    let request = URLRequest(url: url)
    let semaphore = DispatchSemaphore(value: 0) // To wait for async completion
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        defer { semaphore.signal() } // Ensure semaphore is released
        
        if let error = error {
            print("Error: \(error.localizedDescription)")
            completion(nil)
            return
        }
        
        guard let data = data else {
            print("No data received")
            completion(nil)
            return
        }
        
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            print("Decoding error")
            completion(nil)
            return
        }
        
        completion(decodedData)
    }.resume()
    
    semaphore.wait() // Wait for the task to complete
}

//getJSON(urlString: "https://api.github.com/users/octocat/followers") { (followers:[GHFollower]?) in
//    if let followers = followers {
//        for follower in followers {
//            print("\(follower.login) (\(follower.id))")
//        }
//    }
//}

//getJSON(urlString: "https://itunes.apple.com/search?term=NewJeans&entity=song&limit=25") { (searchResults: ITunesSearchResults?) in
//    if let searchResults = searchResults {
//        for result in searchResults.results {
//            print("\(result.trackName) (\(result.artistName))")
//        }
//    }
//}
// Example 2: Fetching songs from iTunes API
getJSON(urlString: "https://itunes.apple.com/search?term=NewJeans&entity=song&limit=25") { (searchResults: ITunesSearchResults?) in
    if let searchResults = searchResults {
        for result in searchResults.results {
            print("\(result.trackName) by \(result.artistName)")
        }
    }
}
