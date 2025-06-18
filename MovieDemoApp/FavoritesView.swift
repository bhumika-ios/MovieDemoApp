//
//  FavoritesView.swift
//  MovieDemoApp
//
//  Created by Bhumika Patel on 18/06/25.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query private var favorites: [MovieModel]

    var body: some View {
        NavigationStack {
            List(favorites) { movie in
                VStack(alignment: .leading) {
                    Text(movie.title).font(.headline)
                    Text("⭐️ \(movie.voteAverage, specifier: "%.1f")")
                }
            }
            .navigationTitle("Favorites")
        }
    }
}
