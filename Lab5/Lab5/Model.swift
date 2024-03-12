//
//  Model.swift
//  Lab5
//
//  Created by Rayhan Wilangkara on 3/11/24.
//

import Foundation
struct Movie: Identifiable {
    var id = UUID()
    var name: String
    var genre: String
    var imageName: String
    var description: String
}
