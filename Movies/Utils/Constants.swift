//
//  Constants.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-05.
//

import Foundation

struct Constants {

    struct Keys {
        static let apiKey = "d7b0633b"
    }

    struct Urls {

        static func urlByMovieName(name: String) -> URL? {
            return URL(string: "http://www.omdbapi.com/?s=\(name)&page=2&apikey=\(Keys.apiKey)")
        }
    }
}
