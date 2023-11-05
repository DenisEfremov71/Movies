//
//  Apollo.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-05.
//

import Foundation
import Apollo

class Network {

    static let shared: Network = Network()

    private init() {}

    lazy var apollo = ApolloClient(url: URL(string: "http://localhost:4000")!)

}
