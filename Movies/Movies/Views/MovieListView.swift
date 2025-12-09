//
//  MovieListView.swift
//  Movies
//
//  Created by Robin Roelandt on 02/12/2025.
//

import SwiftUI

struct MovieListView: View {
    @Environment(MovieDataStore.self) var movieDataStore
    @Environment(PathStore.self) var pathStore
    @State var loading = true
    
    var body: some View {
        @Bindable var pathBinding = pathStore
        
        NavigationStack(path: $pathBinding.path) { 
            if loading {
                ProgressView("Loading...")
                    .navigationTitle("Movies")
            } else {
                List(movieDataStore.getMovies(), id: \.self) { movie in
                    NavigationLink(value: Destination.movie(movie)) {
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.headline)
                            Text(movie.description)
                                .font(.caption)
                            Divider()
                        }
                    }
                }
                .navigationTitle("Movies")
                .navigationDestination(for: Destination.self) { destination in
                    PathView(destination: destination)
                }
            }
        }
        .task {
            await movieDataStore.loadData()
            loading = false
        }
    }
}





        
 


