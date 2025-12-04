//
//  ActorDetailView.swift
//  Movies
//
//  Created by Robin Roelandt on 02/12/2025.
//

import SwiftUI

struct ActorDetailView: View {
    @Environment(MovieDataStore.self) var movieDataStore
    let actor: Actor
    
    var body: some View {
        ScrollView {
            Text("\(actor.firstName) \(actor.lastName)")
                .font(.title)
                .bold()
            
            Divider()
            Text("Birthday: \(actor.birthday)")
            
            Divider()
        
            
            if !movieDataStore.getMovies(actor: actor).isEmpty {
                Text("Movie(s)")
                    .font(.headline)
                    .padding(.top)
                
                ForEach(movieDataStore.getMovies(actor: actor), id: \.self) { movie in
                    NavigationLink(value: Destination.movie(movie)) {
                        VStack {
                            Text("\(movie.title)")
                        }.padding(.vertical, 4)
                    }
                }
            }
            
            Divider()
          
            
            

            
        }.navigationTitle("Actor: \(actor.firstName) \(actor.lastName)")
        
    }

}


