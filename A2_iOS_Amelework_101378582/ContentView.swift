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
        NavigationView {
            VStack(spacing: 25) {
                
                if products.count > 0 {
                    let product = products[currentIndex]
                    
                    // Product Card
                    VStack(spacing: 10) {
                        Text(product.name ?? "")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text(product.desc ?? "")
                            .foregroundColor(.gray)
                        
                        Text("Price: $\(product.price, specifier: "%.2f")")
                            .font(.headline)
                        
                        Text("Provider: \(product.provider ?? "")")
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    
                    // Navigation Buttons
                    HStack(spacing: 20) {
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
                    .buttonStyle(.borderedProminent)
                } else {
                    Text("No Products Available")
                        .foregroundColor(.gray)
                }
                
                // Navigation Links
                VStack(spacing: 15) {
                    NavigationLink("View All Products") {
                        ProductListView()
                    }
                    
                    NavigationLink("Add Product") {
                        AddProductView()
                    }
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Products")
        }
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
