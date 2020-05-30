//
//  Park.swift
//  Parks
//
//  Created by Austin Louden on 5/29/20.
//  Copyright © 2020 Austin Louden. All rights reserved.
//

import Foundation

struct Park: Decodable, Equatable, Identifiable {
    let id: String
    let fullName: String
    let description: String
}
