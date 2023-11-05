//
//  NoResult.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-05.
//

import SwiftUI

struct NoResult: View {
    let message: String

    var body: some View {
        HStack {
            Image(systemName: "exclamationmark.circle")
                .foregroundColor(.yellow)
            Text(message)
        }
        .padding()
    }
}

#Preview {
    NoResult(message: "No movies found")
}
