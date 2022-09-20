//
//  Models.swift
//  People
//
//  Created by Amby on 20/09/2022.
//

import Foundation

struct User: Codable {
    let id: Int?
    let email, firstName, lastName: String?
    let avatar: String?
}

struct Support: Codable {
    let url: String?
    let text: String?
}
