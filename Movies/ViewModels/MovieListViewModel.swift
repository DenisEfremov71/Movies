//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-05.
//

import Foundation
import Apollo
import MoviesAPI

class MovieListViewModel: ObservableObject {

    @Published var movies: [MovieViewModel] = []
    @Published var errors: [String] = []

    func getAllMovies(genre: GraphQLNullable<String>) {

        Network.shared.apollo.fetch(query: GetAllMoviesQuery(genre: genre), cachePolicy: .fetchIgnoringCacheData) { [weak self] result in

            guard let self = self else {
                return
            }

            switch result {
            case .success(let graphQLResult):

                guard let data = graphQLResult.data, let movies = data.movies else {
                    return
                }

                if let errors = graphQLResult.errors {
                    DispatchQueue.main.async {
                        self.errors = errors.map { $0.localizedDescription }
                    }
                    return
                }

                DispatchQueue.main.async {
                    self.movies = movies.compactMap { $0 }.map(MovieViewModel.init)
                }

            case .failure(let error):
                DispatchQueue.main.async {
                    self.errors.append(error.localizedDescription)
                }
            }
        }
    }

    func deleteMovie(movieId: String) {

        Network.shared.apollo.perform(mutation: DeleteMovieMutation(movieId: movieId)) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(_):
                self.getAllMovies(genre: .null)
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errors.append(error.localizedDescription)
                }
            }
        }

    }

}

struct MovieViewModel: Identifiable {

    let movie: GetAllMoviesQuery.Data.Movie

    var id: MoviesAPI.ID {
        movie.id
    }

    var title: String {
        movie.title
    }

    var year: String {
        movie.year
    }

    var genre: String {
        movie.genre
    }

    var poster: String {
        movie.poster
    }
}
