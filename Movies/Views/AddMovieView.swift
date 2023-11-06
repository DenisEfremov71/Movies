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
                // perform a call to omdbapi REST API to get the posters
            }
            TextField("Year", text: $addMovieVM.year)

            GenreSelection(onSelected: { vm in
                //
            }, ignoreGenres: ["All"])


            Text("Show Movie Posters in Grid")

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
