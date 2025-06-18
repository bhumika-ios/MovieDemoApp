//
//  MovieModel.swift
//  MovieDemoApp
//
//  Created by Bhumika Patel on 18/06/25.
//

import Foundation
import SwiftData

@Model
class MovieModel {
    @Attribute(.unique) var id: Int
    var title: String
    var overview: String
    var posterPath: String?
    var releaseDate: String
    var voteAverage: Double

    init(id: Int, title: String, overview: String, posterPath: String?, releaseDate: String, voteAverage: Double) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.voteAverage = voteAverage
    }
}
