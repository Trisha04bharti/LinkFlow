//
//  ContentView.swift
//  LinkFlow
//
//  Created by Vikram Kumar on 22/03/26.
//



import SwiftUI

struct ContentView : View {
    
    let cl = [
        GridItem(.flexible(minimum: 60, maximum: 100)),
        GridItem(.flexible(minimum: 40, maximum: 100)),
        GridItem(.flexible(minimum: 100, maximum: 100)),
        
    ]
    
    let rows = [
        GridItem(.flexible(minimum: 50, maximum: 100)),
        GridItem(.fixed(100))
    ]
    
    var body: some View {
        ScrollView {
            
            
            LazyVGrid(columns: cl, spacing: 20){
                
                ForEach(0..<20){ index in
                    
                    Text("item : \(index)")
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color.brown)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                }
                
            }
            
            }
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows , spacing: 20) {
                ForEach(0..<30) { i in
                    Text("Item \(i)")
                        .frame(width: 90, height: 60, alignment: .center)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                }
            }
        }
        
        }
        
    
}

#Preview {
    ContentView()
}
