//
//  ContentView.swift
//  HelloAWSAmplify
//
//  Created by Mohammad Azam on 4/21/21.
//

import SwiftUI

struct ContentView: View {
        
    @StateObject private var movieListVM = MovieListViewModel()
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }

    func deleteMovie(_ indexSet: IndexSet) {
        indexSet.forEach { index in
            let movie = movieListVM.movies[index]
            movieListVM.deleteMovie(movie)
        }
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Enter name")
                TextField("", text: $movieListVM.movieName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Enter description")
                TextEditor(text: $movieListVM.movieDescription)
                    .background(Color(#colorLiteral(red: 0.9550691247, green: 0.9493913054, blue: 0.9594332576, alpha: 1)))
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 16.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                   
            }.padding(.top, 20)
           
            HStack {
                Spacer()
                
                Button(action: {
                    movieListVM.save()
                    movieListVM.clearFields()
                }, label: {
                        Text("Save")
                            .frame(maxWidth: 150, maxHeight: 44)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                }).padding()
                
                
                Spacer()
            }
            
            List {
                ForEach(movieListVM.movies, id: \.id) { movie in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(movie.name)
                            .font(.system(.headline))
                        
                        Text(movie.description)
                    }
                }.onDelete(perform: deleteMovie)
            }.listStyle(PlainListStyle())
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("Tasks")
        .onAppear(perform: {
            movieListVM.getAll()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
