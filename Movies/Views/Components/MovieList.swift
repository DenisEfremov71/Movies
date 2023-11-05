//
//  MovieList.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-05.
//

import SwiftUI

struct MovieList: View {
    var onDeleteMovie: ((String) -> Void)?

    private func deleteMovie(at indexSet: IndexSet) {

    }

    var body: some View {
        List {
            ForEach(1...20, id: \.self) { index in
                HStack {
                    URLImage(url: "\(index)")
                        .frame(width: 100, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
                    VStack(alignment: .leading) {
                        Text("Movie Name \(index)")
                            .padding(.top, 10)
                            .font(.headline)
                        Text("Movie Year \(index)")
                            .font(.caption)

                        HStack {
                            Text("Movie Genre \(index)")
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
    MovieList()
}
