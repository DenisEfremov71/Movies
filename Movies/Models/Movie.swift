//
//  Movie.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-06.
//

import Foundation

struct MovieResponse: Decodable {

    let movies: [Movie]

    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Decodable {

    let title: String
    let year: String
    let imdbId: String
    let poster: String

    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
    }

}
