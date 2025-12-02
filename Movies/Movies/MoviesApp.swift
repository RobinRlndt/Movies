//
//  MoviesApp.swift
//  Movies
//
//  Created by Robin Roelandt on 18/11/2025.
//

import SwiftUI

@main
struct MoviesApp: App {
    @State private var movieDataStore = MovieDataStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(movieDataStore)
        }
    }
}
