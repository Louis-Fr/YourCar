//
//  AddCarView.swift
//  CarsList
//
//  Created by Louis REY on 25/02/2023.
//

import SwiftUI

struct AddCarView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var brand = ""
    @State private var model = ""
    @State private var year = 0
    @State private var energy = ""
    
    let brands = ["Peugeot", "Alpine", "Renault", "Citroen"]
    let models = ["308", "A110", "Megane","C3"]
    let energys = ["Essence", "Diesel"]
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select Brand", selection: $brand) {
                        ForEach(brands, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Select Model", selection: $model) {
                        ForEach(models, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Select brand and Model")
                }
                
                Section {
                    Picker("Select Energy", selection: $energy) {
                        ForEach(energys, id: \.self) {
                            Text($0)
                        }
                    }
                    Picker("Select year", selection: $year) {
                        ForEach(2000..<2024) { index in
                            Text(index.description)
                        }
                    }
                } header: {
                    Text("Select Energy and Year")
                }
                
                Section {
                    Button("Save") {
                        let newCar = Car(context: moc)
                        newCar.id = UUID()
                        newCar.brand = brand
                        newCar.model = model
                        newCar.energy = energy
                        newCar.year = Int16(year)
                        
                        try? moc.save()
                        dismiss()
                    }
                }
                
            }
            .navigationTitle("Your Car")
        }
    }
}

struct AddCarView_Previews: PreviewProvider {
    static var previews: some View {
        AddCarView()
    }
}
