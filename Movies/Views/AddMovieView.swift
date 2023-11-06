//
//  AddMovieView.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-05.
//

import SwiftUI

struct AddMovieView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var addMovieVM = AddMovieViewModel()

    var body: some View {
        Form {

            TextField("Title", text: $addMovieVM.title) {
                addMovieVM.fetchPostersByMovieName(name: addMovieVM.title.encoded())
            }
            TextField("Year", text: $addMovieVM.year)

            GenreSelection(onSelected: { vm in
                //
            }, ignoreGenres: ["All"])


            MoviePosterGrid(posters: addMovieVM.posters, selectedPoster: $addMovieVM.poster)

        }
        .navigationTitle("Add New Movie")
        .navigationBarItems(trailing: Button("Save") {
        })
        .embedInNavigationView()
    }
}

#Preview {
    AddMovieView()
}
