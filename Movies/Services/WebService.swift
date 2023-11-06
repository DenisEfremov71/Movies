//
//  WebService.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-06.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}

class WebService {

    func getMoviesBy(name: String, completion: @escaping (Result<[Movie], NetworkError>) -> Void) {

        guard let url = Constants.Urls.urlByMovieName(name: name) else {
            completion(.failure(NetworkError.badUrl))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let data = data, error == nil else {
                completion(.failure(NetworkError.noData))
                return
            }

            guard let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                completion(.failure(NetworkError.decodingError))
                return
            }

            completion(.success(movieResponse.movies))

        }.resume()

    }

}
