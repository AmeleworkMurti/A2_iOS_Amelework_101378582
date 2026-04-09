//
//  AddProductView.swift
//  A2_iOS_Amelework_101378582
//
//  Created by Amelework Murti on 2026-04-09.
//
import SwiftUI
import CoreData

struct AddProductView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var name = ""
    @State private var desc = ""
    @State private var price = ""
    @State private var provider = ""
    var body: some View {
            VStack {
                TextField("Product Name", text: $name)
                    .textFieldStyle(.roundedBorder)

                TextField("Description", text: $desc)
                    .textFieldStyle(.roundedBorder)

                TextField("Price", text: $price)
                    .textFieldStyle(.roundedBorder)

                TextField("Provider", text: $provider)
                    .textFieldStyle(.roundedBorder)

                Button("Save Product") {
                    addProduct()
                    dismiss()
                }
                .padding()
            }
            .padding()
            .navigationTitle("Add Product")
        }
   
    private func addProduct() {
            let newProduct = Product(context: viewContext)
            newProduct.productID = Int64(Date().timeIntervalSince1970)
            newProduct.name = name
            newProduct.desc = desc
            newProduct.price = Double(price) ?? 0.0
            newProduct.provider = provider

            do {
                try viewContext.save()
            } catch {
                print("Error saving: \(error)")
            }
        }
    }
