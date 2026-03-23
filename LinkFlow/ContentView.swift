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
    @State private var showFavoritesOnly = false
    @State private var sortAscending = true
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    // MARK: - Filter + Sort
    
    var filteredApps: [AppItem] {
        var result = appList
        
        // Filter by search
        if !searchText.isEmpty {
            result = result.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        // Filter favorites
        if showFavoritesOnly {
            result = result.filter { $0.isFavorite }
        }
        
        // Sort
        result.sort {
            sortAscending
            ? $0.name < $1.name
            : $0.name > $1.name
        }
        
        return result
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
                // MARK: - Segmented Control
                
                Picker("Filter", selection: $showFavoritesOnly) {
                    Text("All").tag(false)
                    Text("Favorites").tag(true)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                // MARK: - Grid
                
                if filteredApps.isEmpty {
                    emptyStateView
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            
                            ForEach(filteredApps) { app in
                                AppCell(app: app)
                                    .animation(.easeInOut, value: filteredApps)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("LinkFlow")
            .searchable(text: $searchText)
            
            // MARK: - Toolbar
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sortAscending.toggle()
                    } label: {
                        Image(systemName: sortAscending ? "arrow.up" : "arrow.down")
                    }
                }
            }
        }
    }
    
    // MARK: - Empty State
    
    var emptyStateView: some View {
        VStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .font(.largeTitle)
                .foregroundColor(.gray)
            
            Text("No results found")
                .font(.headline)
            
            Text("Try searching something else")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
