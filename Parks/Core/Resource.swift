//
//  Resource.swift
//  Parks
//
//  Created by Austin Louden on 5/29/20.
//  Copyright © 2020 Austin Louden. All rights reserved.
//

import Foundation
import TinyNetworking

final class Resource<A>: ObservableObject {
    let endpoint: Endpoint<A>
    @Published var value: A?
    init(endpoint: Endpoint<A>) {
        self.endpoint = endpoint
        load()
    }

    func load() {
        URLSession.shared.load(endpoint) { (result) in
            DispatchQueue.main.async {
                self.value = try? result.get()
            }
        }
    }
}
