//
//  AlamofirePractice.swift
//  Alamofire_Practice
//
//  Created by 황홍필 on 2023/05/19.
//

import Foundation

// MARK: - AlamofirePracticeElement
struct AlamofirePracticeElement: Codable {
    let category: Category
    let datetime: Int
    let headline: String
    let id: Int
    let image: String
    let related: Related
    let source, summary: String
    let url: String
}

enum Category: String, Codable {
    case company = "company"
}

enum Related: String, Codable {
    case aapl = "AAPL"
}

typealias AlamofirePractice = [AlamofirePracticeElement]
