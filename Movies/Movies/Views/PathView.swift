//
//  PathView.swift
//  Movies
//
//  Created by Robin Roelandt on 02/12/2025.
//

import SwiftUI

struct PathView: View {
    @Environment(PathStore.self) var pathStore
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            List {
                ForEach(Array(pathStore.path.enumerated()), id: \.element) { index, destination in
                    Text("Step \(index + 1): \(destination.description)")
                }
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case let .actor(actor):
                    ActorDetailView(actor: actor)
                case let .director(director):
                    DirectorDetailView(director: director)
                case let .movie(movie):
                    MovieDetailView(movie: movie)
                }
            }
            .navigationTitle("Home")
            .padding()
        }
    }
}

