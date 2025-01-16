//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by 이종민 on 1/16/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var name: String = ""
    @State var quantity: String = ""

    @FetchRequest(entity: Product.entity(), sortDescriptors: [])
    private var products: FetchedResults<Product>

    var body: some View {
        NavigationStack {
            VStack {
                TextField("Product name", text: $name)
                TextField("Product quantity", text: $quantity)
                
                HStack {
                    Spacer()
                    Button(action: {
                        print(#fileID, #function, #line, "Add Button")
                        addProduct()
                    }, label: {
                        Text("Add")
                    })
                    
                    Spacer()
                    
                    NavigationLink(destination: ResultsView(name: name, viewContext: viewContext), label: {
                        Text("Find")
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        print(#fileID, #function, #line, "Clear Button")
                        deleteItems(offsets: IndexSet())
                    }, label: {
                        Text("Clear")
                    })
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                List {
                    ForEach(products) { product in
                        HStack {
                            Text(product.name ?? "Not Found")
                            Spacer()
                            Text(product.quantity ?? "Not Found")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .navigationTitle("Product Database")
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        
    }

    private func addProduct() {
        print(#fileID, #function, #line, "- addProduct function")
        withAnimation {
            let product = Product(context: viewContext)
            product.name = name
            product.quantity = quantity
            
            saveContext()
        }
    }

    private func deleteItems(offsets: IndexSet) {
        print(#fileID, #function, #line, "- deleteItems function")
        withAnimation {
                   offsets.map {
                       offset in
                       products[offset]
                   }.forEach({
                       element in
                       viewContext.delete(element)
                   })
       //          offsets.map { products[$0] }.forEach(viewContext.delete)
                   saveContext()
               }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
