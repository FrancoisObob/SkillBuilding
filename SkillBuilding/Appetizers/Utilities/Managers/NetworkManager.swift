//
//  NetworkManager.swift
//  SkillBuilding
//
//  Created by Francois Lambert on 10/17/23.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()

    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"

    private init() {}

    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APError.invalidResponse
        }

        do {
            let decodedResponse = try JSONDecoder().decode(AppetizersResponse.self, from: data)
            return decodedResponse.request
        } catch  {
            throw APError.invalidData
        }
    }

    private let cache = NSCache<NSString, UIImage>()

    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }

        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }


        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }

            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }

        task.resume()
    }
}

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

