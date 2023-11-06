//
//  PosterViewModel.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-06.
//

import Foundation

struct PosterViewModel: Identifiable {

    let movie: Movie
    let id = UUID()

    var title: String {
        movie.title
    }

    var year: String {
        movie.year
    }

    var poster: String {
        movie.poster
    }

}
