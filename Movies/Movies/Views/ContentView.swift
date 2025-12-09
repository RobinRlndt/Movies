//
//  ContentView.swift
//  Movies
//
//  Created by Robin Roelandt on 18/11/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(PathStore.self) var pathStore
    @Environment(MovieDataStore.self) var movieDataStore
    
    var body: some View {
        
        MovieListView()
        PathsStackView()
    }
}
