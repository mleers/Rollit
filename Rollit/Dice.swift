//
//  Dice.swift
//  Rollit
//
//  Created by Mitch on 1/22/23.
//

import Foundation

struct Dice: Codable, Identifiable {
    var id = UUID()
    let value: Int
    let sides: Int
    
    var results = [Int]()
    
    static let example = Dice(id: UUID(), value: 4, sides: 6)
}
