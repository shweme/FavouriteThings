//
//  FavouriteThingsTests.swift
//  FavouriteThingsTests
//
//  Created by Shweta Mehta on 17/4/20.
//  Copyright © 2020 Shweta Mehta. All rights reserved.
//

import XCTest
import SwiftUI
@testable import FavouriteThings

class ReferenceTests: XCTestCase {
    
//    let Catan = Games(
//        url: "https://i.ebayimg.com/images/g/724AAOSwB-1YyeTu/s-l300.jpg",
//        name: "Settlers of Catan",
//        players: "3 - 4",
//        playTime: "90 - 120 minutes",
//        published: "1995",
//        skills: "Strategy, negotiation",
//        notes: "",
//        field1: "Players",
//        field2: "Play time",
//        field3: "Published",
//        field4: "Skills required"
//    )
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testImageDownload() {
        guard let url = URL(string: "https://cf.geekdo-images.com/imagepage/img/lLzsghVIr1cEC6Dii4_GA0ySWpQ=/fit-in/900x600/filters:no_upscale()/pic5164305.jpg") else {
            return XCTFail("Invalid URL")
        }
        guard let imgData = try? Data(contentsOf: url) else {
            return XCTFail("Could not download image")
        }
        guard let uiImg = UIImage(data: imgData) else {
            return XCTFail("Downloaded data does not contain image")
        }
        let downloadedImg = Image(uiImage: uiImg)
        XCTAssertNotNil(downloadedImg)
    }
    
    //Tests for old model
    
//    func testPeople() { //testing existing model
//
//        let url = "https://i.ebayimg.com/images/g/724AAOSwB-1YyeTu/s-l300.jpg"
//        let name = "Settlers of Catan"
//        let players = "3 - 4"
//        let playTime = "90 - 120 minutes"
//        let published = "1995"
//        let skills = "Strategy, negotiation"
//        let notes = ""
//        let field1 = "Players"
//        let field2 = "Play time"
//        let field3 = "Published"
//        let field4 = "Skills required"
//
//        let eg = Games(url: url, name: name, players: players, playTime: playTime, published: published, skills: skills, notes: notes, field1: field1, field2: field2, field3: field3, field4: field4)
//
//        XCTAssertEqual(eg.url, url)
//        XCTAssertEqual(eg.name, name)
//        XCTAssertEqual(eg.players, players)
//        XCTAssertEqual(eg.playTime, playTime)
//        XCTAssertEqual(eg.published, published)
//        XCTAssertEqual(eg.skills, skills)
//        XCTAssertEqual(eg.notes, notes)
//        XCTAssertEqual(eg.field1, field1)
//        XCTAssertEqual(eg.field2, field2)
//        XCTAssertEqual(eg.field3, field3)
//        XCTAssertEqual(eg.field4, field4)
//
//    }
//
//    func testFavePeople() { //testing whether passing an object into an array of objects works
//        let testFave: FaveGames = FaveGames()
//        testFave.add(Games(url: "https://contestimg.wish.com/api/webimage/5be12829febb6831319763fb-large.jpg?cache_buster=884fa7d14cdb857bda250f549e82ad24", name: "Unstable Unicorns", players: "2 - 8", playTime: "30 - 45 minutes", published: "2018", skills: "Strategy", notes: "", field1: "Players", field2: "Play time", field3: "Published", field4: "Skills required"))
//        testFave.title = "Favourite Games"
//
//        XCTAssertNotNil(testFave.title)
//        XCTAssertEqual(4, testFave.games.count)
//        testFave.remove([0])
//        XCTAssertEqual(3, testFave.games.count)
//    }
//
//    func testImageUrl() {
//        XCTAssertNotNil(self.Catan.url)
//    }
//
//    func testName() {
//        XCTAssertNotNil(self.Catan.name)
//    }
//
//    func testPlayers() {
//        XCTAssertNotNil(self.Catan.players)
//    }
//
//    func testPlayTime(){
//        XCTAssertNotNil(self.Catan.playTime)
//    }
//
//    func testPublished() {
//        XCTAssertNotNil(self.Catan.published)
//    }
//
//    func testSkills() {
//        XCTAssertNotNil(self.Catan.skills)
//    }
//
//    func testNotes() {
//        XCTAssertNotNil(self.Catan.notes)
//    }
//
//    func testField1() {
//        XCTAssertNotNil(self.Catan.field1)
//    }
//
//    func testField2() {
//        XCTAssertNotNil(self.Catan.field2)
//    }
//
//    func testField3() {
//        XCTAssertNotNil(self.Catan.field3)
//    }
//
//    func testField4() {
//        XCTAssertNotNil(self.Catan.field4)
//    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
