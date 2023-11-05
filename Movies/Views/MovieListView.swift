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

            Picker("Select", selection: .constant("Foo")) {
                Text("All")
                Text("Fiction")
                Text("Kids")
                Text("Horror")
            }.pickerStyle(SegmentedPickerStyle())

            Spacer()

            if !movieListVM.movies.isEmpty {
                MovieList(movies: movieListVM.movies)
            } else {
                NoResult(message: "No movies found")
            }

            Spacer()

        }
        .sheet(isPresented: $isPresented, onDismiss: {

        }, content: {
            AddMovieView()
        })
        .onAppear(perform: {
            movieListVM.getAllMovies()
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
