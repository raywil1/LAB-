//
//  ContentView.swift
//  Lab5
//
//  Created by Rayhan Wilangkara on 3/11/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = MovieViewModel()
    @State private var showingAddMovie = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.movies) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        MovieRow(movie: movie)
                    }
                }
                .onDelete(perform: viewModel.deleteMovie)
            }
            .navigationBarTitle("Movies Watched")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {
                    showingAddMovie = true
                }) {
                    Image(systemName: "plus")
                }
            )
        }
        .sheet(isPresented: $showingAddMovie) {
            AddMovieView(viewModel: viewModel)
        }
    }
}

struct MovieRow: View {
    var movie: Movie
    
    var body: some View {
        HStack {
            Image(movie.imageName) 
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            VStack(alignment: .leading) {
                Text(movie.name).bold()
                Text(movie.genre).font(.subheadline).foregroundColor(.gray)
            }
        }
    }
}

struct MovieDetailView: View {
    var movie: Movie
    
    var body: some View {
        VStack {
            Image(movie.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(movie.name).font(.title)
            Text(movie.genre).font(.subheadline)
            Text(movie.description).padding()
        }
    }
}

struct AddMovieView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: MovieViewModel
    @State private var name = ""
    @State private var genre = ""
    @State private var description = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Genre", text: $genre)
                TextField("Description", text: $description)
                
                Button("Add Movie") {
                    viewModel.addMovie(name: name, genre: genre, imageName: "defaultMoviePoster", description: description)
                    dismiss()
                }
                .disabled(name.isEmpty || genre.isEmpty || description.isEmpty)
            }
            .navigationBarTitle("Add New Movie", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel") {
                dismiss()
            })
        }
    }
}

#Preview {
    ContentView()
}
