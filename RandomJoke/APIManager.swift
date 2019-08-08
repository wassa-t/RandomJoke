//
//  APIManager.swift
//  RandomJoke
//
//  Created by Wassa Tunsiri on 8/8/2562 BE.
//  Copyright © 2562 Wassa. All rights reserved.
//

import Foundation

class APIManager {
    func getRandomJoke() -> String {
        var joke = ""
        
        guard let url =
            URL(string: "https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random")
        else {
            print("hello")
            return ""
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("d7cd140d6emsh9d6e2be744bfd51p13f344jsn471a4d8ce9d5", forHTTPHeaderField: "x-rapidapi-key")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data, let httpResponse = response as? HTTPURLResponse {
                
                print(data)
                print("statusCode: \(httpResponse.statusCode)")
                print(NSString(data: data, encoding: String.Encoding.utf8.rawValue))
                
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let dictionary = json as? [String: Any] {
                    if let value = dictionary["value"] as? String {
                        print(value)
                        joke = value
                    }
                }
                
                }
            }
        
        task.resume()
        return joke
    }
}
