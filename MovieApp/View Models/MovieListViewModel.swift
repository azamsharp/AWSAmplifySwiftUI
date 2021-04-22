//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Mohammad Azam on 4/22/21.
//

import Foundation
import Amplify

class MovieListViewModel: ObservableObject {
    
    var movieName: String = ""
    var movieDescription: String = ""
    
    @Published var movies: [MovieViewModel] = []
    
    func clearFields() {
        movieName = ""
        movieDescription = ""
    }
    
    func deleteMovie(_ movie: MovieViewModel) {
        Amplify.DataStore.delete(Movie.self, withId: movie.id) { result in
                   switch result {
                       case .success:
                           self.getAll()
                       case .failure(let error):
                           print(error)
                   }
               }
    }
    
    func getAll() {
        
        Amplify.DataStore.query(Movie.self) { result in
            switch result {
                case .success(let movies):
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
    }
    
    func save() {
        
        let movie = Movie(title: movieName, description: movieDescription)
        Amplify.DataStore.save(movie) { result in
            switch result {
                case .success(_):
                    self.getAll()
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
    }
}


struct MovieViewModel {
    
    let movie: Movie
    
    var id: String {
        return movie.id
    }
    
    var name: String {
        return movie.title ?? ""
    }
    
    var description: String {
        return movie.description ?? ""
    }
}
