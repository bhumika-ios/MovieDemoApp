//
//  ContentView.swift
//  MovieDemoApp
//
//  Created by Bhumika Patel on 18/06/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var movies: [Movie] = []
    @State private var searchText = ""
    @Environment(\.modelContext) private var context
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.gray.opacity(0.1).ignoresSafeArea()
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(movies) { movie in
                            NavigationLink {
                                MovieDetailView(movie: movie)
                            } label: {
                                VStack(alignment: .leading) {
                                    AsyncImage(url: movie.posterURL) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(height: 200)
                                    .clipped()
                                    .cornerRadius(10)

                                    Text(movie.title)
                                        .font(.headline)
                                        .lineLimit(2) // or use nil for unlimited lines
                                        .multilineTextAlignment(.leading)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.top, 4)

                                    Text("⭐️ \(movie.vote_average, specifier: "%.1f")")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                    .padding()
                }
                .searchable(text: $searchText)
                .navigationTitle("Popular Movies")
                .onAppear { loadPopular() }
                .onChange(of: searchText) { newValue in
                    if newValue.count > 2 {
                        search(query: newValue)
                    } else if newValue.isEmpty {
                        loadPopular()
                    }
                }
            }
        }
    }
    private func loadPopular() {
        APIService.shared.fetchPopularMovies { movies = $0 }
    }

    private func search(query: String) {
        APIService.shared.searchMovies(query: query) { movies = $0 }
    }
}

#Preview {
    ContentView()
}
