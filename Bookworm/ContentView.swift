//
//  ContentView.swift
//  Bookworm
//
//  Created by Ikbal Demirdoven on 2023-05-20.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title), SortDescriptor(\.author)]) var books : FetchedResults<Book>
    @State private var showingAddBookScreen = false
    var body: some View {
        NavigationStack
        {
            List
            {
                ForEach(books, id: \.id)
                {
                    book in
                    NavigationLink
                    {
                        DetailView(book: book)
                    } label: {
                        HStack
                        {
                            EmojiView(rating: book.rating)
                                .font(.largeTitle)
                                .bold()
                            VStack(alignment: .leading)
                            {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                Text(book.author ?? "Unknown Author")
                                
                            }
                        }
                    }
                }
                .onDelete(perform: delete)
            }
                .toolbar
            {
                ToolbarItem(placement: .navigationBarTrailing)
                {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing)
                {
                    Button
                    {
                        showingAddBookScreen.toggle()
                    } label: {
                        HStack
                        {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .sheet(isPresented: $showingAddBookScreen)
            {
                AddBookView()
            }
            .navigationTitle("Bookworm")
        }
    }
    
    func delete(at offSets : IndexSet)
    {
        for book in offSets
        {
            let bookToDelete = books[book]
            moc.delete(bookToDelete)
            try? moc.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
