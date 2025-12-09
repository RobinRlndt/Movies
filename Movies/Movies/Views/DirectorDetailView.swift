//
//  DirectorDetailView.swift
//  Movies
//
//  Created by Robin Roelandt on 02/12/2025.
//

import SwiftUI

struct DirectorDetailView: View {
    
    @Environment(MovieDataStore.self) var movieDataStore
    let director: Director
    
    var body: some View {
        ScrollView {
            Text("\(director.firstName) \(director.lastName)")
                .font(.title)
                .bold()
            
            Divider()
        
            
            if !movieDataStore.getMovies(director: director).isEmpty {
                Text("Movie(s)")
                    .font(.headline)
                    .padding(.top)
                
                ForEach(movieDataStore.getMovies(director: director), id: \.self) { movie in
                    NavigationLink(value: Destination.movie(movie)) {
                        VStack {
                            Text("\(movie.title)")
                        }.padding(.vertical, 4)
                    }
                }
            }
            
            Divider()
        
            
            if !movieDataStore.getActors(director: director).isEmpty {
                Text("Director works with:")
                    .padding(.top)
                
                ForEach(movieDataStore.getActors(director: director), id: \.self) { actor in
                    NavigationLink(value: Destination.actor(actor)) {
                        VStack {
                            Text("\(actor.firstName) \(actor.firstName)")
                        }.padding(.vertical, 4)
                    }
                }
            }
            
            Divider()
           
            
            

            
        }.navigationTitle("Director: \(director.firstName) \(director.lastName)")
    }
}

