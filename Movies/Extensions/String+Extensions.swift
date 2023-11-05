//
//  String+Extensions.swift
//  Movies
//
//  Created by Denis Efremov on 2023-11-05.
//

import Foundation

extension String {
    func encoded() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
