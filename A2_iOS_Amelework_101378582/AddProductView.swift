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
