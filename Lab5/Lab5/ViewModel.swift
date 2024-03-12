//
//  ViewModel.swift
//  Created by  on 3/11/24.
//

import Foundation
class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = [
        Movie(name: "Lightning Theif", genre: "Fiction", imageName: "percy", description: "A thief who steals zues's lightning."),
        Movie(name: "Dune", genre: "Fiction", imageName: "dune", description: "House Atredies takes over the planet arrakis from the harkonens and ignites a war."),
        Movie(name: "End Game", genre: "Fiction", imageName: "endgame", description: "Thanos obliterates half the population."),
        Movie(name: "Interstellar", genre: "Adventure", imageName: "interstellar", description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival."),
        Movie(name: "Avatar the Last Airbender", genre: "Fiction", imageName: "avatar", description: "All the airbenders are wiped out and Aang is the last surving airbender tasked with saving the world."),
    ]
    
    
    init() {
        movies.sort { $0.name < $1.name }
    }
    
    func addMovie(name: String, genre: String, imageName: String = "defaultMoviePoster", description: String) {
        let newMovie = Movie(name: name, genre: genre, imageName: imageName, description: description)
        movies.append(newMovie)
        movies.sort { $0.name < $1.name }
    }
    
    func deleteMovie(at offsets: IndexSet) {
        movies.remove(atOffsets: offsets)
    }
}
