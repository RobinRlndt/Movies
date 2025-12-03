//
//  MovieDataStore.swift
//  Movies
//
//  Created by Dirk Hostens on 04/12/2023.
//

import Foundation

@Observable
class MovieDataStore {
    var movies: [Movie] = []
    
    
    func getMovies() -> [Movie] {
        return movies
    }
    
    func getMovies(actor: Actor) -> [Movie] {
        let filteredMovies = movies.movies.filter { movie in
            return movie.actors.contains(actor)
        }
        return filteredMovies
    }
    
    
    func getMovies(director: Director) -> [Movie] {
        let filteredMovies = movies.movies.filter { movie in
            return movie.director == director
        }
        return filteredMovies
    }
    
    
    func getActors(director: Director) -> [Actor] {
        let filteredMovies = movies.movies.filter { movie in
            return movie.director == director
        }
        
        let allActors = filteredMovies.flatMap { movie in
            movie.actors
        }
        
        let uniqueActors = Array(Set(allActors))
        
        return uniqueActors
    }
    
    
      private func sort() {
        movies.sort { $0.releaseDate < $1.releaseDate }
    }
    
    func loadData() async {
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2))
            
            // Assumes load("movies.json") returns [Movie] directly
            let data: [Movie] = load("movies.json")
            movies = data
            sort()
            print("✅ Data loaded successfully (\(movies.count) movies).")
            
        } catch {
            print("❌ Failed to load movies: \(error)")
            movies = []
        }
    }
    
}
