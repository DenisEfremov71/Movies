//
//  GenreSelection.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-05.
//

import SwiftUI

struct GenreSelection: View {

    let onSelected: (GenreViewModel) -> Void
    var ignoreGenres: [String]?

    @State private var selectedGenre: GenreViewModel = GenreViewModel.defaultGenre
    @StateObject private var genreListVM = GenreListViewModel()

    func prepareGenres() -> [GenreViewModel] {
        guard let ignoreGenres = ignoreGenres else {
            return genreListVM.genres
        }
        return genreListVM.genres.filter { genre in
            !ignoreGenres.contains(genre.name)
        }
    }

    var body: some View {
        Picker("Select", selection: $selectedGenre) {
            ForEach(prepareGenres()) { genre in
                Text(genre.name).tag(genre)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .onAppear {
            genreListVM.getAllGenres()
        }
        .onChange(of: selectedGenre) { value in
            onSelected(value)
        }
    }
}

#Preview {
    GenreSelection(onSelected: { _ in })
}
