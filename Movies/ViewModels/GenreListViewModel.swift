//
//  GenreListViewModel.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-05.
//

import Foundation
import Apollo
import MoviesAPI

class GenreListViewModel: ObservableObject {

    @Published var genres: [GenreViewModel] = []
    @Published var errors: [String] = []

    func getAllGenres() {

        Network.shared.apollo.fetch(query: GetAllGenresQuery()) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let graphQLResult):

                guard let data = graphQLResult.data, let genres = data.genres else {
                    return
                }

                if let errors = graphQLResult.errors {
                    DispatchQueue.main.async {
                        self.errors = errors.map { $0.localizedDescription }
                    }
                    return
                }

                DispatchQueue.main.async {
                    self.genres = genres.compactMap { $0 }.map(GenreViewModel.init)
                }

            case .failure(let error):
                DispatchQueue.main.async {
                    self.errors.append(error.localizedDescription)
                }
            }

        }
    }
}

struct GenreViewModel: Identifiable, Hashable {

    let id = UUID()

    fileprivate let genre: GetAllGenresQuery.Data.Genre

    var name: String {
        genre.name
    }

    static var defaultGenre: GenreViewModel {
        let data: [String: AnyHashable] = ["name": "All"]
        let dataDict = DataDict(data: data, fulfilledFragments: [])
        return GenreViewModel(genre: GetAllGenresQuery.Data.Genre(_dataDict: dataDict))
    }

    public static func ==(lhs: GenreViewModel, rhs: GenreViewModel) -> Bool {
        lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

}
