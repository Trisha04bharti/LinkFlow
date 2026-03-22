//
//  AppItem.swift
//  LinkFlow
//
//  Created by Vikram Kumar on 22/03/26.
//
import Foundation

struct AppItem: Identifiable {
    let id = UUID()
    let name: String
    let url: String
    let icon: String
}
