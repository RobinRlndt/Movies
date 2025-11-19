//
//  MovieDataStore.swift
//  Movies
//
//  Created by Dirk Hostens on 04/12/2023.
//

import Foundation

@Observable
class MovieDataStore {
     var movies = [Movie]
    
    init(){
        movies = [Movie]()
    }
    
    func getMovies() -> [Movie] {
        return movies 
    }
    
   func getMovies(actor: Actor) -> [Movie] {
    let filteredMovies = movies.filter { movie in
        return movie.actors.contains(actor)
    }
    return filteredMovies
}

    
    func getMovies(director: Director) -> [Movie] {
    let filteredMovies = movies.filter { movie in
        return movie.director == director
    }
    return filteredMovies
}

    
   func getACtors(director: Director) -> [Actor] {
    let filteredMovies = movies.filter { movie in
        return movie.director == director
    }
    
    let allActors = filteredMovies.flatMap { movie in
        movie.actors
    }
    
    let uniqueActors = Array(Set(allActors))
    
    return uniqueActors
}

    
    private func sort() {
       movies.sort { m1, m2 in
          m1.releaseDate < m2.releaseDate
     }
    }
    
    func loadData() async {
        //simulate async call
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2)) // Simulate long load
            // load movies
            let data: [MovieJson] = try load("movies.json")
             movies = data.map({ movieJson in
               movieJson.toMovie()
               })
            // sort
             sort()
            print("✅ Data loaded successfully.")
            
        } catch {
            print("❌ Failed to load uurrooster:", error)
            //movies is lege array
             movies = [Movie]()
        }
    }

