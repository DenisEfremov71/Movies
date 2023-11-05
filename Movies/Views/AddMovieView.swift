//
//  AddMovieView.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-05.
//

import SwiftUI

struct AddMovieView: View {
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        Form {

            Text("TextField For the Name")
            Text("TextField For the Year")
            Text("Picker For the Genre Selection")


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
