//
//  Untitled.swift
//  MovieDemoApp
//
//  Created by Bhumika Patel on 18/06/25.
//

import SwiftUI
import SwiftData

struct MovieDetailView: View {
    let movie: Movie
    @Environment(\.modelContext) private var context
    @Query private var favorites: [MovieModel]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: movie.posterURL) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }

                Text(movie.title)
                    .font(.title)
                    .bold()

                Text("⭐️ \(movie.vote_average, specifier: "%.1f") • \(movie.release_date)")
                    .font(.subheadline)
                    .foregroundStyle(.gray)

                Text(movie.overview)
                    .font(.body)

                Button {
                    toggleFavorite()
                } label: {
                    Text(isFavorite ? "Remove from Favorites" : "Add to Favorites")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isFavorite ? .red : .blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
                .accessibilityIdentifier(isFavorite ? "RemoveFromFavorites" : "AddToFavorites")
            }
            .padding()
        }
    }

    var isFavorite: Bool {
        favorites.contains(where: { $0.id == movie.id })
    }

    func toggleFavorite() {
        if let existing = favorites.first(where: { $0.id == movie.id }) {
            context.delete(existing)
        } else {
            let newFav = MovieModel(
                id: movie.id,
                title: movie.title,
                overview: movie.overview,
                posterPath: movie.poster_path,
                releaseDate: movie.release_date,
                voteAverage: movie.vote_average
            )
            context.insert(newFav)
        }
    }
}
