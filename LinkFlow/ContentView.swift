//
//  ContentView.swift
//  LinkFlow
//
//  Created by Vikram Kumar on 22/03/26.
//



import SwiftUI

//struct ContentView : View {
//    
//    let cl = [
//        GridItem(.flexible(minimum: 60, maximum: 100)),
//        GridItem(.flexible(minimum: 40, maximum: 100)),
//        GridItem(.flexible(minimum: 100, maximum: 100)),
//        
//    ]
//    
//    let rows = [
//        GridItem(.flexible(minimum: 50, maximum: 100)),
//        GridItem(.fixed(100))
//    ]
//    
//    var body: some View {
//        ScrollView {
//            
//            
//            LazyVGrid(columns: cl, spacing: 20){
//                
//                ForEach(0..<20){ index in
//                    
//                    Text("item : \(index)")
//                        .frame(height: 60)
//                        .frame(maxWidth: .infinity)
//                        .background(Color.brown)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                    
//                }
//                
//            }
//            
//            }
//        
//        ScrollView(.horizontal) {
//            LazyHGrid(rows: rows , spacing: 20) {
//                ForEach(0..<30) { i in
//                    Text("Item \(i)")
//                        .frame(width: 90, height: 60, alignment: .center)
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                    
//                }
//            }
//        }
//        
//        }
        
//}

//import SwiftUI
//
//struct ContentView: View {
//    
//    @State private var searchText = ""
//    
//    let items = [
//        "Apple", "Banana", "Orange", "Mango",
//        "Grapes", "Pineapple", "Peach", "Cherry"
//    ]
//    
//    let columns = [
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//    
//    // 🔍 Filter logic
//    var filteredItems: [String] {
//        if searchText.isEmpty {
//            return items
//        } else {
//            return items.filter {
//                $0.localizedCaseInsensitiveContains(searchText)
//            }
//        }
//    }
//    
//    var body: some View {
//  
//        
//        NavigationView {
//            ScrollView {
//
//                LazyVGrid(columns: columns, spacing: 20) {
//                    
//                    ForEach(filteredItems, id: \.self) { item in
//                        Text(item)
//                            .frame(height: 60)
//                            .frame(maxWidth: .infinity)
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                }
//                .padding()
//            }
//            .navigationTitle("LinkFl𖦹w")
//            .searchable(text: $searchText) // 🔥 built-in search
//        }
//       
//    }
//}


import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    // 🔍 Filter logic
    var filteredApps: [AppItem] {
        if searchText.isEmpty {
            return appList
        } else {
            return appList.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    
                    ForEach(filteredApps) { app in
                        AppCell(app: app)
                    }
                }
                .padding()
            }
            .navigationTitle("LinkFlow")
            .searchable(text: $searchText) // 🔥 search bar
        }
    }
}

#Preview {
    ContentView()
}
