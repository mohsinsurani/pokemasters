//
//  testdddgdg.swift
//  PokeMasters
//
//  Created by Admin on 24/07/2024.
//

import Foundation
//func testFetchPokemonListsSuccess() {
//    // Given
//    let mockResults = [
//        Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
//        Pokemon(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"),
//        Pokemon(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/"),
//        Pokemon(name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/4/"),
//        Pokemon(name: "charmeleon", url: "https://pokeapi.co/api/v2/pokemon/5/"),
//        Pokemon(name: "charizard", url: "https://pokeapi.co/api/v2/pokemon/6/"),
//        Pokemon(name: "squirtle", url: "https://pokeapi.co/api/v2/pokemon/7/"),
//        Pokemon(name: "wartortle", url: "https://pokeapi.co/api/v2/pokemon/8/"),
//        Pokemon(name: "blastoise", url: "https://pokeapi.co/api/v2/pokemon/9/"),
//        Pokemon(name: "caterpie", url: "https://pokeapi.co/api/v2/pokemon/10/"),
//        Pokemon(name: "metapod", url: "https://pokeapi.co/api/v2/pokemon/11/"),
//        Pokemon(name: "butterfree", url: "https://pokeapi.co/api/v2/pokemon/12/"),
//        Pokemon(name: "weedle", url: "https://pokeapi.co/api/v2/pokemon/13/"),
//        Pokemon(name: "kakuna", url: "https://pokeapi.co/api/v2/pokemon/14/"),
//        Pokemon(name: "beedrill", url: "https://pokeapi.co/api/v2/pokemon/15/"),
//        Pokemon(name: "pidgey", url: "https://pokeapi.co/api/v2/pokemon/16/"),
//        Pokemon(name: "pidgeotto", url: "https://pokeapi.co/api/v2/pokemon/17/"),
//        Pokemon(name: "pidgeot", url: "https://pokeapi.co/api/v2/pokemon/18/"),
//        Pokemon(name: "rattata", url: "https://pokeapi.co/api/v2/pokemon/19/"),
//        Pokemon(name: "raticate", url: "https://pokeapi.co/api/v2/pokemon/20/")
//    ]
//
//    let expectedResponse = PokemonListResponse(
//        count: 1302,
//        next: "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20",
//        previous: nil,
//        results: mockResults
//    )
//
//    mockService.mockPublisher = Just(expectedResponse)
//        .setFailureType(to: Error.self)
//        .eraseToAnyPublisher()
//
//    // When
//    let expectation = XCTestExpectation(description: "Fetch Pokemon Lists should succeed")
//    mockService.fetchPokemonLists(limit: 20, page: 1)
//        .sink(receiveCompletion: { completion in
//            if case .failure = completion {
//                XCTFail("Expected success but received failure")
//            }
//        }, receiveValue: { response in
//            // Then
//            XCTAssertEqual(response.count, 1302)
//            XCTAssertEqual(response.results.count, 20)
//            XCTAssertEqual(response.results.first?.name, "bulbasaur")
//            XCTAssertEqual(response.results.first?.url, "https://pokeapi.co/api/v2/pokemon/1/")
//            expectation.fulfill()
//        })
//        .store(in: &cancellables)
//
//    wait(for: [expectation], timeout: 5.0)
//}

//failing because of no internet
//func testFetchPokemonListsFailure() {
//    // Given
//    mockService.mockPublisher = Fail(error: URLError(.notConnectedToInternet))
//        .eraseToAnyPublisher()
//    
//    // When
//    let expectation = XCTestExpectation(description: "Fetch Pokemon Lists should fail")
//    mockService.fetchPokemonLists(limit: 20, page: 1)
//        .sink(receiveCompletion: { completion in
//            // Then
//            if case .failure(let error) = completion {
//                XCTAssertEqual((error as? URLError)?.code, URLError.notConnectedToInternet)
//                expectation.fulfill()
//            } else {
//                XCTFail("Expected failure but received success")
//            }
//        }, receiveValue: { _ in
//            XCTFail("Expected failure but received success")
//        })
//        .store(in: &cancellables)
//    
//    wait(for: [expectation], timeout: 5.0)
//}
