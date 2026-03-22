//
//  AppCell.swift
//  LinkFlow
//
//  Created by Vikram Kumar on 22/03/26.

import SwiftUI
//
struct AppCell: View {
    let app: AppItem
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: app.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue)
            
            Text(app.name)
                .font(.caption)
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(12)
    }
}
