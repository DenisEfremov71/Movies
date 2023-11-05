//
//  MovieList.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-05.
//

import SwiftUI
import MoviesAPI

struct MovieList: View {

    let movies: [MovieViewModel]
    var onDeleteMovie: ((String) -> Void)?

    private func deleteMovie(at indexSet: IndexSet) {

    }

    var body: some View {
        List {
            ForEach(movies) { movie in
                HStack {
                    URLImage(url: "\(movie.poster)")
                        .frame(width: 100, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .padding(.top, 10)
                            .font(.headline)
                        Text(movie.year)
                            .font(.caption)

                        HStack {
                            Text(movie.genre)
                                .font(.caption)
                                .foregroundColor(.black)
                                .padding(8)

                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 0.5)
                        )

                        Spacer()
                    }
                }
            }.onDelete(perform: deleteMovie)
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    let data: [String: AnyHashable] = [
        "id": "1",
        "title": "Batman: The Killing Joke",
        "year": "2016",
        "genre": "Fiction",
        "poster": "https://m.media-amazon.com/images/M/MV5BMTdjZTliODYtNWExMi00NjQ1LWIzN2MtN2Q5NTg5NTk3NzliL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"
    ]
    let dataDict = DataDict(data: data, fulfilledFragments: [])
    let movie = GetAllMoviesQuery.Data.Movie(_dataDict: dataDict)
    return MovieList(movies: [MovieViewModel(movie: movie)])
}
