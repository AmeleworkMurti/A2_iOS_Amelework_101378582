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
        VStack(spacing: 20) {

            Text("Add Product")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)

            VStack(spacing: 15) {

                TextField("Product Name", text: $name)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)

                TextField("Description", text: $desc)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)

                TextField("Price", text: $price)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .keyboardType(.decimalPad)

                TextField("Provider", text: $provider)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }

            Button("Save Product") {
                addProduct()
                dismiss()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding(.top, 10)

            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
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

