//
//  ContentView.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-05.
//

import SwiftUI

struct MovieListView: View {

    @StateObject private var movieListVM = MovieListViewModel()
    @State private var isPresented: Bool = false

    var body: some View {
        VStack {

            GenreSelection() { vm in
                switch vm.name {
                case "All":
                    movieListVM.getAllMovies(genre: .null)
                default:
                    movieListVM.getAllMovies(genre: .some(vm.name))
                }
            }

            Spacer()

            if !movieListVM.movies.isEmpty {
                MovieList(movies: movieListVM.movies)
            } else {
                NoResult(message: "No movies found")
            }

            Spacer()

            if !movieListVM.errors.isEmpty {
                let errorMessage = movieListVM.errors.joined(separator: ";;; ")
                Text(errorMessage)
                    .lineLimit(3)
                Spacer()
            }

        }
        .sheet(isPresented: $isPresented, onDismiss: {

        }, content: {
            AddMovieView()
        })
        .onAppear(perform: {
            movieListVM.getAllMovies(genre: .null)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
        }, label: {
            Image(systemName: "plus")
        }))
        .navigationTitle("Movies")
        .embedInNavigationView()
    }
}

#Preview {
    MovieListView()
}
