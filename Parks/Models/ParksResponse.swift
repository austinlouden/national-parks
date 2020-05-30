//
//  ParksResponse.swift
//  Parks
//
//  Created by Austin Louden on 5/29/20.
//  Copyright © 2020 Austin Louden. All rights reserved.
//

import Foundation

struct ParksResponse: Decodable, Equatable {
    let total: String
    let limit: String
    let start: String
    let data: Array<Park>
}
