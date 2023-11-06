//
//  AddMovieViewModel.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-05.
//

import SwiftUI
import MoviesAPI

class AddMovieViewModel: ObservableObject {
    
    @Published var errors: [String] = []
    @Published var poster: String = ""
    @Published var posters: [PosterViewModel] = []
    var title: String = ""
    var year: String = ""
    var genre: String = ""

    func addMovie(completion: @escaping () -> Void) {
        let movie = MovieInput(title: title, year: year, genre: genre, poster: poster)

        Network.shared.apollo.perform(mutation: AddMovieMutation(movie: .some(movie))) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let graphQLResult):
                if let errors = graphQLResult.errors {
                    DispatchQueue.main.async {
                        self.errors = errors.map { $0.localizedDescription }
                    }
                }
                completion()
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errors.append(error.localizedDescription)
                }
            }
        }
    }

    func fetchPostersByMovieName(name: String) {

        WebService().getMoviesBy(name: name) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self.posters = movies.map(PosterViewModel.init)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errors.append(error.localizedDescription)
                }
            }
        }

    }

}
