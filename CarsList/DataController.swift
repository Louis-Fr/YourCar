//
//  DataController.swift
//  CarsList
//
//  Created by Louis REY on 23/02/2023.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CarsModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
    }
}
