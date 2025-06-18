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
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
