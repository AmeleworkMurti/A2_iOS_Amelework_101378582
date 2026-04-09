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
        sortDescriptors: []
    ) private var products: FetchedResults<Product>

    var body: some View {
        List {
            ForEach(filteredProducts) { product in
                VStack(alignment: .leading) {
                    Text(product.name ?? "")
                        .font(.headline)

                    Text(product.desc ?? "")
                        .font(.subheadline)
                }
            }
        }
        .navigationTitle("All Products")
    }
}
