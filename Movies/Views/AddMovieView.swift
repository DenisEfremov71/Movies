//
//  AddMovieView.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-05.
//

import SwiftUI

struct AddMovieView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var addMovieVM = AddMovieViewModel()

    var isFormValid: Bool {
        guard !addMovieVM.title.isEmpty && !addMovieVM.year.isEmpty && !addMovieVM.genre.isEmpty && !addMovieVM.poster.isEmpty else {
            return false
        }
        guard let _ = URL(string: addMovieVM.poster) else {
            return false
        }
        return true
    }

    var body: some View {
        Form {

            TextField("Title", text: $addMovieVM.title) {
                addMovieVM.fetchPostersByMovieName(name: addMovieVM.title.encoded())
            }
            TextField("Year", text: $addMovieVM.year)

            GenreSelection(onSelected: { vm in
                addMovieVM.genre = vm.name
            }, ignoreGenres: ["All"])


            MoviePosterGrid(posters: addMovieVM.posters, selectedPoster: $addMovieVM.poster)

        }
        .navigationTitle("Add New Movie")
        .navigationBarItems(
            trailing: Button("Save") {
                addMovieVM.addMovie {
                    dismiss()
                }
            }.disabled(!isFormValid)
        )
        .embedInNavigationView()
    }
}

#Preview {
    AddMovieView()
}
