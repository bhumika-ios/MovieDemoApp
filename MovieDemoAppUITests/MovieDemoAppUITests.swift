//
//  MovieDemoAppUITests.swift
//  MovieDemoAppUITests
//
//  Created by Bhumika Patel on 18/06/25.
//

import XCTest

final class MovieDemoAppUITests: XCTestCase {

    var app: XCUIApplication!

      override func setUpWithError() throws {
          continueAfterFailure = false
          app = XCUIApplication()
          app.launch()
      }

    func testMovieGridLoads() {
        let imageElements = app.scrollViews.images
        XCTAssertTrue(imageElements.count > 0, "At least one poster image should appear")
    }

    func testAddAndRemoveFromFavoritesFlow() {
           // Tap the first visible movie poster
           let firstPoster = app.scrollViews.images.firstMatch
           XCTAssertTrue(firstPoster.waitForExistence(timeout: 10), "Poster image should appear")
           firstPoster.tap()

           // Tap "Add to Favorites" if it appears
           let addButton = app.buttons["AddToFavorites"]
           XCTAssertTrue(addButton.waitForExistence(timeout: 5), "Add to Favorites button should appear")
           addButton.tap()

           // Navigate back to the movie grid
           let backButton = app.navigationBars.buttons.firstMatch
           XCTAssertTrue(backButton.waitForExistence(timeout: 5), "Back button should appear")
           backButton.tap()

           // Go to Favorites tab
           app.tabBars.buttons["Favorites"].tap()

           // Tap on the first favorite movie poster
          let favoriteCell = app.collectionViews.cells.firstMatch
          XCTAssertTrue(favoriteCell.waitForExistence(timeout: 10), "Favorite cell should appear")
          favoriteCell.tap()
        
           // Tap "Remove from Favorites"
           let removeButton = app.buttons["RemoveFromFavorites"]
           XCTAssertTrue(removeButton.waitForExistence(timeout: 5), "Remove from Favorites button should appear")
           removeButton.tap()

           // Go back again
           XCTAssertTrue(backButton.waitForExistence(timeout: 5), "Back button should appear")
           backButton.tap()

       }

}
