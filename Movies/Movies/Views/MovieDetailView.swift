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
            VStack(alignment: .center, spacing: 16) {
                Text(movie.title)
                    .font(.title)
                    .bold()
                Text(movie.description)
                    .font(.body)
                    .foregroundStyle(.secondary)
                
                Divider()
                
                if !movie.actors.isEmpty {
                    Text("Actors")
                        .font(.headline)
                        .padding(.top)
                    
                    ForEach(movie.actors, id: \.self) { actor in
                        NavigationLink(value: Destination.actor(actor)) {
                            VStack {
                                Text("\(actor.firstName) \(actor.lastName)")
                            }.padding(.vertical, 4)
                        }
                    }
                }

                Divider()
                
                if !movie.director.moviesDirected.isEmpty {
                    Text("Director(s)")
                        .font(.headline)
                        .padding(.top)
                    
                    NavigationLink(value: Destination.director(movie.director)) {
                        VStack {
                            Text("\(movie.director.firstName) \(movie.director.lastName)")
                            }
                        }.padding(.vertical, 4)
                    }
                    
                
                Divider()
                


            }
            .padding()
        }
        .navigationTitle(movie.title)
    }
}



