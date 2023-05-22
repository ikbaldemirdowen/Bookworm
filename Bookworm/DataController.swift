//
//  DataController.swift
//  Bookworm
//
//  Created by Ikbal Demirdoven on 2023-05-21.
//
import CoreData
import Foundation

class DataController : ObservableObject
{
    let container = NSPersistentContainer(name: "Bookworm")
    
    init()
    {
        container.loadPersistentStores
        {
            description, error in
            if let error = error
            {
                print("Core Data failed to load.\(error.localizedDescription)")
            }
        }
    }
}
