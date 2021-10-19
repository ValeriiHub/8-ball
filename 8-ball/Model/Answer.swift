//
//  Answer.swift
//  8-ball
//
//  Created by Valerii Dulia on 19.10.2021.
//

import Foundation

// MARK: - Answer
struct Answer: Codable {
    let magic: Magic
}

// MARK: - Magic
struct Magic: Codable {
    let question, answer, type: String
}
