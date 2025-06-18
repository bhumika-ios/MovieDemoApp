//
//  ApiService.swift
//  MovieDemoApp
//
//  Created by Bhumika Patel on 18/06/25.
//

import SwiftUI
import Foundation

class APIService {
    static let shared = APIService()
    private let apiKey = "7d0a77003dafbde2bd50c69171d01989"
    private let baseURL = "https://api.themoviedb.org/3"

    func fetchPopularMovies(completion: @escaping ([Movie]) -> Void) {
        let urlStr = "\(baseURL)/movie/popular?api_key=\(apiKey)&language=en-US"
        fetchMovies(from: urlStr, completion: completion)
    }

    func searchMovies(query: String, completion: @escaping ([Movie]) -> Void) {
        let queryEncoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlStr = "\(baseURL)/search/movie?api_key=\(apiKey)&query=\(queryEncoded)"
        fetchMovies(from: urlStr, completion: completion)
    }

    private func fetchMovies(from urlStr: String, completion: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: urlStr) else {
            completion([])
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data,
                  let decoded = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                completion([])
                return
            }
            DispatchQueue.main.async {
                completion(decoded.results)
            }
        }.resume()
    }
}
struct MovieResponse: Codable {
    let results: [Movie]
}


struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String?
    let release_date: String
    let vote_average: Double
}
