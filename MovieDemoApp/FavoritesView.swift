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

    private let imageWidth: CGFloat = 60
    private let imageHeight: CGFloat = 90

    var body: some View {
        NavigationStack {
            List(favorites) { movie in
                NavigationLink {
                    MovieDetailView(movie: movie.toMovie())
                } label: {
                    HStack {
                        AsyncImage(url: movie.posterURL) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: imageWidth, height: imageHeight)
                        .clipped()
                        .cornerRadius(8)

                        VStack(alignment: .leading, spacing: 4) {
                            Text(movie.title)
                                .font(.headline)
                                .lineLimit(2)
                            Text("⭐️ \(movie.voteAverage, specifier: "%.1f")")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

extension MovieModel {
    var posterURL: URL? {
        if let path = posterPath {
            return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
        }
        return nil
    }

    func toMovie() -> Movie {
        Movie(
            id: self.id,
            title: self.title,
            overview: self.overview,
            poster_path: self.posterPath,
            release_date: self.releaseDate,
            vote_average: self.voteAverage
        )
    }
}
