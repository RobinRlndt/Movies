//
//  MovieDetailView.swift
//  Movies
//
//  Created by Robin Roelandt on 02/12/2025.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(movie.title)
                    .font(.title)
                    .bold()
                
                Text(movie.description)
                    .font(.body)
                    .foregroundStyle(.secondary)
                
                if !movie.actors.isEmpty {
                    Text("Actors")
                        .font(.headline)
                        .padding(.top)
                    
                    ForEach(movie.actors, id: \.self) { actor in
                        Text("\(actor.firstName) \(actor.lastName)")
                            .font(.subheadline)
                            .padding(.vertical, 2)
                    }
                }

            }
            .padding()
        }
        .navigationTitle(movie.title)
    }
}



