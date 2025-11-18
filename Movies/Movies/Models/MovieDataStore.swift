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
        movies = []
    }
    
    func getMovies() -> [Movie] {
        let allMovies = movies.map
        }
        
    }
    
    func getMovies(actor: Actor) -> [Movie] {
        
    }
    
    func getMovies(director: Director) -> [Movie] {
        
    }
    
    func getACtors(director: Director) -> [Actor] {
        
    }
    
    private func sort() {
       
    }
    
    func loadData() async {
        //simulate async call
        do {
            print("⏳ Simulating 2-second load delay...")
            try await Task.sleep(for: .seconds(2)) // Simulate long load
            // load movies
            movies = load("movies.json")
            // sort
            
            print("✅ Data loaded successfully.")
            
        } catch {
            print("❌ Failed to load uurrooster:", error)
            //movies is lege array
        }
    }

