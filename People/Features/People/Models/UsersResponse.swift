//
//  UsersResponse.swift
//  People
//
//  Created by Amby on 20/09/2022.
//

import Foundation

struct UsersResponse: Codable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support
}
