//
//  DetailView.swift
//  Bookworm
//
//  Created by Ikbal Demirdoven on 2023-05-22.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    let book : Book
    var body: some View {
        ScrollView
        {
            ZStack(alignment: .bottomTrailing)
            {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                Text(book.genre?.uppercased() ?? "Fantasy")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            Text(book.author ?? "Unknown Author")
                .font(.title)
                .foregroundColor(.secondary)
            Text(book.review ?? "No Review")
                .padding()
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete book??", isPresented: $showingAlert)
        {
            Button("Delete", role: .destructive, action: delete)
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure?")
        }
        .toolbar
        {
            Button
            {
                showingAlert = true
            } label: {
                Image(systemName: "trash")
            }
        }
    }
    
    func delete()
    {
        moc.delete(book)
        try? moc.save()
        dismiss()
    }
}
