//
//  ViewModel.swift
//  Created by  on 3/11/24.
//

import Foundation
class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = [
        Movie(name: "Lightning Theif", genre: "Science Fiction", imageName: "inception", description: "A thief who steals corporate secrets through dream-sharing technology."),
        Movie(name: "The Matrix", genre: "Action", imageName: "matrix", description: "A computer hacker learns about the true nature of his reality and his role in the war against its controllers."),
        Movie(name: "The Grand Budapest Hotel", genre: "Comedy", imageName: "grandbudapest", description: "The adventures of Gustave H, a legendary concierge at a famous European hotel."),
        Movie(name: "Interstellar", genre: "Adventure", imageName: "interstellar", description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival."),
        Movie(name: "Mad Max: Fury Road", genre: "Action", imageName: "madmax", description: "In a post-apocalyptic wasteland, Max teams up with Furiosa to flee from a tyrant."),
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
