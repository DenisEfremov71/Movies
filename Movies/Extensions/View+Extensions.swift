//
//  View+Extensions.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-05.
//

import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
