//
//  GenreSelection.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-05.
//

import SwiftUI

struct GenreSelection: View {

    let onSelected: (GenreViewModel) -> Void

    @State private var selectedGenre: GenreViewModel = GenreViewModel.defaultGenre
    @StateObject private var genreListVM = GenreListViewModel()

    var body: some View {
        Picker("Select", selection: $selectedGenre) {
            ForEach(genreListVM.genres) { genre in
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
