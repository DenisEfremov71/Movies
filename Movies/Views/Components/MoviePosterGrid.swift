//
//  MoviePosterGrid.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-06.
//

import SwiftUI

struct MoviePosterGrid: View {

    let posters: [PosterViewModel]
    @Binding var selectedPoster: String

    func isSelectedPoster(poster: String) -> Bool {
        selectedPoster == poster
    }

    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
            ForEach(posters) { poster in
                VStack {
                    URLImage(url: poster.poster)
                        .frame(width: 100, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                        .onTapGesture {
                            selectedPoster = poster.poster
                        }
                        .shadow(color: .gray, radius: 6, x: 8, y: 8)
                        .shadow(color: .white, radius: 6, x: -8, y: -8)
                        .overlay(
                            ZStack {
                                Rectangle()
                                    .fill(Color(#colorLiteral(red: 0.1731345952, green: 0.2430219054, blue: 0.313616395, alpha: 1)))
                                Image(systemName: "checkmark.circle.fill")
                            }
                            .frame(maxHeight: isSelectedPoster(poster: poster.poster) ? 44: 0)
                            .clipped()
                            .animation(.spring())

                            , alignment: .bottom)
                }
            }
        }
    }
}

#Preview {
    let movie = Movie(
        title: "Batman",
        year: "2002",
        imdbId: "tt4853102",
        poster: "https://m.media-amazon.com/images/M/MV5BMTdjZTliODYtNWExMi00NjQ1LWIzN2MtN2Q5NTg5NTk3NzliL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"
    )

    return MoviePosterGrid(posters: [PosterViewModel(movie: movie)], selectedPoster: .constant(""))
}
