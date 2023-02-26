//
//  ContentView.swift
//  CarsList
//
//  Created by Louis REY on 23/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment (\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.brand), SortDescriptor(\.model)]) var cars: FetchedResults<Car>
    
    @State private var ShowingAddScreen = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                List {
                    ForEach(cars) { index in
                        HStack {
                            Text(index.brand ?? "error")
                            Text(index.model ?? "error")
                            Text(index.year.description)
                        }
                    }.onDelete(perform: deleteCar)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        ShowingAddScreen.toggle()
                    } label: {
                        Label("Add Car", systemImage: "plus")
                    }
                    }
                }
                
                .sheet(isPresented: $ShowingAddScreen) {
                    AddCarView()
                }
            }
            .navigationTitle("Car Collection")
        }
    }
    
    func deleteCar(at offsets: IndexSet) {
        for offset in offsets {
            let car = cars[offset]
            moc.delete(car)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
