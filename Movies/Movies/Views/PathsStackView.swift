//
//  PathsStackView.swift
//  Movies
//
//  Created by Robin Roelandt on 04/12/2025.
//

import SwiftUI

struct PathsStackView: View {
    @Environment(PathStore.self) var pathStore
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Navigation Path")
                .font(.headline)
                .padding(.top)
            
            if pathStore.path.isEmpty {
                Text("Empty")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            } else {
                ForEach(Array(pathStore.path.enumerated()), id: \.element) { index, destination in
                    HStack {
                    switch destination {
                            case .movie(let movie):
                            Text(movie.title)
                            case .actor(let actor):
                            Text("\(actor.firstName) \(actor.lastName)")
                            case .director(let director):
                            Text("\(director.firstName) \(director.lastName)")
                        }
                    }
                }
            }
        }
    }
}

