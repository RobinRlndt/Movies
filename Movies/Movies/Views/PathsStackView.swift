//
//  PathsStackView.swift
//  Movies
//
//  Created by Robin Roelandt on 04/12/2025.
//

import SwiftUI

struct PathsStackView: View {
    @Environment(Paths.self) var paths
    
    var body: some View {
        Text("Overview NavigationStack")
            .font(.headline)
            .padding(.top)
        
        if !paths.path.isEmpty {
                Text("Empty")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            } else {
                ForEach(Array(pathStore.path.enumerated()), id: \.offset) { index, destination in
                    HStack {
                        Text("\(index): ")
                            .font(.caption)
                        Text(destination.debugDescription)
                            .font(.caption.monospaced())
                            .foregroundStyle(.secondary)
                    }
                    .padding(.horizontal)
                }
            }
    }
}

#Preview {
    PathsStackView()
}
