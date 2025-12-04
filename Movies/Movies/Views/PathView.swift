//
//  PathView.swift
//  Movies
//
//  Created by Robin Roelandt on 02/12/2025.
//

import SwiftUI

struct PathView: View {
    let destination: Destination
    
    var body: some View {
        Group {
                switch destination {
                case let .actor(actor):
                    ActorDetailView(actor: actor)
                case let .director(director):
                    DirectorDetailView(director: director)
                case let .movie(movie):
                    MovieDetailView(movie: movie)
                }
            }
        }
    }


