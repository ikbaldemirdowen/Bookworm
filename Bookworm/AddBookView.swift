//
//  AddBookView.swift
//  Bookworm
//
//  Created by Ikbal Demirdoven on 2023-05-21.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var moc
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    @State private var genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var body: some View {
        NavigationStack
        {
            Form
            {
                Section
                {
                    TextField("Name of the book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre)
                    {
                        ForEach(genres, id: \.self)
                        {
                            Text($0)
                        }
                    }
                }
                Section
                {
                    TextEditor(text: $review)
                } header: {
                    Text("Write a review...")
                }
                Section
                {
                    RatingView(rating: $rating)
                } header: {
                    Text("Rating...")
                }
                Section
                {
                    Button("Save")
                    {
                        //save the book
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.genre = genre
                        newBook.rating = Int16(rating)
                        newBook.review = review
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
