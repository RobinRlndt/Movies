//
//  PathStore.swift
//  Movies
//
//  Created by Robin Roelandt on 02/12/2025.
//

import Foundation

enum Destination: Hashable {
    case movie(Movie)
    case actor(Actor)
    case director(Director)
}

@Observable
class PathStore {
    var path = [Destination]()
}
