//
//  Movie.swift
//  iosmovie
//
//  Created by Nguyen Thanh phuoc on 2025/7/6.
//


import Foundation

struct Movie: Identifiable {
    let id: UUID = UUID()
    let title: String
    let posterURL: String
    let rating: Double
}
