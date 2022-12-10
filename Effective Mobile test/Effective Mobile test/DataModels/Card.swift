//
//  Card.swift
//  Effective Mobile test
//
//  Created by Mikhail Chuparnov on 09.12.2022.
//

import Foundation

// MARK: - Welcome
struct Card: Codable {
    let basket: [BasketItem]
    let delivery, id: String
    let total: Int
}

// MARK: - Basket
struct BasketItem: Codable {
    let id: Int
    let images: String
    let price: Int
    let title: String
}
