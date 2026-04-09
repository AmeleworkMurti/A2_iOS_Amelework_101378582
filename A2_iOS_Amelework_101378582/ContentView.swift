//
//  ContentView.swift
//  A2_iOS_Amelework_101378582
//
//  Created by Amelework Murti on 2026-04-08.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        entity: Product.entity(),
        sortDescriptors: []
    ) private var products: FetchedResults<Product>

    @State private var currentIndex = 0

    var body: some View {
        VStack {
            if products.count > 0 {
                let product = products[currentIndex]

                Text(product.name ?? "No Name")
                    .font(.title)

                Text(product.desc ?? "No Description")

                Text("Price: \(product.price)")
                Text("Provider: \(product.provider ?? "")")

                HStack {
                    Button("Previous") {
                        if currentIndex > 0 {
                            currentIndex -= 1
                        }
                    }

                    Button("Next") {
                        if currentIndex < products.count - 1 {
                            currentIndex += 1
                        }
                    }
                }
            } else {
                Text("No Products Available")
            }
        }
        .padding()
        .onAppear {
            if products.isEmpty {
                addSampleData()
            }
        }
    }

    private func addSampleData() {
        for i in 1...10 {
            let newProduct = Product(context: viewContext)
            newProduct.productID = Int64(i)
            newProduct.name = "Product \(i)"
            newProduct.desc = "Description \(i)"
            newProduct.price = Double(i) * 10.0
            newProduct.provider = "Provider \(i)"
        }

        do {
            try viewContext.save()
        } catch {
            print("Error saving: \(error)")
        }
    }
}
