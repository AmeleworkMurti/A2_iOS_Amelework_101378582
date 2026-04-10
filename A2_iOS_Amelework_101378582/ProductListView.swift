//
//  ProductListView.swift
//  A2_iOS_Amelework_101378582
//
//  Created by Amelework Murti on 2026-04-09.
//
import SwiftUI
import CoreData

struct ProductListView: View {
    @State private var searchText = ""
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: Product.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.productID, ascending: true)]
    ) private var products: FetchedResults<Product>
    
    var body: some View {
        List {
            ForEach(filteredProducts) { product in
                VStack(alignment: .leading, spacing: 5) {
                    Text(product.name ?? "")
                        .font(.headline)
                    
                    Text(product.desc ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 5)
            }
        }
        .listStyle(.insetGrouped)
        .searchable(text: $searchText, prompt: "Search products")
        .navigationTitle("All Products")
        
        var filteredProducts: [Product] {
            if searchText.isEmpty {
                return Array(products)
            } else {
                return products.filter {
                    ($0.name ?? "").lowercased().contains(searchText.lowercased()) ||
                    ($0.desc ?? "").lowercased().contains(searchText.lowercased())
                }
            }
        }
        
    }}
