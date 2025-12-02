//
//  MovieDataStore.swift
//  Movies
//
//  Created by Dirk Hostens on 04/12/2023.
//

import Foundation

@Observable
class MovieDataStore {
    private var movies = Movies()
    
    init(){
        movies.movies = [Movie]()
    }
    
    func getMovies() -> [Movie] {
        return movies.movies
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
        movies.movies.sort { m1, m2 in
            m1.releaseDate < m2.releaseDate
        }
    }
    
    func loadData() async {
        //simulate async call
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2)) // Simulate long load
            // load movies
            let data: [Movie] = load("movies.json")
            movies.movies = data
            
            // sort
            sort()
            print("✅ Data loaded successfully.")
            
        } catch {
            print("❌ Failed to load uurrooster:", error)
            //movies is lege array
            movies.movies = [Movie]()
        }
    }
    
}
