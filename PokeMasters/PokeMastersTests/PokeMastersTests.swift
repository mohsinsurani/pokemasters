//
//  PokeMastersTests.swift
//  PokeMastersTests
//
//  Created by Admin on 19/07/2024.
//

import XCTest
import Combine
@testable import PokeMasters

final class PokeMastersTests: XCTestCase {
    var mockService: MockPokemonService!
    var cancellables: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockService = MockPokemonService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockService = nil
        cancellables.removeAll()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //verifying the response data
    func testFetchPokemonListsSuccess() {
        // Given
        let mockResults = [
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/1/", name: "bulbasaur"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/2/", name: "ivysaur"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/3/", name: "venusaur"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/4/", name: "charmander"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/5/", name: "charmeleon"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/6/", name: "charizard"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/7/", name: "squirtle"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/8/", name: "wartortle"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/9/", name: "blastoise"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/10/", name: "caterpie"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/11/", name: "metapod"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/12/", name: "butterfree"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/13/", name: "weedle"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/14/", name: "kakuna"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/15/", name: "beedrill"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/16/", name: "pidgey"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/17/", name: "pidgeotto"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/18/", name: "pidgeot"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/19/", name: "rattata"),
            Pokemon(url: "https://pokeapi.co/api/v2/pokemon/20/", name: "raticate")
        ]

        let expectedResponse = PokemonResponse(
            count: 1302,
            results: mockResults
        )

        mockService.mockPublisher = Just(expectedResponse)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()

        // When
        let expectation = XCTestExpectation(description: "Fetch Pokemon Lists should succeed")
        mockService.fetchPokemonLists(limit: 20, page: 1)
            .sink(receiveCompletion: { completion in
                if case .failure = completion {
                    XCTFail("Expected success but received failure")
                }
            }, receiveValue: { response in
                // Then
                XCTAssertEqual(response.count, 1302)
                XCTAssertEqual(response.results.count, 20)
                XCTAssertEqual(response.results.first?.name, "bulbasaur")
                XCTAssertEqual(response.results.first?.url, "https://pokeapi.co/api/v2/pokemon/1/")
                expectation.fulfill()
            })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
    }
    
//    test failing because of no internet
    func testFetchPokemonListsFailure() {
        // Given
        mockService.mockPublisher = Fail(error: URLError(.notConnectedToInternet))
            .eraseToAnyPublisher()

        // When
        let expectation = XCTestExpectation(description: "Fetch Pokemon Lists should fail")
        mockService.fetchPokemonLists(limit: 20, page: 1)
            .sink(receiveCompletion: { completion in
                // Then
                if case .failure(let error) = completion {
                    XCTAssertEqual((error as? URLError)?.code, URLError.notConnectedToInternet)
                    expectation.fulfill()
                } else {
                    XCTFail("Expected failure but received success")
                }
            }, receiveValue: { _ in
                XCTFail("Expected failure but received success")
            })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
    }

}
