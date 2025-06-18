//
//  MovieDemoAppTests.swift
//  MovieDemoAppTests
//
//  Created by Bhumika Patel on 18/06/25.
//

import XCTest
@testable import MovieDemoApp

final class MovieDemoAppTests: XCTestCase {

    func testFetchPopularMovies() {
           let expectation = XCTestExpectation(description: "Fetch popular movies")
           
           APIService.shared.fetchPopularMovies { movies in
               XCTAssertFalse(movies.isEmpty, "Expected non-empty movie list")
               XCTAssertNotNil(movies.first?.title, "Movie title should not be nil")
               expectation.fulfill()
           }

           wait(for: [expectation], timeout: 5.0)
       }

       func testSearchMovies() {
           let expectation = XCTestExpectation(description: "Search movies with query")

           APIService.shared.searchMovies(query: "The Amateur") { movies in
               XCTAssertFalse(movies.isEmpty, "Expected results for 'The Amateur'")
               XCTAssertTrue(movies.contains(where: { $0.title.contains("The Amateur") }), "Expected at least one 'The Amateur' movie")
               expectation.fulfill()
           }

           wait(for: [expectation], timeout: 5.0)
       }
   }
