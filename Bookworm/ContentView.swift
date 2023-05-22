//
//  ContentView.swift
//  Bookworm
//
//  Created by Ikbal Demirdoven on 2023-05-20.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books : FetchedResults<Book>
    @State private var showingAddBookScreen = false
    var body: some View {
        NavigationStack
        {
            Text("Count: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar
            {
                ToolbarItem(placement: .navigationBarTrailing)
                {
                    Button
                    {
                        showingAddBookScreen.toggle()
                    } label: {
                        HStack
                        {
                            Text("Add Book")
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            .sheet(isPresented: $showingAddBookScreen)
            {
                AddBookView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
