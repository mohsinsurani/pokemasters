# pokemasters

PokeMasters is the Pokemon Application of all the types and categories in one go. It displays the information about all the pokemons, their strengths, abilities, weakness, moves and their other details in the application.

This app is a native iOS application using Swift as the language and SwiftUI as the frontent framework to build UI
It also uses Alamofire and Kingfisher to fetch the data remotely.

Running and tested Version
 - XCode 14.2 (14C18)
 - iOS 16.0 deployment target
 - iPhone Landscape and Portrait support
 - MacOS Monterey 12.7.3

How to build the code?
 - Checkout the main branch
 - Install the pods
 - Run the project

How to run the output?
 - Clean your derived data or cache data
 - Open the PokeMasters.xcworkspace in Xcode.
 - Run the application on iOS 16.0 version on any iPhone model under TubeStatusApp Scheme
 - It should display the list of all the Pokemons and their images in the simulator

How to run any Business Logic or Backend tests?
BackendTest are written in PokeMastersTests file
 - Change the scheme from any to PokeMastersTests from the top-mid of the XCode
 - Go to PokeMastersTests.swift
 - Either click on play button of PokemonServiceTest class or enter Command + U to run the tests
 - Latency test, API Result expectation and Mock testing of API was carried out in the tests.

Any Assumptions?
 - This app currently only targets iPhone models and not any other devices
 - My old Macbook currently only support max to XCode 14.2 (any further version of xcode) is unsupported. 
 - This project is not tested on device because incompatibility between xcode version and iOS Version

Any Relevant Inputs?
 - It was fun and exciting to work on this project and get to learn many things.
 - I've added accessilbity and tried to adjust the contrast of colors according to requirements.
 - Tried to use maximum of enums, struct, combine and protocols to support the protocol-oriented reactive approach.
 - Created a few folders as so to decrease the burden of all logics and it can be splitted in various forms.
 - All the Gifs are cached to optimize the storage. Use Lazy grid for better performance.

Where are strategies or documents?
 - They are placed under PokeMasters/Documents where I've placed my visualization and breakdowns on which screen what features should be included.
   
